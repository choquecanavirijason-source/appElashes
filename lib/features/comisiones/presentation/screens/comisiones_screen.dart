import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/commissions_repository_impl.dart';
import '../providers/comisiones_provider.dart';
import '../widgets/commission_form_sheet.dart';

class ComisionesScreen extends ConsumerWidget {
  const ComisionesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncComisiones = ref.watch(comisionesProvider);
    final fmt = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 2,
    );
    final dateFmt = DateFormat('dd/MM/yyyy HH:mm', 'es_BO');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comisiones'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(comisionesProvider.notifier).refresh(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.darkCardElevated,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => const CommissionFormSheet(),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Registrar'),
        backgroundColor: AppColors.brandPrimary,
        foregroundColor: Colors.white,
      ),
      body: AsyncValueView<List<CommissionPayment>>(
        value: asyncComisiones,
        onRetry: () => ref.invalidate(comisionesProvider),
        builder: (comisiones) {
          if (comisiones.isEmpty) {
            return const EmptyState(
              icon: Icons.payments_outlined,
              title: 'Sin comisiones',
              message: 'Los pagos de comisión registrados aparecerán aquí.',
            );
          }

          final total = comisiones.fold<double>(0, (a, c) => a + c.amount);

          return Column(
            children: [
              _TotalBanner(total: total, count: comisiones.length, fmt: fmt),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
                  itemCount: comisiones.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) => _CommissionCard(
                    commission: comisiones[i],
                    fmt: fmt,
                    dateFmt: dateFmt,
                    onDelete: () => _confirmDelete(context, ref, comisiones[i]),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    CommissionPayment c,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar comisión'),
        content: Text(
          '¿Eliminar el pago de Bs ${c.amount.toStringAsFixed(2)} '
          'a ${c.professionalName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Eliminar',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(comisionesProvider.notifier).remove(c.id);
    }
  }
}

// ─── Total banner ─────────────────────────────────────────────────────────────

class _TotalBanner extends StatelessWidget {
  const _TotalBanner({
    required this.total,
    required this.count,
    required this.fmt,
  });

  final double total;
  final int count;
  final NumberFormat fmt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.iconBgGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.payments_outlined,
              color: AppColors.onlineGreen,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$count pagos registrados',
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 12,
                  ),
                ),
                Text(
                  fmt.format(total),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
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

// ─── Commission card ──────────────────────────────────────────────────────────

class _CommissionCard extends StatelessWidget {
  const _CommissionCard({
    required this.commission,
    required this.fmt,
    required this.dateFmt,
    required this.onDelete,
  });

  final CommissionPayment commission;
  final NumberFormat fmt;
  final DateFormat dateFmt;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.iconBgGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.person_outline,
              color: AppColors.onlineGreen,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  commission.professionalName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Período: ${commission.periodLabel}',
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 11,
                  ),
                ),
                Text(
                  dateFmt.format(commission.registeredAt),
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 11,
                  ),
                ),
                if (commission.notes != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    commission.notes!,
                    style: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 11,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                fmt.format(commission.amount),
                style: const TextStyle(
                  color: AppColors.onlineGreen,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  Icons.delete_outline,
                  color: Color(0xFF6B7280),
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
