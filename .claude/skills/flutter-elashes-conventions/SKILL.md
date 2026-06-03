---
name: flutter-elashes-conventions
description: Convenciones específicas del repo elashes — manejo de 401, mapeo de errores FastAPI, branch_id en queries, formato es_BO/BOB, estados de ticket/cliente, naming, lints estrictos, prohibición de printing/http/setState-para-servidor, dotenv, secure_storage key "_tkn". Usar antes de cualquier cambio en este repo para no romper convenciones; especialmente al integrar APIs, manejar errores, formatear fechas/moneda, agregar dependencias, o trabajar con auth/sucursales.
---

# Convenciones de elashes

## Cuándo invocar este skill

- Cualquier cambio de código en este repo (descripción amplia a propósito).
- "Agrega la dependencia X" → revisar restricciones de stack.
- "Por qué falla esto del 401 / token / login"
- "Formatea esta fecha / este precio"

## Restricciones de stack — NO HACER

| Prohibido | Usar en su lugar |
|-----------|------------------|
| `http` package | `dio` (único cliente HTTP) |
| `provider`, `bloc`, `getx`, `mobx` | `flutter_riverpod` |
| `Navigator.push/pop` directo | `go_router` con `AppRoutes.*` constantes |
| `setState` para datos del servidor | `AsyncNotifierProvider` |
| `print()` | `developer.log(msg, name: 'feature.subfeature')` |
| Colores hardcoded (`Color(0xFF...)`) en widgets | `Theme.of(context).colorScheme` o `AppColors.*` |
| `catch (_) {}` genérico | Captura tipo concreto (`DioException`, `ApiException`) |
| Strings de endpoint inline | `ApiEndpoints.*` |
| `// TODO`, `throw UnimplementedError()` en entregables | Implementación completa o issue tracker |
| Agregar `printing` package | Bloqueado: pinea AGP 7.3.0 + dl.google.com no es accesible. Reintroducir en Fase 6 si la red lo permite, o usar `share_plus` con bytes PDF de `pdf` package |
| Endpoints `/face/*` | No están en producción |

## Auth y sesión

- **Token storage key:** `_tkn` (definido en `Env.tokenStorageKey`). Mismo nombre que el panel web.
- **Login real (Fase 1+):** `POST /auth/login` con `{ username, password }` → `{ access_token, token_type, user }`.
- **Bearer:** lo inyecta automáticamente `AuthInterceptor`. **Nunca** lo añadas manual.
- **Skip auth en un request específico:** `dio.get('/x', options: Options(extra: {'skipAuth': true}))`.
- **401:** el interceptor borra el token y llama `authStateProvider.notifier.markSignedOut()`. El router redirige a `/login` automáticamente. **Las pantallas NO duplican este manejo.**
- **Permisos:** strings con formato `recurso:accion`. `SuperAdmin` ve todo. Filtrar menú con
  `requiredPermission: '<perm>'` por item.

Permisos válidos:
```
clients:view, clients:manage, catalog:view, catalog:manage, services:view, services:manage,
payments:view, payments:manage, appointments:view, appointments:manage, inventory:view,
inventory:manage, branches:view, branches:manage, forms:view, forms:manage, settings:view
```

## Manejo de errores

- `ErrorInterceptor` ya mapea `DioException` → `ApiException`.
- `ApiException` tiene: `message`, `statusCode`, `errors?`, `isUnauthorized`, `isNetwork`.
- **FastAPI** devuelve `{"detail": "..."}` en errores. Si `detail` es lista (422), se une con `\n`. Si es dict, va a `errors`.
- **Sin red:** `ApiException(message: 'Sin conexión a internet', isNetwork: true)`.

Captura típica en un notifier:
```dart
try {
  await repo.create(input);
} on ApiException catch (e) {
  // mostrar e.message, no e.toString()
  rethrow;
}
```

En pantalla, usar `ref.listen` + `SnackBar` (ver skill `flutter-riverpod-patterns`).

## Sucursal global

- `branchProvider` expone `selectedBranchId: int?` persistido en SharedPreferences (`selected_branch_id`).
- **Toda llamada de listado que tenga sentido por sucursal pasa el query param.**
  Si es `null`, **omítelo** (no mandes `branch_id=null`).
- Al cambiar sucursal, los providers que watcheen `branchProvider` se recomponen automáticamente.

## Formato es_BO / BOB

```dart
import 'package:intl/intl.dart';

// Fechas para mostrar:
DateFormat('dd/MM/yyyy HH:mm', 'es_BO').format(dt)
DateFormat.yMMMMEEEEd('es_BO').format(dt)

// Fechas en payload (ISO 8601 local sin zona horaria):
dt.toIso8601String().split('.').first   // 2026-05-20T10:00:00

// Moneda:
NumberFormat.currency(locale: 'es_BO', symbol: 'Bs ', decimalDigits: 2).format(123.45)
// → "Bs 123,45"
```

## Estados de ticket/cliente

Strings exactos del API:
```
reserva | en_espera | en_servicio | siendo_atendido | atendido | pagado |
finalizado | cancelado | no_se_presento | reagendado | sin_estado
```

Modelar con `enum ClientStatus` en `shared/enums/client_status.dart`:

```dart
enum ClientStatus {
  reserva, enEspera, enServicio, siendoAtendido, atendido, pagado,
  finalizado, cancelado, noSePresento, reagendado, sinEstado;

  static ClientStatus fromString(String v) => switch (v) {
        'reserva' => ClientStatus.reserva,
        'en_espera' => ClientStatus.enEspera,
        'en_servicio' => ClientStatus.enServicio,
        'siendo_atendido' => ClientStatus.siendoAtendido,
        'atendido' => ClientStatus.atendido,
        'pagado' => ClientStatus.pagado,
        'finalizado' => ClientStatus.finalizado,
        'cancelado' => ClientStatus.cancelado,
        'no_se_presento' => ClientStatus.noSePresento,
        'reagendado' => ClientStatus.reagendado,
        _ => ClientStatus.sinEstado,
      };

  String get displayName => switch (this) {
        ClientStatus.reserva => 'Reserva',
        ClientStatus.enEspera => 'En espera',
        // ...
      };

  Color get color => switch (this) {
        ClientStatus.reserva => AppColors.statusReserva,
        // ...
      };
}
```

Otros enums obligatorios:
- `PaymentMethod`: `cash | card | transfer | qr`
- `DiscountType`: `amount | percent`
- `QuestionType`: `text | number | bool | select | multi_select`

## Naming

| Tipo | Convención | Ejemplo |
|------|-----------|---------|
| Archivos | `snake_case.dart` | `client_dto.dart` |
| Clases | `PascalCase` | `ClientsRepository` |
| Métodos/vars | `camelCase` | `selectedBranchId` |
| DTOs | `<Feature>Dto`, `<Feature>CreateDto`, `<Feature>UpdateDto` | `ClientDto` |
| Entities UI | nombre singular sin sufijo | `Client`, `Ticket` |
| Repo abstracto | `<Feature>Repository` en `domain/` | `ClientsRepository` |
| Repo impl | `<Feature>RepositoryImpl` en `data/` | `ClientsRepositoryImpl` |
| Providers | sufijo `Provider` | `clientsRepositoryProvider` |
| Notifiers | `<Thing>Notifier` | `ClientsListNotifier` |
| Rutas | constantes en `AppRoutes` | `AppRoutes.clients` |
| Endpoints | constantes en `ApiEndpoints` | `ApiEndpoints.clients` |
| Enums | `PascalCase`, valores `camelCase` | `ClientStatus.enEspera` |

## Lints activos (analysis_options.yaml)

```
strict-casts: true, strict-inference: true, strict-raw-types: true
avoid_print, prefer_const_constructors, prefer_const_declarations,
prefer_final_locals, prefer_single_quotes, require_trailing_commas,
unawaited_futures, avoid_dynamic_calls
```

Implicancias:
- Strings con `'` no `"`.
- Comas finales en listas, mapas, params multi-línea.
- `const` siempre que se pueda.
- `final` para locals que no se reasignan.
- Futures discardeados → `unawaited(future)`.
- Sin casts implícitos (`as dynamic` o accesos a `dynamic` están vetados).

## Dependencias antes de añadir una nueva

1. ¿La spec ya elige una? — usar esa.
2. ¿Hay otro paquete del stack que ya cubra el caso? — no duplicar.
3. ¿Tiene plugin Android con AGP propio que necesite `dl.google.com`? — verificar
   antes de comprometer (`printing` es el ejemplo a evitar).
4. Versión: pinear al `^x.y.z` actual, no `any`.

## Issues conocidos

- `dl.google.com:443` bloqueado en esta máquina. Cualquier plugin que necesite
  bajar AGP no-cacheado de ahí va a fallar. Apagar VPN, cambiar DNS a 1.1.1.1, o
  probar con hotspot del celular.
- `.env` se commitea como plantilla; secretos reales deben ir vía
  `--dart-define` en CI/prod.

## Antes de cerrar cualquier cambio

```bash
C:\flutter\bin\flutter.bat analyze   # 0 issues
C:\flutter\bin\flutter.bat test      # all green
```

## Ver también

- `CLAUDE.md` — referencia completa.
- Skill `flutter-clean-architecture` — capas.
- Skill `flutter-riverpod-patterns` — estado.
- Skill `flutter-add-feature` — receta de feature nuevo.
- Skill `flutter-atomic-design` — niveles de widget.
