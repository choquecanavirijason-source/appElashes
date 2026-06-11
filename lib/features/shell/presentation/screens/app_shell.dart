import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../admin/presentation/screens/admin_tab.dart';
import '../../../inicio/presentation/screens/inicio_tab.dart';
import '../../../operarias/presentation/screens/operarias_tab.dart';
import '../../../perfil/presentation/screens/perfil_tab.dart';
import '../../../sucursales/presentation/screens/sucursales_tab.dart';
import '../providers/shell_tab_provider.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key});

  static const _tabs = <Widget>[
    InicioTab(),
    SucursalesTab(),
    EquipoTab(),
    AdminTab(),
    PerfilTab(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(shellTabProvider);

    return PopScope(
      canPop: index == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          ref.read(shellTabProvider.notifier).state = 0;
        }
      },
      child: Scaffold(
        body: IndexedStack(index: index, children: _tabs),
        bottomNavigationBar: _BottomNav(
          selectedIndex: index,
          onTap: (i) => ref.read(shellTabProvider.notifier).state = i,
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.selectedIndex, required this.onTap});

  final int selectedIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      color: AppColors.darkBg,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10 + bottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            label: 'Inicio',
            selected: selectedIndex == 0,
            onTap: () => onTap(0),
          ),
          _NavItem(
            icon: Icons.store_outlined,
            label: 'Sucursales',
            selected: selectedIndex == 1,
            onTap: () => onTap(1),
          ),
          _NavItem(
            icon: Icons.groups_outlined,
            label: 'Equipo',
            selected: selectedIndex == 2,
            onTap: () => onTap(2),
          ),
          _NavItem(
            icon: Icons.apps,
            label: 'Admin',
            selected: selectedIndex == 3,
            onTap: () => onTap(3),
          ),
          _NavItem(
            icon: Icons.person_outline,
            label: 'Perfil',
            selected: selectedIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.goldAccent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white54, size: 22),
            const SizedBox(height: 3),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
