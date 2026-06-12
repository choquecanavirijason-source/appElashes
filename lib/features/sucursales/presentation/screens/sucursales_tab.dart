import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/storage/prefs_storage.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../citas/domain/entities/appointment.dart';
import '../../../citas/presentation/providers/appointments_provider.dart';
import '../../../dashboard/presentation/providers/dashboard_overview_provider.dart';
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
                  Icon(
                    Icons.store_outlined,
                    size: 52,
                    color: Color(0xFF374151),
                  ),
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

  Future<void> _toggleActiva(BuildContext context, WidgetRef ref) async {
    final nueva = !sucursal.activa;
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref
          .read(sucursalesListProvider.notifier)
          .toggleActiva(sucursal.id, activa: nueva);
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            nueva
                ? '"${sucursal.nombre}" activada'
                : '"${sucursal.nombre}" desactivada',
          ),
        ),
      );
    } on DioException catch (e) {
      final msg = e.error is ApiException
          ? (e.error as ApiException).message
          : 'Error al cambiar estado';
      messenger.showSnackBar(
        SnackBar(content: Text(msg), backgroundColor: AppColors.statusCancelado),
      );
    }
  }

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

  Future<void> _seleccionar(BuildContext context, WidgetRef ref) async {
    ref.read(selectedBranchIdProvider.notifier).state = sucursal.id;
    await ref.read(prefsStorageProvider).setSelectedBranchId(sucursal.id);
    ref.invalidate(appointmentsListProvider);
    await ref.read(dashboardOverviewProvider.notifier).refresh();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"${sucursal.nombre}" seleccionada como activa'),
          backgroundColor: AppColors.brandAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(selectedBranchIdProvider);
    final isSeleccionada = selectedId == sucursal.id;

    final allAppointments =
        ref.watch(appointmentsListProvider).valueOrNull ?? <Appointment>[];
    final branchAppts =
        allAppointments.where((a) => a.branchId == sucursal.id).toList();
    final citasCount = branchAppts.length;
    final clientasCount = branchAppts.map((a) => a.clientId).toSet().length;

    final borderColor = isSeleccionada
        ? AppColors.brandAccent.withValues(alpha: 0.6)
        : sucursal.activa
            ? AppColors.darkCardElevated
            : AppColors.statusCancelado.withValues(alpha: 0.3);

    return Opacity(
      opacity: sucursal.activa ? 1.0 : 0.65,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor,
            width: isSeleccionada ? 1.5 : 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Cabecera ──────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 8, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: sucursal.activa
                          ? AppColors.iconBgOlive
                          : const Color(0xFF1C1C1C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.store,
                      color: sucursal.activa
                          ? AppColors.goldAccent
                          : const Color(0xFF4B5563),
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
                            // Badge estado
                            _EstadoBadge(activa: sucursal.activa),
                            const SizedBox(width: 2),
                            // Menú opciones
                            PopupMenuButton<_CardAction>(
                              icon: const Icon(
                                Icons.more_vert,
                                color: Color(0xFF6B7280),
                                size: 20,
                              ),
                              onSelected: (action) {
                                switch (action) {
                                  case _CardAction.edit:
                                    SucursalFormSheet.show(
                                      context,
                                      existing: sucursal,
                                    );
                                  case _CardAction.toggleActiva:
                                    _toggleActiva(context, ref);
                                  case _CardAction.delete:
                                    _showDeleteDialog(context, ref);
                                }
                              },
                              itemBuilder: (_) => [
                                const PopupMenuItem(
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
                                  value: _CardAction.toggleActiva,
                                  child: Row(
                                    children: [
                                      Icon(
                                        sucursal.activa
                                            ? Icons.pause_circle_outline
                                            : Icons.play_circle_outline,
                                        size: 18,
                                        color: sucursal.activa
                                            ? AppColors.statusEnEspera
                                            : AppColors.brandAccent,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        sucursal.activa
                                            ? 'Desactivar'
                                            : 'Activar',
                                        style: TextStyle(
                                          color: sucursal.activa
                                              ? AppColors.statusEnEspera
                                              : AppColors.brandAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuItem(
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
                                    if (sucursal.ciudad != null)
                                      sucursal.ciudad!,
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
            // ── Stats ─────────────────────────────────────────────────────
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
            // ── Botón seleccionar ─────────────────────────────────────────
            const Divider(height: 1, color: AppColors.darkCardElevated),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
              child: isSeleccionada
                  ? Row(
                      children: [
                        const Icon(
                          Icons.check_circle_rounded,
                          size: 16,
                          color: AppColors.brandAccent,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Sucursal activa seleccionada',
                          style: TextStyle(
                            color: AppColors.brandAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () async {
                            ref.read(selectedBranchIdProvider.notifier).state =
                                null;
                            await ref
                                .read(prefsStorageProvider)
                                .setSelectedBranchId(null);
                            ref.invalidate(appointmentsListProvider);
                            await ref
                                .read(dashboardOverviewProvider.notifier)
                                .refresh();
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF6B7280),
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Quitar',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: sucursal.activa
                            ? () => _seleccionar(context, ref)
                            : null,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.brandAccent,
                          side: BorderSide(
                            color: sucursal.activa
                                ? AppColors.brandAccent.withValues(alpha: 0.4)
                                : const Color(0xFF374151),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(Icons.radio_button_unchecked, size: 16),
                        label: Text(
                          sucursal.activa
                              ? 'Seleccionar esta sucursal'
                              : 'Sucursal inactiva',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _CardAction { edit, toggleActiva, delete }

// ─── Helpers ──────────────────────────────────────────────────────────────────

class _EstadoBadge extends StatelessWidget {
  const _EstadoBadge({required this.activa});

  final bool activa;

  @override
  Widget build(BuildContext context) {
    final color = activa ? AppColors.onlineGreen : const Color(0xFF6B7280);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 6, color: color),
          const SizedBox(width: 4),
          Text(
            activa ? 'Activa' : 'Inactiva',
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
          style: const TextStyle(color: Color(0xFF6B7280), fontSize: 11),
        ),
      ],
    );
  }
}
