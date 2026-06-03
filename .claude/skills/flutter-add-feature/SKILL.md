---
name: flutter-add-feature
description: Receta end-to-end para añadir un feature/CRUD nuevo a este repo (rutas, endpoints, DTOs freezed, entities, repo abstracto + impl, provider, notifier, screen con AsyncValueView, registro en router, build_runner, analyze, test). Usar cuando el usuario pida "agrega CRUD de X", "crea pantalla Y conectada a Z", "implementa el módulo de W", "añade el endpoint /a/b/c", o cuando arranque una nueva fase del roadmap.
---

# Receta: añadir un feature nuevo

Sigue los pasos **en orden**. Cada paso tiene un comando o snippet aplicable.
Si el feature no necesita un paso (ej. no usa imagen) salta ese paso.

## 0. Lee el contexto

- `CLAUDE.md` §11 (roadmap) — confirma en qué fase encaja.
- `CLAUDE.md` §8 (convenciones API) — `branch_id`, fechas, manejo de 401.
- Spec original — endpoints exactos, payload, estados, filtros.

## 1. Constantes (rutas y endpoints)

### Ruta en `lib/core/router/routes.dart`

```dart
class AppRoutes {
  // ...
  static const String <feature> = '/<feature>';
}
```

### Endpoint en `lib/core/network/api_endpoints.dart`

```dart
class ApiEndpoints {
  // ...
  static const String <feature> = '/<feature>/';
  static String <feature>ById(int id) => '/<feature>/$id';
}
```

## 2. Capa data — DTOs freezed

`lib/features/<feature>/data/models/<feature>_dto.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
part '<feature>_dto.freezed.dart';
part '<feature>_dto.g.dart';

@freezed
class <Feature>Dto with _$<Feature>Dto {
  const factory <Feature>Dto({
    required int id,
    required String name,
    @JsonKey(name: 'branch_id') int? branchId,
  }) = _<Feature>Dto;

  factory <Feature>Dto.fromJson(Map<String, dynamic> json) =>
      _$<Feature>DtoFromJson(json);
}
```

Si tiene create/update con shape distinto al DTO de lectura, crea
`<feature>_create_dto.dart` y `<feature>_update_dto.dart` separados.

## 3. Capa domain — entity + repo abstracto

`lib/features/<feature>/domain/entities/<entity>.dart`

```dart
import '../../data/models/<feature>_dto.dart';

class <Entity> {
  const <Entity>({required this.id, required this.nombre, this.branchId});

  final int id;
  final String nombre;
  final int? branchId;

  factory <Entity>.fromDto(<Feature>Dto dto) => <Entity>(
        id: dto.id,
        nombre: dto.name,
        branchId: dto.branchId,
      );
}
```

`lib/features/<feature>/domain/<feature>_repository.dart`

```dart
import 'entities/<entity>.dart';

abstract class <Feature>Repository {
  Future<List<<Entity>>> list({int? branchId, String? search});
  Future<<Entity>> getById(int id);
  Future<<Entity>> create(...);   // tipos según la spec
  Future<<Entity>> update(int id, ...);
  Future<void> delete(int id);
}
```

## 4. Capa data — api + repo impl

`lib/features/<feature>/data/<feature>_api.dart`

```dart
import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/<feature>_dto.dart';

class <Feature>Api {
  <Feature>Api(this._dio);
  final Dio _dio;

  Future<List<<Feature>Dto>> list({int? branchId, String? search}) async {
    final res = await _dio.get<List<dynamic>>(
      ApiEndpoints.<feature>,
      queryParameters: {
        if (branchId != null) 'branch_id': branchId,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
    return res.data!
        .map((e) => <Feature>Dto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
  // ... resto
}
```

`lib/features/<feature>/data/<feature>_repository_impl.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../domain/<feature>_repository.dart';
import '../domain/entities/<entity>.dart';
import '<feature>_api.dart';

class <Feature>RepositoryImpl implements <Feature>Repository {
  <Feature>RepositoryImpl(this._api);
  final <Feature>Api _api;

  @override
  Future<List<<Entity>>> list({int? branchId, String? search}) async {
    final dtos = await _api.list(branchId: branchId, search: search);
    return dtos.map(<Entity>.fromDto).toList();
  }
  // ... resto
}

final <feature>RepositoryProvider = Provider<<Feature>Repository>(
  (ref) => <Feature>RepositoryImpl(<Feature>Api(ref.watch(dioProvider))),
);
```

## 5. Capa presentation — notifier + screen

`lib/features/<feature>/presentation/providers/<feature>_list_provider.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../branches/presentation/providers/branch_provider.dart'; // si aplica
import '../../data/<feature>_repository_impl.dart';
import '../../domain/entities/<entity>.dart';

final <feature>ListProvider = AsyncNotifierProvider.autoDispose<
    <Feature>ListNotifier, List<<Entity>>>(<Feature>ListNotifier.new);

class <Feature>ListNotifier extends AutoDisposeAsyncNotifier<List<<Entity>>> {
  String _search = '';

  @override
  Future<List<<Entity>>> build() async {
    final branchId = ref.watch(branchProvider);   // si el listado depende
    final repo = ref.read(<feature>RepositoryProvider);
    return repo.list(branchId: branchId, search: _search);
  }

  void setSearch(String value) {
    _search = value;
    ref.invalidateSelf();
  }
}
```

`lib/features/<feature>/presentation/screens/<feature>_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/organisms/app_data_table.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/presentation/organisms/filter_bar.dart';
import '../providers/<feature>_list_provider.dart';

class <Feature>Screen extends ConsumerWidget {
  const <Feature>Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(<feature>ListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('<Feature>')),
      body: Column(
        children: [
          FilterBar(
            searchHint: 'Buscar <feature>…',
            onSearchChanged: (v) =>
                ref.read(<feature>ListProvider.notifier).setSearch(v),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => ref.invalidate(<feature>ListProvider),
              child: AsyncValueView<List<<Entity>>>(
                value: state,
                onRetry: () => ref.invalidate(<feature>ListProvider),
                builder: (items) => AppDataTable<<Entity>>(
                  rows: items,
                  columns: [
                    AppDataColumn(label: 'ID', cellBuilder: (i) => Text('${i.id}')),
                    AppDataColumn(label: 'Nombre', cellBuilder: (i) => Text(i.nombre)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## 6. Registrar la ruta

`lib/core/router/app_router.dart`

```dart
GoRoute(
  path: AppRoutes.<feature>,
  builder: (_, __) => const <Feature>Screen(),
),
```

Si el feature está dentro del shell autenticado y tiene permiso, declararlo en
la entrada de menú con `requiredPermission: '<feature>:view'`.

## 7. Generar freezed/json_serializable

```bash
dart run build_runner build --delete-conflicting-outputs
```

Si añades más DTOs después, vuelve a correrlo. Alternativa para dev:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## 8. Validar

```bash
flutter analyze   # 0 issues
flutter test      # all green
```

En esta máquina: `C:\flutter\bin\flutter.bat analyze`.

## 9. Test mínimo del repo (mocktail)

`test/features/<feature>/<feature>_repository_test.dart`

```dart
import 'package:elashes/features/<feature>/data/<feature>_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _ApiMock extends Mock implements <Feature>Api {}

void main() {
  test('list mapea DTOs a entities', () async {
    final api = _ApiMock();
    when(() => api.list(branchId: any(named: 'branchId')))
        .thenAnswer((_) async => [
              const <Feature>Dto(id: 1, name: 'Ana'),
              const <Feature>Dto(id: 2, name: 'Lucía'),
            ]);

    final repo = <Feature>RepositoryImpl(api);
    final result = await repo.list(branchId: 7);

    expect(result, hasLength(2));
    expect(result.first.nombre, 'Ana');
  });
}
```

## 10. Actualizar `CLAUDE.md` (cuando cierre la fase)

- §11 roadmap: marcar la fase como ✅ con una línea de resumen.

## Checklist final

- [ ] Ruta declarada en `AppRoutes`.
- [ ] Endpoint declarado en `ApiEndpoints`.
- [ ] DTO + Entity + Repo abstracto + API + Repo impl creados.
- [ ] Provider del repo y notifier creados.
- [ ] Screen usa `AsyncValueView` con `onRetry`.
- [ ] Ruta registrada en `app_router.dart`.
- [ ] `dart run build_runner build --delete-conflicting-outputs` corrido.
- [ ] `flutter analyze` limpio.
- [ ] `flutter test` verde con test del repo (al menos).
- [ ] Sin `print`, sin `setState` para datos del servidor, sin strings de endpoint inline.
- [ ] Permisos del menú actualizados si aplica.

## Ver también

- Skill `flutter-clean-architecture` — para entender por qué de cada capa.
- Skill `flutter-riverpod-patterns` — para la capa presentation.
- Skill `flutter-atomic-design` — para los widgets específicos del feature.
- Skill `flutter-elashes-conventions` — convenciones que no caben en este recipe.
