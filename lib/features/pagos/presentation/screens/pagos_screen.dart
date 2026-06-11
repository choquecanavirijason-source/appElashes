import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/payments_repository_impl.dart';
import '../providers/payments_provider.dart';

class PagosScreen extends ConsumerWidget {
  const PagosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPagos = ref.watch(paymentsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(paymentsProvider.notifier).refresh(),
          ),
        ],
      ),
      body: AsyncValueView<List<Payment>>(
        value: asyncPagos,
        onRetry: () => ref.invalidate(paymentsProvider),
        builder: (pagos) {
          if (pagos.isEmpty) {
            return const EmptyState(
              icon: Icons.receipt_long_outlined,
              title: 'Sin pagos',
              message: 'Los pagos registrados aparecerán aquí.',
            );
          }

          final totalGeneral = pagos.fold<double>(0, (a, p) => a + p.amount);
          final fmt = NumberFormat.currency(
            locale: 'es_BO',
            symbol: 'Bs ',
            decimalDigits: 2,
          );

          return Column(
            children: [
              _TotalBanner(total: totalGeneral, count: pagos.length, fmt: fmt),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 88),
                  itemCount: pagos.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) => _PaymentCard(payment: pagos[i], fmt: fmt),
                ),
              ),
            ],
          );
        },
      ),
    );
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
                  style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12),
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

// ─── Payment card ─────────────────────────────────────────────────────────────

class _PaymentCard extends StatelessWidget {
  const _PaymentCard({required this.payment, required this.fmt});

  final Payment payment;
  final NumberFormat fmt;

  @override
  Widget build(BuildContext context) {
    final fechaFmt = DateFormat('d MMM · HH:mm', 'es_BO').format(payment.paidAt);
    final methodLabel = _methodLabel(payment.method);
    final methodColor = _methodColor(payment.method);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: methodColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_methodIcon(payment.method), color: methodColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment.clientName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      fechaFmt,
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 6),
                    _Pill(label: methodLabel, color: methodColor),
                    if (payment.appointmentId != null) ...[
                      const SizedBox(width: 4),
                      _Pill(
                        label: 'Cita #${payment.appointmentId}',
                        color: AppColors.statusAtendido,
                      ),
                    ],
                  ],
                ),
                if (payment.reference != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Ref: ${payment.reference}',
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 11,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Text(
            fmt.format(payment.amount),
            style: const TextStyle(
              color: AppColors.onlineGreen,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String _methodLabel(String m) => switch (m) {
        'cash' => 'Efectivo',
        'card' => 'Tarjeta',
        'transfer' => 'Transferencia',
        'qr' => 'QR',
        _ => m,
      };

  Color _methodColor(String m) => switch (m) {
        'cash' => AppColors.onlineGreen,
        'card' => AppColors.statusEnServicio,
        'transfer' => AppColors.statusReserva,
        'qr' => AppColors.goldAccent,
        _ => AppColors.statusSinEstado,
      };

  IconData _methodIcon(String m) => switch (m) {
        'cash' => Icons.attach_money,
        'card' => Icons.credit_card,
        'transfer' => Icons.swap_horiz,
        'qr' => Icons.qr_code,
        _ => Icons.payments_outlined,
      };
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600),
      ),
    );
  }
}
