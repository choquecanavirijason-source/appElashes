# CLAUDE.md — Guía para asistentes en este repo

Este archivo se carga automáticamente en el contexto de cualquier sesión de
Claude Code abierta sobre este proyecto. Léelo antes de cualquier cambio.

---

## 1. Qué es este proyecto

**elashes** es la app Flutter móvil/tablet de **reservas y control de citas**
de un salón de belleza. Consume el backend FastAPI `elashesbackend` (API REST,
multi-sucursal). El foco actual son los flujos de cliente y staff alrededor
de la agenda: reservar, ver mis citas, gestionar disponibilidad.

- **Estado actual:** Fase 0 (Bootstrap) terminada con login rediseñado.
  **Auth deshabilitada temporalmente** (ver §9). Próximo: Fase 1.
- **Plan completo de fases:** ver sección "Roadmap por fases" abajo.
- **Tono de copy:** cliente final ("Comienza tu viaje de belleza"). El admin
  panel completo de la spec original queda como horizonte lejano; por ahora
  priorizamos UX de reservas.

---

## 2. Stack fijo — no negociar

| Capa | Tecnología | Versión |
|------|------------|---------|
| Lenguaje | Dart (null-safe estricto) | ^3.5 |
| Framework | Flutter | ≥3.24 |
| Estado | `flutter_riverpod` (`AsyncNotifier` / `Notifier`) | ^2.5 |
| HTTP | `dio` | ^5.7 |
| Navegación | `go_router` con `refreshListenable` | ^14.6 |
| Persistencia segura | `flutter_secure_storage` (key `"_tkn"`) | ^9.2 |
| Prefs | `shared_preferences` | ^2.3 |
| Config entorno | `flutter_dotenv` (`.env`) | ^5.2 |
| Serialización | `freezed` + `json_serializable` | ^2.5 / ^6.8 |
| UI | Material 3 + `google_fonts` (Inter) | — |
| Tablas | `data_table_2` | ^2.5 |
| Gráficos | `fl_chart` | ^0.69 |
| Imágenes red | `cached_network_image` | ^3.4 |
| Picker | `image_picker` | ^1.1 |
| Iconos | `lucide_icons` + Material | ^0.257 |
| PDF (Dart puro) | `pdf` | ^3.11 |
| Tests | `flutter_test` + `mocktail` | — |
| Lints | `flutter_lints` estricto (ver `analysis_options.yaml`) | ^6.0 |

### Restricciones — no hacer

- Nada de `http`, `provider`, `bloc`, `getx`, `mobx`. Solo `dio` + `flutter_riverpod`.
- Nada de `Navigator.push` directo. Todo por `go_router` + constantes de `AppRoutes`.
- Nada de `setState` para datos de servidor. Solo para UI puramente local.
- Nada de strings de endpoint inline. Todos en `ApiEndpoints`.
- Nada de `catch (_)` genéricos. Captura `DioException` u otro tipo concreto.
- Nada de `print()`. Usa `developer.log(message, name: 'feature.subfeature')`.
- Nada de colores hardcodeados en widgets. Tira de `Theme.of(context).colorScheme`
  o `AppColors.*`.
- **No agregues `printing` al pubspec** hasta Fase 6: fija AGP 7.3.0 y la red
  bloquea `dl.google.com` (ver pubspec.yaml para el comentario completo).

---

## 3. Arquitectura — Clean Architecture + Atomic Design

```
lib/
├── main.dart                              # carga .env + prefs + ProviderScope
├── app.dart                               # MaterialApp.router + tema M3
│
├── core/                                  # transversal, sin lógica de feature
│   ├── config/env.dart                    # lee .env vía flutter_dotenv
│   ├── error/
│   │   ├── api_exception.dart             # mapea DioException → ApiException
│   │   └── failure.dart
│   ├── storage/
│   │   ├── secure_storage.dart            # token "_tkn"
│   │   └── prefs_storage.dart             # selected_branch_id
│   ├── network/
│   │   ├── api_endpoints.dart             # constantes de TODOS los endpoints
│   │   ├── dio_client.dart                # Dio + 3 interceptores
│   │   └── interceptors/
│   │       ├── auth_interceptor.dart      # Bearer + 401 → markSignedOut
│   │       ├── error_interceptor.dart     # DioException → ApiException
│   │       └── logging_interceptor.dart   # developer.log (sólo dev)
│   ├── theme/
│   │   ├── app_colors.dart                # #094732 marca, #031910 sidebar, estados
│   │   ├── text_styles.dart               # Inter
│   │   └── app_theme.dart                 # ColorScheme.fromSeed + dark mode
│   ├── router/
│   │   ├── routes.dart                    # AppRoutes — constantes de rutas
│   │   ├── guards.dart                    # sessionRedirect
│   │   └── app_router.dart                # GoRouter + refreshListenable
│   └── presentation/                      # ATOMIC DESIGN — UI compartida
│       ├── atoms/                         # piezas mínimas (icon_badge, etc.)
│       ├── molecules/                     # combinaciones simples (stat_card, search_field)
│       ├── organisms/                     # composiciones complejas (data_table, filter_bar,
│       │                                  # loader_screen, empty_state, async_value_view,
│       │                                  # confirm_dialog)
│       └── templates/                     # layouts de página (se llenan en Fase 1+)
│
├── features/                              # CLEAN ARCH por feature
│   └── <feature>/
│       ├── data/
│       │   ├── models/                    # DTOs freezed (snake_case API)
│       │   ├── <feature>_api.dart         # llamadas Dio raw
│       │   └── <feature>_repository_impl.dart
│       ├── domain/
│       │   ├── entities/                  # modelos UI mapeados desde DTOs
│       │   └── <feature>_repository.dart  # abstract class
│       └── presentation/
│           ├── providers/                 # Riverpod notifiers
│           ├── screens/                   # pages (atomic design)
│           └── widgets/                   # organisms específicos del feature
│
└── shared/
    └── enums/                             # ClientStatus, PaymentMethod, DiscountType, etc.
```

### Reglas de dependencias

- `core/` no importa nada de `features/`. **Excepción documentada:**
  `core/network/dio_client.dart` importa `features/auth/.../auth_state_provider.dart`
  porque el interceptor 401 necesita marcar la sesión expirada.
- Un feature solo puede importar de `core/` y `shared/`. No importar otro feature.
- `presentation` importa de `domain` y `data`. `domain` no importa de `data` ni
  `presentation`. `data` no importa de `presentation`.

### Atomic Design — guía rápida

| Nivel | Qué va aquí | Ejemplo |
|-------|-------------|---------|
| `atoms/` | Pieza visual mínima, ningún estado de negocio. | `IconBadge`, `PrimaryButton`, `SectionTitle` |
| `molecules/` | 2-3 atoms combinados con un propósito específico. | `StatCard`, `SearchField`, `LabeledTextField` |
| `organisms/` | Composiciones complejas, frecuentemente con su propio estado interno o varios molecules. | `AppDataTable`, `FilterBar`, `EmptyState`, `LoaderScreen`, `AsyncValueView`, `ConfirmDialog` |
| `templates/` | Layouts de página sin contenido concreto (slots). | `ListPageTemplate`, `DetailPageTemplate` |
| `pages/` | Pantallas reales — viven en `features/<feature>/presentation/screens/`. | `LoginScreen`, `ClientsScreen` |

**Si no estás seguro:** un widget que solo dibuja → atom. Un widget que combina
2-3 atoms → molecule. Si tiene estado, carga datos, o usa varios molecules →
organism. **No crees atoms vacíos por adelantado**; agrega cuando aparezca el
segundo uso real.

---

## 4. Patrones de código — referencia

### DTO (freezed) en `data/models/`

```dart
@freezed
class ClientDto with _$ClientDto {
  const factory ClientDto({
    required int id,
    required String name,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'visit_count') @Default(0) int visitCount,
    @Default('sin_estado') String status,
  }) = _ClientDto;
  factory ClientDto.fromJson(Map<String, dynamic> json) =>
      _$ClientDtoFromJson(json);
}
```

### Entity UI en `domain/entities/`

```dart
class Client {
  const Client({required this.id, required this.nombre, ...});
  factory Client.fromDto(ClientDto dto) => Client(
        id: dto.id,
        nombre: dto.name,
        ...
      );
}
```

### Repository abstracto en `domain/`

```dart
abstract class ClientsRepository {
  Future<List<Client>> list({int? branchId, String? search});
}
```

### Notifier en `presentation/providers/`

```dart
class ClientsListNotifier extends AutoDisposeAsyncNotifier<List<Client>> {
  @override
  Future<List<Client>> build() async {
    final branchId = ref.watch(branchProvider).selectedBranchId;
    return ref.read(clientsRepositoryProvider).list(branchId: branchId);
  }
}
```

### Screen en `presentation/screens/`

```dart
class ClientsScreen extends ConsumerWidget {
  const ClientsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clientsListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Clientes')),
      body: AsyncValueView<List<Client>>(
        value: state,
        onRetry: () => ref.invalidate(clientsListProvider),
        builder: (clientes) => AppDataTable<Client>(rows: clientes, columns: [...]),
      ),
    );
  }
}
```

---

## 5. Convenciones de naming

- Archivos: `snake_case.dart`.
- Clases: `PascalCase`.
- Métodos / vars: `camelCase`.
- DTOs: `<Feature>Dto`, `<Feature>CreateDto`, `<Feature>UpdateDto`.
- Entities UI: nombre singular sin sufijo (`Client`, `Ticket`).
- Repo abstracto: `<Feature>Repository` en `domain/`.
- Implementación: `<Feature>RepositoryImpl` en `data/`.
- Providers: sufijo `Provider` (`clientsRepositoryProvider`).
- Notifiers: `<Thing>Notifier`.
- Rutas: agregar a `AppRoutes` (`core/router/routes.dart`).
- Endpoints: agregar a `ApiEndpoints` (`core/network/api_endpoints.dart`).

---

## 6. Comandos del proyecto

```bash
flutter pub get                                                  # resolver deps
dart run build_runner build --delete-conflicting-outputs         # generar freezed/json_serializable
dart run build_runner watch --delete-conflicting-outputs         # watch (dev)
flutter analyze                                                  # lint + tipo
flutter test                                                     # tests
flutter run                                                      # device conectado
```

El flutter CLI en esta máquina vive en `C:\flutter\bin\flutter.bat` (no está en
PATH — invocar con ruta completa cuando ejecutes vía PowerShell desde un agente).

---

## 7. Skills de Claude Code recomendados

### 7.1 Skills locales del proyecto (auto-cargados)

Viven en `.claude/skills/<name>/SKILL.md`. Se cargan automáticamente cuando su
descripción matchea la tarea actual. **Invócalos proactivamente** antes de cualquier
cambio significativo:

| Skill | Cuándo se activa |
|-------|-------------------|
| `flutter-atomic-design` | Crear/extraer/refactorizar widgets — decidir atom vs molecule vs organism, dónde colocarlos. |
| `flutter-clean-architecture` | Crear feature, conectar endpoint, separar lógica entre data/domain/presentation, mapear DTO ↔ entity. |
| `flutter-riverpod-patterns` | Crear notifiers/providers, debounce, invalidación al cambiar sucursal, side-effects con `ref.listen`, adapter Listenable para go_router. |
| `flutter-add-feature` | Receta end-to-end: rutas → endpoints → DTOs → entity → repo → api → impl → provider → notifier → screen → router → build_runner → test. Usar al pedir "agrega CRUD de X" o iniciar una fase. |
| `flutter-elashes-conventions` | Convenciones específicas del repo (auth, 401, branch_id, es_BO/BOB, estados enum, naming, lints, dependencias prohibidas). Revisar antes de cualquier cambio. |

### 7.2 Skills globales del harness útiles aquí

| Skill | Cuándo invocarlo |
|-------|-------------------|
| `flutter-ui-ux` | Maestro para cualquier pantalla nueva, mejorar UX, accesibilidad, animaciones. |
| `flutter-theme` | Tocar `core/theme/`, agregar colores de marca, dark mode, tipografía. |
| `flutter-responsive` | Layouts móvil + tablet (NavigationRail vs Drawer en Fase 1, agenda diaria con columnas en Fase 5). |
| `flutter-widgets` | Plantilla genérica para widgets reusables — complementa `flutter-atomic-design`. |
| `verify` | Confirmar que un cambio funciona corriendo la app — no solo `flutter analyze`. |
| `simplify` | Tras escribir código nuevo, revisar reuso/calidad antes de cerrar la tarea. |
| `review` | Revisión de PR completa. |
| `security-review` | Cuando se toquen auth, storage o endpoints sensibles. |

**No uses** `fastapi-structure` ni `react-structure` aquí (son otros proyectos).
`claude-api` solo aplica si en algún momento se integra el SDK de Anthropic
(no contemplado por ahora).

---

## 8. Convenciones de API ya implementadas

- **Auth header:** `Authorization: Bearer <token>` añadido automáticamente por
  `AuthInterceptor` salvo que el request marque `extra: {'skipAuth': true}`.
- **Errores FastAPI:** `{"detail": "..."}` → `ApiException.message`.
  Lista de errores 422 → unidos por `\n`. Dict → `errors` mapa de campo→msg.
- **401:** el interceptor borra el token y llama
  `authStateProvider.notifier.markSignedOut()`. El router (que escucha al
  notifier vía `refreshListenable`) redirige a `/login`. Las pantallas
  **no** duplican este manejo.
- **Sin red:** `DioExceptionType.connectionError|connectionTimeout|...` →
  `ApiException(message: 'Sin conexión a internet', isNetwork: true)`.
- **`branch_id`:** cuando exista la sucursal seleccionada, los listados deben
  pasarlo como query param. Hacer `ref.invalidate(...)` de los listados al
  cambiar sucursal.
- **Fechas en payload:** ISO 8601 local sin zona (`2026-05-20T10:00:00`).
- **Fechas en respuesta:** `DateTime.parse(...)`, mostrar con
  `DateFormat('dd/MM/yyyy HH:mm', 'es_BO')`.
- **Moneda:** BOB / símbolo "Bs", locale `es_BO`.

---

## 9. Auth flow al arrancar

### Estado actual: AUTH DESACTIVADA

- `initialLocation` del router = `/login`.
- `sessionRedirect` devuelve `null` para toda ruta (lógica original comentada
  en `lib/core/router/guards.dart`).
- El botón "Iniciar Sesión" del `LoginScreen` llama `context.go(AppRoutes.dashboard)`
  sin validar credenciales ni tocar el `authStateProvider`.
- El botón de logout en el `AppShell` simplemente vuelve a `/login`.
- `AuthInterceptor`, `SecureStorage`, `AuthStateController` siguen existiendo
  pero no se ejercitan. Cuando la auth vuelva, restaurar la lógica original.

### Flujo cuando se reactive (referencia)

1. `main()` → carga `.env`, instancia `SharedPreferences`, monta `ProviderScope`.
2. `ElashesApp` watchea `dioProvider` (para que el interceptor quede armado
   antes del primer redirect) y `goRouterProvider`.
3. Router arranca en `/splash` (revertir `initialLocation`).
4. `SplashScreen.initState` programa `hydrate()` en `postFrameCallback`.
5. `hydrate()` llama `GET /auth/me`. Si 200 → autenticado con `AuthUser`
   cargado. Si 401 → borra token + `/login`.
6. `sessionRedirect` original (comentado en `guards.dart`) reactivado.

---

## 10. Estados de ticket/cliente (string exactos del API)

```
reserva | en_espera | en_servicio | siendo_atendido | atendido | pagado |
finalizado | cancelado | no_se_presento | reagendado | sin_estado
```

Definir como `enum ClientStatus` (en `shared/enums/`) con extensión
`displayName` y color de `AppColors.status*`.

Otros enums obligatorios:
- `PaymentMethod`: `cash | card | transfer | qr`
- `DiscountType`: `amount | percent`
- `QuestionType`: `text | number | bool | select | multi_select`

---

## 11. Roadmap por fases

| Fase | Contenido | Estado |
|------|-----------|--------|
| **0 — Bootstrap** | pubspec, theme M3, dio + interceptores, storage, error, router, widgets base atomic design, splash decisor, placeholders. Login rediseñado al mock del salón (verde + curva + foto). Auth desactivada temporalmente. | ✅ |
| **1 — Reservar + Mis citas (cliente)** | Tabs reales del shell: Inicio (servicios destacados), Reservar (flujo categoría → servicio → fecha → confirmación), Mis citas (lista próximas/pasadas), Perfil. Sin gráficos. | ⏳ |
| **Auth (diferida)** | Restaurar `initialLocation = /splash`, `sessionRedirect` real, `LoginScreen` cableado a `POST /auth/login` + `GET /auth/me`. Reactivar cuando lo pida el usuario. | 🔒 |
| **2 — Clientes + Catálogos** | CRUD `/clients/` con tabla, búsqueda debounced, paginación, tab Frecuentes, export PDF. Catálogos `/catalogs/*` vía pantalla genérica `CatalogScreen<T>`. | — |
| **3 — Servicios + Categorías** | `/agenda/services` y `/services/categories` con upload multipart. Pantalla con tabs. | — |
| **4 — Tickets + Cola + Turnos** | Listado, filtros, cambio de estado. Cola operativa. TurnScreen fullscreen. | — |
| **5 — Calendario + Agenda del día** | Vista mensual + agenda del día con columnas por profesional. | — |
| **6 — POS completo** | Flujo de venta, borrador local, historial, cancelación, PDF (`pdf` + reintroducir `printing` o alternativa `share_plus` si la red sigue bloqueando dl.google.com). | — |
| **7 — Inventario** | `/inventory/*` con alertas stock bajo. | — |
| **8 — Dashboard avanzado** | Gráficos `fl_chart`, export PDF/CSV. | — |
| **9 — Usuarios/Roles + Cuestionarios + Tracking + Ajustes** | Cierre de spec. | — |

Cada fase debe terminar con: lista de archivos, comando de `build_runner` si
aplica, tests añadidos, `flutter analyze` limpio. Marcar avance en este archivo.

---

## 12. Issues conocidos

- **`dl.google.com:443` bloqueado** en esta máquina (firewall/VPN/ISP). Por eso
  `printing` se sacó del pubspec. Otros plugins que requieran versiones
  específicas de AGP que no estén en cache van a fallar igual hasta arreglar
  la red. Probar: apagar VPN, cambiar DNS a 1.1.1.1, intentar con hotspot.
- **`.env`** está en assets y se commitea como plantilla (sin credenciales
  reales). Si en producción hay secretos, mover a `--dart-define` o
  `.env.production` separado.

---

## 13. Cómo extender este archivo

- Cierre de fase → mover la fase a "✅" y resumir lo entregado en una línea.
- Decisión arquitectural nueva → sección 3 (o sub-archivo `docs/adr/NNN.md`).
- Workaround temporal → sección 12 con fecha y motivo.
- Skill nuevo descubierto que ayude → sección 7.
