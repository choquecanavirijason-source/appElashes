import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/service.dart';
import '../providers/services_provider.dart';
import '../widgets/service_form_sheet.dart';

class ServiciosScreen extends ConsumerWidget {
  const ServiciosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(servicesListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(servicesListProvider),
          ),
        ],
      ),
      body: AsyncValueView<List<Service>>(
        value: state,
        onRetry: () => ref.invalidate(servicesListProvider),
        builder: (servicios) {
          if (servicios.isEmpty) {
            return const EmptyState(
              icon: Icons.spa_outlined,
              title: 'Sin servicios',
              message: 'Agrega el primer servicio con +.',
            );
          }

          final grupos = <String, List<Service>>{};
          for (final s in servicios) {
            grupos.putIfAbsent(s.categoria ?? 'Sin categoría', () => []).add(s);
          }

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
            children: [
              for (final entry in grupos.entries) ...[
                _CategoryHeader(
                  label: entry.key,
                  count: entry.value.length,
                ),
                const SizedBox(height: 8),
                ...entry.value.map(
                  (s) => _ServiceCard(
                    service: s,
                    onDelete: () => _confirmDelete(context, ref, s),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.goldAccent,
        foregroundColor: Colors.black87,
        onPressed: () => ServiceFormSheet.show(context),
        icon: const Icon(Icons.add),
        label: const Text(
          'Nuevo servicio',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    Service service,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar servicio'),
        content: Text('¿Eliminar "${service.nombre}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.offlineRed,
            ),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      await ref.read(servicesListProvider.notifier).removeService(service.id);
    }
  }
}

// ─── Category header ──────────────────────────────────────────────────────────

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({required this.label, required this.count});

  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2, top: 4),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 16,
            decoration: BoxDecoration(
              color: AppColors.brandAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color(0xFF9CA3AF),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
              color: AppColors.darkCardElevated,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '$count',
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Service card ─────────────────────────────────────────────────────────────

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service, required this.onDelete});

  final Service service;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final precio = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 0,
    ).format(service.precio);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.iconBgOlive,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: AppColors.goldAccent,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.nombre,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  if (service.descripcion != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      service.descripcion!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        size: 13,
                        color: Color(0xFF6B7280),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${service.duracionMinutos} min',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      if (service.ticketCount > 0) ...[
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.brandAccent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '${service.ticketCount} tickets',
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.brandAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Price + delete
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  precio,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.goldAccent,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: onDelete,
                  child: const Icon(
                    Icons.delete_outline,
                    size: 19,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
