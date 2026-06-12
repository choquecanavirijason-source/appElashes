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
import '../../features/cierre_caja/presentation/screens/cierre_caja_screen.dart';
import '../../features/clientes/presentation/screens/clientes_tab.dart';
import '../../features/comisiones/presentation/screens/comisiones_screen.dart';
import '../../features/inventario/presentation/screens/inventario_screen.dart';
import '../../features/pagos/presentation/screens/pagos_screen.dart';
import '../../features/usuarios/presentation/screens/roles_screen.dart';
import '../../features/ventas/presentation/screens/ventas_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
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
      GoRoute(
        path: AppRoutes.inventario,
        builder: (_, __) => const InventarioScreen(),
      ),
      GoRoute(
        path: AppRoutes.pagos,
        builder: (_, __) => const PagosScreen(),
      ),
      GoRoute(
        path: AppRoutes.comisiones,
        builder: (_, __) => const ComisionesScreen(),
      ),
      GoRoute(
        path: AppRoutes.cierreCaja,
        builder: (_, __) => const CierreCajaScreen(),
      ),
      GoRoute(
        path: AppRoutes.clientes,
        builder: (_, __) => const ClientesTab(),
      ),
      GoRoute(
        path: AppRoutes.roles,
        builder: (_, __) => const RolesScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (_, __) => const SettingsScreen(),
      ),
    ],
  );
});
