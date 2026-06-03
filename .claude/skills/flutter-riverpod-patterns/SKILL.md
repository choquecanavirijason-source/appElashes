---
name: flutter-riverpod-patterns
description: Patrones flutter_riverpod 2.x para este repo — cuándo usar Notifier vs AsyncNotifier vs Provider, watch vs read vs listen, autoDispose, ref.invalidate al cambiar sucursal/filtros, override de SharedPreferences en main, Listenable adapters para go_router refreshListenable, AsyncValueView. Usar al crear/modificar estado de pantalla, cargar datos del servidor, debounce de búsqueda, side-effects (snackbars, navegación tras login), o invalidación coordinada de varios providers.
---

# Riverpod en elashes

## Cuándo invocar este skill

- "Crea el provider/notifier de X"
- "La lista no se refresca al cambiar de sucursal"
- "Quiero debounce en la búsqueda"
- "Cómo paso datos del login a la pantalla siguiente"
- "Esto necesita un side-effect (snackbar, dialog) cuando el estado cambia"

## Decisión: qué tipo de provider uso

```
¿Es un valor constante o un servicio sin estado mutable
(repo, api, dio, secure storage)?
        → Provider<T>

¿Es estado sincrono mutable
(branchId seleccionado, tab activo, toggle UI)?
        → NotifierProvider<N, T>  o  StateProvider<T> para algo trivial

¿Carga datos async del servidor?
        → AsyncNotifierProvider<N, T>  (o .autoDispose si la pantalla puede salir)

¿Stream del servidor (WebSocket, Firestore)?
        → StreamProvider / StreamNotifierProvider
```

**Default en este repo:** `AsyncNotifierProvider.autoDispose` para listados,
`NotifierProvider` para estado UI persistente (auth, branch selector).

## Reglas de oro

1. **`ref.watch(...)` dentro de `build()`** — declara dependencias reactivas.
2. **`ref.read(...)` solo en callbacks** (onPressed, onChanged) — lectura puntual.
3. **`ref.listen(...)` para side-effects** — snackbars, navegación, logging.
4. **Nunca `ref.read` en `build()`** — pierdes reactividad.
5. **Nunca `ref.watch` en callbacks** — fuga de memoria y rebuilds extra.
6. **`autoDispose`** cuando la pantalla puede salir del árbol (90% de listados).
7. **`ref.invalidate(provider)`** para forzar recompute. **`ref.refresh(provider)`** si
   necesitas la nueva `Future` inmediatamente.

## Plantillas

### Provider: repositorio (sin estado)

```dart
final clientsRepositoryProvider = Provider<ClientsRepository>((ref) {
  return ClientsRepositoryImpl(ClientsApi(ref.watch(dioProvider)));
});
```

### NotifierProvider: estado UI persistente (auth, branch)

```dart
class BranchController extends Notifier<int?> {
  @override
  int? build() => ref.read(prefsStorageProvider).selectedBranchId;

  Future<void> select(int? id) async {
    await ref.read(prefsStorageProvider).setSelectedBranchId(id);
    state = id;
  }
}

final branchProvider =
    NotifierProvider<BranchController, int?>(BranchController.new);
```

### AsyncNotifierProvider.autoDispose: listado del servidor

```dart
final clientsListProvider = AsyncNotifierProvider.autoDispose<
    ClientsListNotifier, List<Client>>(ClientsListNotifier.new);

class ClientsListNotifier extends AutoDisposeAsyncNotifier<List<Client>> {
  String _search = '';

  @override
  Future<List<Client>> build() async {
    // watch → cuando cambia la sucursal, este provider se reconstruye
    final branchId = ref.watch(branchProvider);
    final repo = ref.read(clientsRepositoryProvider);
    return repo.list(branchId: branchId, search: _search);
  }

  Future<void> setSearch(String value) async {
    _search = value;
    ref.invalidateSelf();
  }
}
```

### Override de SharedPreferences (patrón clave)

`sharedPreferencesProvider` lanza `UnimplementedError` por defecto. En `main()`:

```dart
final prefs = await SharedPreferences.getInstance();
runApp(
  ProviderScope(
    overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    child: const ElashesApp(),
  ),
);
```

Esto evita providers async + permite mockear fácilmente en tests.

### Listenable adapter para go_router

Cuando un provider debe disparar `refreshListenable` del router, el notifier
implementa `Listenable`:

```dart
class AuthStateController extends Notifier<AuthStatus> implements Listenable {
  final _ticker = ValueNotifier<int>(0);

  @override
  AuthStatus build() {
    ref.onDispose(_ticker.dispose);
    return AuthStatus.initial;
  }

  void _set(AuthStatus next) {
    if (state == next) return;
    state = next;
    _ticker.value++;
  }

  @override
  void addListener(VoidCallback l) => _ticker.addListener(l);
  @override
  void removeListener(VoidCallback l) => _ticker.removeListener(l);
}

// Router:
GoRouter(
  refreshListenable: ref.watch(authStateProvider.notifier),
  redirect: (...) => sessionRedirect(state, ref.read(authStateProvider)),
  ...
);
```

### Side-effects con ref.listen

```dart
class LoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(loginActionProvider, (prev, next) {
      next.whenOrNull(
        error: (e, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((e as ApiException).message)),
        ),
        data: (_) => context.go(AppRoutes.dashboard),
      );
    });
    // ... resto del build
  }
}
```

### Debounce en búsqueda

```dart
class ClientsListNotifier extends AutoDisposeAsyncNotifier<List<Client>> {
  Timer? _debounce;
  String _search = '';

  void setSearch(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      _search = value;
      ref.invalidateSelf();
    });
  }

  @override
  Future<List<Client>> build() async {
    ref.onDispose(() => _debounce?.cancel());
    final branchId = ref.watch(branchProvider);
    return ref.read(clientsRepositoryProvider).list(
          branchId: branchId,
          search: _search,
        );
  }
}
```

## Invalidación coordinada al cambiar de sucursal

El `branchProvider` cambia → cada provider de listado que hace `ref.watch(branchProvider)`
en su `build()` se recompone automáticamente. **No** llames `ref.invalidate` manual en
cada uno; el watch es suficiente.

Listados que deben watch-ear branch: clients, services, tickets, pos-sales, dashboard
overview, inventory.

## Tests

```dart
final container = ProviderContainer(
  overrides: [
    sharedPreferencesProvider.overrideWithValue(mockPrefs),
    clientsRepositoryProvider.overrideWith((ref) => MockClientsRepo()),
  ],
);
addTearDown(container.dispose);
final state = await container.read(clientsListProvider.future);
expect(state, hasLength(3));
```

## Anti-patrones

- ❌ `setState` para datos del servidor — todo va a provider.
- ❌ `ref.read` dentro de `build()` (pierde reactividad).
- ❌ `ref.watch` dentro de un `onPressed` (rebuild infinito).
- ❌ `FutureProvider((ref) async { ... })` con lógica que merece un notifier — usa
  `AsyncNotifier` desde el inicio.
- ❌ Notifier que guarda estado mutable en campos sin actualizar `state` ni invalidar.
- ❌ `ref.refresh` cuando solo quieres invalidar (refresh devuelve la nueva Future, eso
  cuesta una llamada extra si no lo usas).
- ❌ Provider de Dio recreado en cada watch del notifier (usar `dioProvider` único).

## Checklist al cerrar el provider

- [ ] Tipo de provider correcto según la tabla de decisión.
- [ ] `autoDispose` si la pantalla puede salir del árbol.
- [ ] `ref.watch` de dependencias que deben re-disparar (branch, filtros globales).
- [ ] Mutaciones llaman `ref.invalidateSelf()` o `state = ...` según corresponda.
- [ ] Recursos limpios con `ref.onDispose(...)`.
- [ ] Sin `ref.read` en `build()` ni `ref.watch` en callbacks.

## Ver también

- `CLAUDE.md` §4 — patrones de provider/notifier/screen.
- Skill `flutter-clean-architecture` — para la capa de repos que el notifier consume.
- Skill `flutter-add-feature` — receta completa.
