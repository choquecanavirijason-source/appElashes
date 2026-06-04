import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/operaria.dart';
import '../providers/operarias_provider.dart';
import '../widgets/operaria_form_sheet.dart';

class EquipoTab extends ConsumerWidget {
  const EquipoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(operariasProvider);
    final enLinea = todos.where((o) => o.enLinea).toList();
    final fueraDeLinea = todos.where((o) => !o.enLinea).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
        children: [
          const SizedBox(height: 12),
          const Row(
            children: [
              _FilterChip(
                icon: Icons.language,
                label: 'Sucursal: Todas',
                iconColor: Colors.white60,
              ),
              SizedBox(width: 8),
              _FilterChip(
                icon: Icons.circle,
                label: 'Estado: Todos',
                iconColor: Color(0xFF6B7280),
                iconSize: 8,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '${todos.length} personas',
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
          const SizedBox(height: 16),
          _SectionHeader(
            color: AppColors.onlineGreen,
            label: 'En línea',
            count: enLinea.length,
          ),
          const SizedBox(height: 10),
          ...enLinea.map(
            (o) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _MemberCard(operaria: o),
            ),
          ),
          const SizedBox(height: 8),
          _SectionHeader(
            color: AppColors.offlineRed,
            label: 'Fuera de línea',
            count: fueraDeLinea.length,
          ),
          const SizedBox(height: 10),
          ...fueraDeLinea.map(
            (o) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _MemberCard(operaria: o),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.goldAccent,
        foregroundColor: Colors.black87,
        onPressed: () => OperariaFormSheet.show(context),
        icon: const Icon(Icons.person_add_outlined),
        label: const Text(
          'Nueva cuenta',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.color,
    required this.label,
    required this.count,
  });

  final Color color;
  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 10),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '$count',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _MemberCard extends ConsumerWidget {
  const _MemberCard({required this.operaria});

  final Operaria operaria;

  Color get _rolColor {
    switch (operaria.rol) {
      case 'Supervisora':
      case 'Admin':
        return AppColors.statusEnServicio;
      case 'Operaria':
        return AppColors.statusEnEspera;
      case 'Super Admin':
        return AppColors.goldAccent;
      default:
        return const Color(0xFF9CA3AF);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusColor =
        operaria.enLinea ? AppColors.onlineGreen : AppColors.offlineRed;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InitialsAvatar(
                initials: operaria.iniciales,
                size: 46,
                backgroundColor: AppColors.avatarOlive,
                statusColor: statusColor,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      operaria.nombreCompleto,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    if (operaria.username.isNotEmpty)
                      Text(
                        operaria.username,
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              _StatusPill(enLinea: operaria.enLinea),
              if (operaria.rol == 'Operaria') ...[
                const SizedBox(width: 6),
                _ToggleSwitch(
                  value: operaria.enLinea,
                  onChanged: (_) => ref
                      .read(operariasProvider.notifier)
                      .toggleActiva(operaria.id),
                ),
              ],
              const SizedBox(width: 4),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF4B5563),
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _RoleChip(label: operaria.rol, color: _rolColor),
              if (operaria.sucursal.isNotEmpty)
                _SucursalChip(nombre: operaria.sucursal),
            ],
          ),
          if (operaria.productividadDiaria != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.trending_up,
                  size: 13,
                  color: AppColors.onlineGreen,
                ),
                const SizedBox(width: 4),
                Text(
                  '${operaria.productividadDiaria!.toStringAsFixed(1)}/día prom.',
                  style: const TextStyle(
                    color: AppColors.onlineGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.enLinea});

  final bool enLinea;

  @override
  Widget build(BuildContext context) {
    final color = enLinea ? AppColors.onlineGreen : AppColors.offlineRed;
    final label = enLinea ? 'En línea' : 'Fuera de línea';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 7, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleSwitch extends StatelessWidget {
  const _ToggleSwitch({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 38,
        height: 22,
        decoration: BoxDecoration(
          color: value ? AppColors.onlineGreen : const Color(0xFF374151),
          borderRadius: BorderRadius.circular(11),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleChip extends StatelessWidget {
  const _RoleChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SucursalChip extends StatelessWidget {
  const _SucursalChip({required this.nombre});

  final String nombre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.iconBgOlive,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.store, size: 11, color: Color(0xFF9CA3AF)),
          const SizedBox(width: 4),
          Text(
            nombre,
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.icon,
    required this.label,
    required this.iconColor,
    this.iconSize = 14,
  });

  final IconData icon;
  final String label;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.darkCard,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: AppColors.darkCardElevated),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: iconSize, color: iconColor),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 14,
              color: Colors.white60,
            ),
          ],
        ),
      ),
    );
  }
}
