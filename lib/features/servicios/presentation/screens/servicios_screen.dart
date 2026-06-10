import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/status_badge.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
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
      appBar: AppBar(title: const Text('Servicios')),
      body: AsyncValueView<List<Service>>(
        value: state,
        onRetry: () => ref.invalidate(servicesListProvider),
        builder: (servicios) {
          if (servicios.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.spa_outlined, size: 48, color: AppColors.brandPrimary),
                  SizedBox(height: 12),
                  Text(
                    'Sin servicios',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Agrega el primer servicio con +.',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            );
          }

          // Agrupar por categoría
          final grupos = <String, List<Service>>{};
          for (final s in servicios) {
            grupos.putIfAbsent(s.categoria ?? 'Sin categoría', () => []).add(s);
          }

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
            children: [
              for (final entry in grupos.entries) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 4),
                  child: Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.brandPrimary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                ...entry.value.map(
                  (s) => _ServiceCard(
                    service: s,
                    onDelete: () => _confirmDelete(context, ref, s),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.brandPrimary,
        foregroundColor: Colors.white,
        onPressed: () => ServiceFormSheet.show(context),
        icon: const Icon(Icons.add),
        label: const Text('Nuevo servicio'),
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

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withValues(
                alpha: 0.5,
              ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.brandPrimary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: AppColors.brandPrimary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.nombre,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
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
                        color: Colors.black54,
                      ),
                    ),
                  ],
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 13, color: Colors.black54),
                      const SizedBox(width: 4),
                      Text(
                        '${service.duracionMinutos} min',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      if (service.ticketCount > 0) ...[
                        const SizedBox(width: 12),
                        StatusBadge(
                          label: '${service.ticketCount} tickets',
                          color: AppColors.brandPrimary,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  precio,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.brandPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  color: AppColors.offlineRed,
                  onPressed: onDelete,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
