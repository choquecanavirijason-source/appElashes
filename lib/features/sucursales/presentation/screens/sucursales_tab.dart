import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../citas/domain/entities/appointment.dart';
import '../../../citas/presentation/providers/appointments_provider.dart';
import '../../domain/entities/sucursal.dart';
import '../providers/sucursales_provider.dart';
import '../widgets/sucursal_form_sheet.dart';

class SucursalesTab extends ConsumerWidget {
  const SucursalesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sucursalesListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sucursales')),
      body: AsyncValueView<List<Sucursal>>(
        value: state,
        onRetry: () => ref.invalidate(sucursalesListProvider),
        builder: (sucursales) {
          if (sucursales.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.store_outlined, size: 52, color: Color(0xFF374151)),
                  SizedBox(height: 12),
                  Text(
                    'Sin sucursales registradas',
                    style: TextStyle(color: Color(0xFF6B7280), fontSize: 14),
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(sucursalesListProvider);
              await ref.read(sucursalesListProvider.future);
            },
            color: AppColors.brandAccent,
            backgroundColor: AppColors.darkCard,
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
              itemCount: sucursales.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => _SucursalCard(sucursal: sucursales[i]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.goldAccent,
        foregroundColor: Colors.black87,
        onPressed: () => SucursalFormSheet.show(context),
        icon: const Icon(Icons.add),
        label: const Text(
          'Nueva sucursal',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

// ─── Card ─────────────────────────────────────────────────────────────────────

class _SucursalCard extends ConsumerWidget {
  const _SucursalCard({required this.sucursal});

  final Sucursal sucursal;

  void _showDeleteDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar sucursal'),
        content: Text(
          '¿Seguro que deseas eliminar "${sucursal.nombre}"?\nEsta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () async {
              Navigator.of(ctx).pop();
              final messenger = ScaffoldMessenger.of(context);
              try {
                await ref
                    .read(sucursalesListProvider.notifier)
                    .removeSucursal(sucursal.id);
                messenger.showSnackBar(
                  SnackBar(
                    content: Text('Sucursal "${sucursal.nombre}" eliminada'),
                  ),
                );
              } on ApiException catch (e) {
                messenger.showSnackBar(
                  SnackBar(
                    content: Text(e.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allAppointments =
        ref.watch(appointmentsListProvider).valueOrNull ?? <Appointment>[];
    final branchAppts =
        allAppointments.where((a) => a.branchId == sucursal.id).toList();
    final citasCount = branchAppts.length;
    final clientasCount =
        branchAppts.map((a) => a.clientId).toSet().length;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 8, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.iconBgOlive,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.store,
                    color: AppColors.goldAccent,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              sucursal.nombre,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  AppColors.onlineGreen.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: const Text(
                              'Activa',
                              style: TextStyle(
                                color: AppColors.onlineGreen,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          PopupMenuButton<_CardAction>(
                            icon: const Icon(
                              Icons.more_vert,
                              color: Color(0xFF6B7280),
                              size: 20,
                            ),
                            onSelected: (action) {
                              if (action == _CardAction.edit) {
                                SucursalFormSheet.show(
                                  context,
                                  existing: sucursal,
                                );
                              } else {
                                _showDeleteDialog(context, ref);
                              }
                            },
                            itemBuilder: (_) => const [
                              PopupMenuItem(
                                value: _CardAction.edit,
                                child: Row(
                                  children: [
                                    Icon(Icons.edit_outlined, size: 18),
                                    SizedBox(width: 10),
                                    Text('Editar'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: _CardAction.delete,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete_outline,
                                      size: 18,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Eliminar',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (sucursal.ciudad != null ||
                          sucursal.departamento != null) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 13,
                              color: Color(0xFF6B7280),
                            ),
                            const SizedBox(width: 3),
                            Expanded(
                              child: Text(
                                [
                                  if (sucursal.ciudad != null) sucursal.ciudad!,
                                  if (sucursal.departamento != null)
                                    sucursal.departamento!,
                                ].join(', '),
                                style: const TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (sucursal.direccion != null) ...[
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.pin_drop_outlined,
                              size: 13,
                              color: Color(0xFF4B5563),
                            ),
                            const SizedBox(width: 3),
                            Expanded(
                              child: Text(
                                sucursal.direccion!,
                                style: const TextStyle(
                                  color: Color(0xFF4B5563),
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.darkCardElevated),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: _StatCol(
                    icon: Icons.groups_outlined,
                    value: '${sucursal.userIds.length}',
                    label: 'Equipo',
                    color: AppColors.goldAccent,
                  ),
                ),
                Container(
                  width: 1,
                  height: 32,
                  color: AppColors.darkCardElevated,
                ),
                Expanded(
                  child: _StatCol(
                    icon: Icons.person_outline,
                    value: '$clientasCount',
                    label: 'Clientas',
                    color: AppColors.statusEnServicio,
                  ),
                ),
                Container(
                  width: 1,
                  height: 32,
                  color: AppColors.darkCardElevated,
                ),
                Expanded(
                  child: _StatCol(
                    icon: Icons.calendar_today_outlined,
                    value: '$citasCount',
                    label: 'Citas',
                    color: AppColors.onlineGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum _CardAction { edit, delete }

// ─── Helpers ──────────────────────────────────────────────────────────────────

class _StatCol extends StatelessWidget {
  const _StatCol({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 15, color: color),
            const SizedBox(width: 4),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
