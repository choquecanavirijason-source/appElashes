---
name: flutter-clean-architecture
description: Estructurar features Flutter en tres capas (data DTOs+api, domain entities+repos abstractos, presentation providers+screens+widgets). Usar al crear un feature nuevo, al añadir un endpoint/CRUD, al refactorizar lógica que cruza pantalla y red, al decidir si algo va en data/domain/presentation, al mapear DTO snake_case → entity UI en español/camelCase, al introducir un repositorio abstracto, o cuando aparezca lógica de negocio en un widget.
---

# Clean Architecture en elashes

## Cuándo invocar este skill

- "Agrega CRUD para X" / "Crea pantalla de Y" / "Conecta con endpoint Z"
- "Refactoriza esto, hay lógica en el widget" / "Separa la red de la UI"
- "Mapea el DTO X a un modelo UI" / "Crea el repositorio de Y"

## Tres capas, una regla

```
presentation ──depende de──> domain  <──depende de── data
                       (entities, abstract repo)
```

- `presentation/` (screens, widgets, providers) **no** importa `data/`.
- `data/` (DTOs, api, repo impl) implementa contratos definidos en `domain/`.
- `domain/` no importa de `data/` ni `presentation/`. Solo Dart puro + tipos compartidos.

## Carpetas por feature

```
lib/features/<feature>/
├── data/
│   ├── models/                  # DTOs freezed con snake_case (JSON crudo del API)
│   │   ├── <feature>_dto.dart
│   │   ├── <feature>_create_dto.dart
│   │   └── <feature>_update_dto.dart
│   ├── <feature>_api.dart       # llamadas Dio que devuelven DTOs
│   └── <feature>_repository_impl.dart  # implementa el repo del domain
├── domain/
│   ├── entities/                # modelos UI (camelCase, español permitido)
│   │   └── <entity>.dart        # con factory fromDto()
│   └── <feature>_repository.dart  # abstract class
└── presentation/
    ├── providers/               # Riverpod providers + notifiers
    ├── screens/                 # pages (atomic design)
    └── widgets/                 # widgets específicos del feature (no reutilizables fuera)
```

## Flujo de una petición — ejemplo Clients

```
ClientsScreen
   │ ref.watch(clientsListProvider)
   ▼
ClientsListNotifier (presentation/providers)
   │ ref.read(clientsRepositoryProvider).list(branchId: ...)
   ▼
ClientsRepositoryImpl (data/clients_repository_impl.dart)
   │ ClientsApi(dio).list(...)
   ▼
ClientsApi.list(...) (data/clients_api.dart)
   │ dio.get('/clients/?branch_id=...')
   ▼
List<ClientDto>  (data/models/client_dto.dart, freezed + json_serializable)
   │ map a entity:  Client.fromDto(dto)
   ▼
List<Client>  (domain/entities/client.dart)
   │ devolver al notifier → state
   ▼
ClientsScreen renderiza con AsyncValueView<List<Client>>
```

## Templates de archivo

### data/models/<feature>_dto.dart

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part '<feature>_dto.freezed.dart';
part '<feature>_dto.g.dart';

@freezed
class <Feature>Dto with _$<Feature>Dto {
  const factory <Feature>Dto({
    required int id,
    required String name,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'visit_count') @Default(0) int visitCount,
    @Default('sin_estado') String status,
  }) = _<Feature>Dto;

  factory <Feature>Dto.fromJson(Map<String, dynamic> json) =>
      _$<Feature>DtoFromJson(json);
}
```

### domain/entities/<entity>.dart

```dart
import '../../data/models/<feature>_dto.dart';

class <Entity> {
  const <Entity>({
    required this.id,
    required this.nombre,
    this.apellido,
    required this.visitas,
  });

  final int id;
  final String nombre;
  final String? apellido;
  final int visitas;

  bool get esFrecuente => visitas > 5;

  factory <Entity>.fromDto(<Feature>Dto dto) => <Entity>(
        id: dto.id,
        nombre: dto.name,
        apellido: dto.lastName,
        visitas: dto.visitCount,
      );
}
```

### domain/<feature>_repository.dart

```dart
import 'entities/<entity>.dart';

abstract class <Feature>Repository {
  Future<List<<Entity>>> list({int? branchId, String? search});
  Future<<Entity>> getById(int id);
  Future<<Entity>> create(<Feature>CreateInput input);
  Future<<Entity>> update(int id, <Feature>UpdateInput input);
  Future<void> delete(int id);
}
```

### data/<feature>_api.dart

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
}
```

### data/<feature>_repository_impl.dart

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

final <feature>RepositoryProvider = Provider<<Feature>Repository>((ref) {
  return <Feature>RepositoryImpl(<Feature>Api(ref.watch(dioProvider)));
});
```

## Reglas duras

1. **El repo abstracto vive en `domain/`** — la implementación, en `data/`. La UI
   solo conoce el abstracto.
2. **DTOs nunca cruzan a `presentation/`.** Mapea siempre con `Entity.fromDto(dto)`
   antes de devolver del repo.
3. **`api/` devuelve DTOs, no entities.** El mapeo lo hace `RepositoryImpl`.
4. **Sin lógica de red ni mapeos en widgets.** El widget solo `ref.watch(...)` y dibuja.
5. **Endpoints siempre en `core/network/api_endpoints.dart`** — nunca string inline.
6. **Excepción documentada al "core no importa features":** `core/network/dio_client.dart`
   importa `features/auth/.../auth_state_provider.dart` para que el interceptor 401
   pueda llamar `markSignedOut()`. Es la única excepción permitida.

## Anti-patrones

- ❌ `Future<Response> getClients()` en un screen.
- ❌ Pasar DTOs a widgets / providers de UI.
- ❌ `if (response.statusCode == 401) ...` en una pantalla — el interceptor ya lo maneja.
- ❌ Crear `domain/` que importe `data/`.
- ❌ Importar de otro feature (`features/clients/...` desde `features/pos/...`).
- ❌ Lógica condicional de negocio dentro de un `cellBuilder` de tabla — exponer un
  computed en la entity (`esFrecuente`).

## Checklist al cerrar el feature

- [ ] DTO + entity + repo abstracto + api + repo impl creados.
- [ ] Endpoint constante añadido a `ApiEndpoints`.
- [ ] Provider de repo creado y usado por el notifier.
- [ ] Notifier devuelve entities (nunca DTOs).
- [ ] Screen usa `AsyncValueView` con `onRetry` cableado a `ref.invalidate`.
- [ ] Ruta añadida a `AppRoutes` y registrada en `app_router.dart`.
- [ ] Permiso (si aplica) declarado en la entrada de menú correspondiente.
- [ ] `dart run build_runner build --delete-conflicting-outputs` ejecutado.
- [ ] `flutter analyze` limpio + tests.

## Ver también

- `CLAUDE.md` §3 (estructura) y §4 (patrones de código).
- Skill `flutter-add-feature` — receta end-to-end aplicando esta arquitectura.
- Skill `flutter-riverpod-patterns` — para la capa presentation.
- Skill `flutter-atomic-design` — para los widgets del feature.
