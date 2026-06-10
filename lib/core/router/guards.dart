import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/providers/auth_state_provider.dart';
import 'routes.dart';

/// Redirect global del router basado en el estado de autenticación.
///
/// - `initial`       → cualquier ruta que no sea splash va a splash.
/// - `unauthenticated` → cualquier ruta privada va a login.
/// - `authenticated` → las rutas de auth/splash van al shell.
String? sessionRedirect(GoRouterState state, AuthStatus status) {
  final location = state.matchedLocation;
  final isAuthRoute =
      location == AppRoutes.login || location == AppRoutes.register;
  final isSplash = location == AppRoutes.splash;

  if (status == AuthStatus.initial) {
    return isSplash ? null : AppRoutes.splash;
  }
  if (status == AuthStatus.unauthenticated) {
    return isAuthRoute ? null : AppRoutes.login;
  }
  // authenticated
  if (isAuthRoute || isSplash) {
    return AppRoutes.shell;
  }
  return null;
}
