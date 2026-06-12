import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../shell/presentation/providers/shell_tab_provider.dart';
import '../../../ventas/presentation/widgets/sale_form_sheet.dart';

class AdminTab extends ConsumerWidget {
  const AdminTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
          children: [
            const SizedBox(height: 8),
            const Text(
              'Administración',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 28),
            const _SectionLabel('OPERACIONES'),
            const SizedBox(height: 12),
            _ListTileCard(
              iconBg: AppColors.iconBgAmber,
              iconColor: AppColors.statusEnEspera,
              icon: Icons.point_of_sale,
              title: 'Recepción',
              subtitle: 'Check-in / check-out de clientas',
              badge: _HoyBadge(),
            ),
            const SizedBox(height: 10),
            _ListTileCard(
              iconBg: AppColors.iconBgGreen,
              iconColor: AppColors.onlineGreen,
              icon: Icons.payments_outlined,
              title: 'Comisiones',
              subtitle: 'Pagos a operarias y saldos',
              onTap: () => context.push(AppRoutes.comisiones),
            ),
            const SizedBox(height: 10),
            _ListTileCard(
              iconBg: const Color(0xFF0D1A2D),
              iconColor: AppColors.statusReserva,
              icon: Icons.people_alt_outlined,
              title: 'Clientes',
              subtitle: 'Listado, búsqueda y registro',
              onTap: () => context.push(AppRoutes.clientes),
            ),
            const SizedBox(height: 10),
            _ListTileCard(
              iconBg: const Color(0xFF0D2B1A),
              iconColor: const Color(0xFF25D366),
              icon: Icons.chat_rounded,
              title: 'Mensajes',
              subtitle: 'WhatsApp y asistente IA',
              onTap: () => context.push(AppRoutes.mensajes),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.0,
              children: [
                _GridCard(
                  iconBg: AppColors.iconBgOlive,
                  iconColor: AppColors.goldAccent,
                  icon: Icons.spa_outlined,
                  title: 'Servicios',
                  subtitle: 'Técnicas y comisiones',
                  onTap: () => context.push(AppRoutes.servicios),
                ),
                _GridCard(
                  iconBg: AppColors.iconBgGreen,
                  iconColor: AppColors.onlineGreen,
                  icon: Icons.receipt_long_outlined,
                  title: 'Pagos',
                  subtitle: 'Cobros y métodos',
                  onTap: () => context.push(AppRoutes.pagos),
                ),
                _GridCard(
                  iconBg: AppColors.iconBgTeal,
                  iconColor: AppColors.statusAtendido,
                  icon: Icons.point_of_sale,
                  title: 'Ventas POS',
                  subtitle: 'Historial de ventas',
                  onTap: () => context.push(AppRoutes.ventas),
                ),
                _GridCard(
                  iconBg: AppColors.iconBgOrange,
                  iconColor: const Color(0xFFF97316),
                  icon: Icons.groups_outlined,
                  title: 'Equipo',
                  subtitle: 'Operarias y staff',
                  onTap: () =>
                      ref.read(shellTabProvider.notifier).state = 2,
                ),
                _GridCard(
                  iconBg: AppColors.iconBgGreen,
                  iconColor: AppColors.goldAccent,
                  icon: Icons.add_card_outlined,
                  title: 'Registrar venta',
                  subtitle: 'Agregar servicios y cobrar',
                  onTap: () => SaleFormSheet.show(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const _SectionLabel('NEGOCIO'),
            const SizedBox(height: 12),
            _ListTileCard(
              iconBg: const Color(0xFF0D1F2D),
              iconColor: AppColors.statusEnServicio,
              icon: Icons.inventory_2_outlined,
              title: 'Inventario',
              subtitle: 'Productos, stock y alertas',
              onTap: () => context.push(AppRoutes.inventario),
            ),
            const SizedBox(height: 10),
            _ListTileCard(
              iconBg: AppColors.iconBgOlive,
              iconColor: AppColors.goldAccent,
              icon: Icons.store_outlined,
              title: 'Sucursales',
              subtitle: 'Crea y administra tus locales',
              badge: const _RoleBadge(label: 'Super Admin'),
              onTap: () => ref.read(shellTabProvider.notifier).state = 1,
            ),
            const SizedBox(height: 10),
            _ListTileCard(
              iconBg: AppColors.iconBgTeal,
              iconColor: AppColors.statusEnServicio,
              icon: Icons.account_balance_wallet_outlined,
              title: 'Cierres de caja',
              subtitle: 'Auditoría de cierres en todas las sucursales',
              onTap: () => context.push(AppRoutes.cierreCaja),
            ),
            const SizedBox(height: 10),
            _ListTileCard(
              iconBg: const Color(0xFF1A1026),
              iconColor: AppColors.statusReserva,
              icon: Icons.admin_panel_settings_outlined,
              title: 'Roles y permisos',
              subtitle: 'Gestión de accesos del equipo',
              onTap: () => context.push(AppRoutes.roles),
            ),
            const SizedBox(height: 10),
            _ListTileCard(
              iconBg: const Color(0xFF1C1C1C),
              iconColor: const Color(0xFF9CA3AF),
              icon: Icons.settings_outlined,
              title: 'Configuración',
              subtitle: 'APIs, integraciones y ajustes',
              onTap: () => context.push(AppRoutes.settings),
            ),
            const SizedBox(height: 24),
            // Floating-style button for direct access to the sale form (new or edit)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.goldAccent,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: const Icon(Icons.point_of_sale, color: Colors.black87, size: 28),
                title: const Text(
                  'Registrar / Editar Venta',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                subtitle: const Text(
                  'Acceso directo al formulario de venta',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
                onTap: () => SaleFormSheet.show(context),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),

    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF6B7280),
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _ListTileCard extends StatelessWidget {
  const _ListTileCard({
    required this.iconBg,
    required this.iconColor,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.badge,
    this.onTap,
  });

  final Color iconBg;
  final Color iconColor;
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? badge;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        title: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            if (badge != null) ...[
              const SizedBox(width: 8),
              badge!,
            ],
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            subtitle,
            style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12),
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xFF4B5563),
          size: 20,
        ),
        onTap: onTap,
      ),
    );
  }
}

class _GridCard extends StatelessWidget {
  const _GridCard({
    required this.iconBg,
    required this.iconColor,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final Color iconBg;
  final Color iconColor;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.darkCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.darkCardElevated),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HoyBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.statusEnEspera.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        'HOY',
        style: TextStyle(
          color: AppColors.statusEnEspera,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _RoleBadge extends StatelessWidget {
  const _RoleBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.goldAccent.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.goldAccent,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
