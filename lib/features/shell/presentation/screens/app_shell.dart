import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../citas/presentation/screens/citas_tab.dart';
import '../../../clientes/presentation/screens/clientes_tab.dart';
import '../../../inicio/presentation/screens/inicio_tab.dart';
import '../../../mensajes/presentation/screens/mensajes_tab.dart';
import '../../../operarias/presentation/screens/operarias_tab.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  static const _destinations = <_Dest>[
    _Dest('Inicio', Icons.home_outlined, Icons.home),
    _Dest('Citas', Icons.calendar_today_outlined, Icons.calendar_today),
    _Dest('Clientes', Icons.people_outline, Icons.people),
    _Dest('Operarias', Icons.face_outlined, Icons.face),
    _Dest('Mensajes', Icons.chat_bubble_outline, Icons.chat_bubble),
  ];

  static const _tabs = <Widget>[
    InicioTab(),
    CitasTab(),
    ClientesTab(),
    OperariasTab(),
    MensajesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final dest = _destinations[_index];

    return Scaffold(
      appBar: AppBar(
        title: Text(dest.label),
        actions: [
          IconButton(
            tooltip: 'Volver al login',
            icon: const Icon(Icons.logout),
            onPressed: () => context.go(AppRoutes.login),
          ),
        ],
      ),
      drawer: const _AppDrawer(),
      body: IndexedStack(index: _index, children: _tabs),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: _destinations
            .map(
              (d) => NavigationDestination(
                icon: Icon(d.icon),
                selectedIcon: Icon(d.selectedIcon),
                label: d.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  const _AppDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 56, 20, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.brandPrimary, AppColors.brandAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.face_retouching_natural,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Salón Elashes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'Gestión y reservas',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _DrawerItem(
            icon: Icons.dashboard_outlined,
            label: 'Dashboard',
            onTap: () => _go(context, AppRoutes.dashboard),
          ),
          _DrawerItem(
            icon: Icons.spa_outlined,
            label: 'Servicios',
            onTap: () => _go(context, AppRoutes.servicios),
          ),
          _DrawerItem(
            icon: Icons.point_of_sale,
            label: 'Ventas',
            onTap: () => _go(context, AppRoutes.ventas),
          ),
          const Divider(height: 24),
          _DrawerItem(
            icon: Icons.logout,
            label: 'Cerrar sesión',
            onTap: () => _go(context, AppRoutes.login, replace: true),
            destructive: true,
          ),
        ],
      ),
    );
  }

  void _go(BuildContext context, String route, {bool replace = false}) {
    Navigator.of(context).pop();
    if (replace) {
      context.go(route);
    } else {
      context.push(route);
    }
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.destructive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final color =
        destructive ? AppColors.statusCancelado : AppColors.brandPrimary;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: destructive ? AppColors.statusCancelado : null,
        ),
      ),
      onTap: onTap,
    );
  }
}

class _Dest {
  const _Dest(this.label, this.icon, this.selectedIcon);

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
