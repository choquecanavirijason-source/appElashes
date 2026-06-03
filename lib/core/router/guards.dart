import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/providers/auth_state_provider.dart';

/// Redirect global del router.
///
/// **Auth desactivada temporalmente.** Mientras esté así, devuelve `null`
/// para todas las rutas y deja al usuario navegar libremente. Cuando se
/// reactive el login real, restaurar las reglas comentadas abajo.
String? sessionRedirect(GoRouterState state, AuthStatus status) {
  return null;

  // ── Lógica original para cuando vuelva la auth ─────────────────────
  // final location = state.matchedLocation;
  // final isAuthRoute =
  //     location == AppRoutes.login || location == AppRoutes.register;
  // final isSplash = location == AppRoutes.splash;
  //
  // if (status == AuthStatus.initial) {
  //   return isSplash ? null : AppRoutes.splash;
  // }
  // if (status == AuthStatus.unauthenticated) {
  //   return isAuthRoute ? null : AppRoutes.login;
  // }
  // if (isAuthRoute || isSplash) {
  //   return AppRoutes.shell;
  // }
  // return null;
}
