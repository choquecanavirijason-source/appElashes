import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/status_badge.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/service.dart';
import '../providers/services_provider.dart';
import '../widgets/service_form_sheet.dart';

class ServiciosScreen extends ConsumerWidget {
  const ServiciosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicios = ref.watch(servicesProvider);

    // Agrupar por categoría.
    final grupos = <String, List<Service>>{};
    for (final s in servicios) {
      grupos.putIfAbsent(s.categoria, () => []).add(s);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Servicios')),
      body: servicios.isEmpty
          ? const EmptyState(
              icon: Icons.spa_outlined,
              title: 'Sin servicios',
              message: 'Agrega el primer servicio con +.',
            )
          : ListView(
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
                  ...entry.value.map((s) => _ServiceCard(service: s)),
                  const SizedBox(height: 16),
                ],
              ],
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
}

class _ServiceCard extends ConsumerWidget {
  const _ServiceCard({required this.service});

  final Service service;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      const Icon(
                        Icons.schedule,
                        size: 13,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${service.duracionMinutos} min',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (!service.activo)
                        const StatusBadge(
                          label: 'Inactivo',
                          color: AppColors.statusReagendado,
                        ),
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
                Switch(
                  value: service.activo,
                  onChanged: (_) => ref
                      .read(servicesProvider.notifier)
                      .toggleActivo(service.id),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
