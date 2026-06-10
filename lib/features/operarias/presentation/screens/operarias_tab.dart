import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/operaria.dart';
import '../providers/operarias_provider.dart';
import '../widgets/operaria_form_sheet.dart';

class EquipoTab extends ConsumerWidget {
  const EquipoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(operariasListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(operariasListProvider),
          ),
        ],
      ),
      body: AsyncValueView<List<Operaria>>(
        value: state,
        onRetry: () => ref.invalidate(operariasListProvider),
        builder: (operarias) {
          final activas = operarias.where((o) => o.activa).toList();
          final inactivas = operarias.where((o) => !o.activa).toList();

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(operariasListProvider);
              await ref.read(operariasListProvider.future);
            },
            color: AppColors.brandAccent,
            backgroundColor: AppColors.darkCard,
            child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
            children: [
              const SizedBox(height: 12),
              Text(
                '${operarias.length} personas',
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(height: 16),
              _SectionHeader(
                color: AppColors.onlineGreen,
                label: 'Activas',
                count: activas.length,
              ),
              const SizedBox(height: 10),
              ...activas.map(
                (o) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _MemberCard(operaria: o),
                ),
              ),
              if (inactivas.isNotEmpty) ...[
                const SizedBox(height: 8),
                _SectionHeader(
                  color: AppColors.offlineRed,
                  label: 'Inactivas',
                  count: inactivas.length,
                ),
                const SizedBox(height: 10),
                ...inactivas.map(
                  (o) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _MemberCard(operaria: o),
                  ),
                ),
              ],
            ],
          ),
          );
        },
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
        operaria.activa ? AppColors.onlineGreen : AppColors.offlineRed;

    return Material(
      color: AppColors.darkCard,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => OperariaFormSheet.show(context, existing: operaria),
        child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
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
                    if (operaria.email != null)
                      Text(
                        operaria.email!,
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              _StatusPill(activa: operaria.activa),
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
              if (operaria.phone != null)
                _PhoneChip(phone: operaria.phone!),
            ],
          ),
        ],
      ),
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.activa});

  final bool activa;

  @override
  Widget build(BuildContext context) {
    final color = activa ? AppColors.onlineGreen : AppColors.offlineRed;
    final label = activa ? 'Activa' : 'Inactiva';
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

class _PhoneChip extends StatelessWidget {
  const _PhoneChip({required this.phone});

  final String phone;

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
          const Icon(Icons.phone, size: 11, color: Color(0xFF9CA3AF)),
          const SizedBox(width: 4),
          Text(
            phone,
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
