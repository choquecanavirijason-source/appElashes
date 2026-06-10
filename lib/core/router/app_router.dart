import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/providers/auth_state_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/mensajes/domain/entities/message.dart';
import '../../features/mensajes/presentation/screens/chat_screen.dart';
import '../../features/mensajes/presentation/screens/mensajes_tab.dart';
import '../../features/servicios/presentation/screens/servicios_screen.dart';
import '../../features/shell/presentation/screens/app_shell.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/ventas/presentation/screens/ventas_screen.dart';
import 'guards.dart';
import 'routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authController = ref.watch(authStateProvider.notifier);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: false,
    refreshListenable: authController,
    redirect: (context, state) =>
        sessionRedirect(state, ref.read(authStateProvider)),
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.shell,
        builder: (_, __) => const AppShell(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (_, __) => const DashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.servicios,
        builder: (_, __) => const ServiciosScreen(),
      ),
      GoRoute(
        path: AppRoutes.ventas,
        builder: (_, __) => const VentasScreen(),
      ),
      GoRoute(
        path: AppRoutes.chatIa,
        builder: (_, __) => const ChatScreen(
          clienteId: 0,
          channel: MessageChannel.ai,
        ),
      ),
      GoRoute(
        path: '/chat/whatsapp/:clienteId',
        builder: (_, state) {
          final id = int.parse(state.pathParameters['clienteId']!);
          return ChatScreen(clienteId: id, channel: MessageChannel.whatsapp);
        },
      ),
      GoRoute(
        path: AppRoutes.mensajes,
        builder: (_, __) => const MensajesScreen(),
      ),
    ],
  );
});
