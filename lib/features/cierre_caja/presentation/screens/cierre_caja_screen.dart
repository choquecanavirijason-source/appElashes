import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/daily_closing_repository_impl.dart';
import '../providers/cierre_caja_provider.dart';

class CierreCajaScreen extends ConsumerWidget {
  const CierreCajaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedClosingDateProvider);
    final dateStr = DateFormat('yyyy-MM-dd').format(selectedDate);
    final asyncClosing = ref.watch(dailyClosingProvider(dateStr));
    final displayFmt = DateFormat('EEEE d MMM yyyy', 'es');
    final mFmt = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 2,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cierre de caja'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(dailyClosingProvider(dateStr)),
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Date picker ─────────────────────────────────────────────────
          _DateBar(
            label: displayFmt.format(selectedDate),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                ref.read(selectedClosingDateProvider.notifier).state = picked;
              }
            },
          ),
          // ── Content ─────────────────────────────────────────────────────
          Expanded(
            child: asyncClosing.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Color(0xFF6B7280),
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Sin datos para esta fecha',
                      style: TextStyle(color: Color(0xFF6B7280)),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () =>
                          ref.invalidate(dailyClosingProvider(dateStr)),
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
              data: (closing) => _ClosingBody(
                closing: closing,
                mFmt: mFmt,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Date bar ─────────────────────────────────────────────────────────────────

class _DateBar extends StatelessWidget {
  const _DateBar({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.darkCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.darkCardElevated),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              color: AppColors.brandPrimary,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF6B7280),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Closing body ─────────────────────────────────────────────────────────────

class _ClosingBody extends StatelessWidget {
  const _ClosingBody({required this.closing, required this.mFmt});

  final DailyClosing closing;
  final NumberFormat mFmt;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 88),
      children: [
        // ── Summary cards ──────────────────────────────────────────────
        _SummaryGrid(closing: closing, mFmt: mFmt),
        const SizedBox(height: 16),

        // ── Payment breakdown ──────────────────────────────────────────
        if (closing.totalsByPayment.isNotEmpty) ...[
          const _SectionHeader(title: 'Por método de pago'),
          const SizedBox(height: 8),
          _PaymentMethodBreakdown(
            totals: closing.totalsByPayment,
            mFmt: mFmt,
          ),
          const SizedBox(height: 16),
        ],

        // ── Professional summaries ─────────────────────────────────────
        if (closing.summaryByProfessional.isNotEmpty) ...[
          const _SectionHeader(title: 'Resumen por operaria'),
          const SizedBox(height: 8),
          ...closing.summaryByProfessional.map(
            (s) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _ProfessionalSummaryCard(summary: s, mFmt: mFmt),
            ),
          ),
          const SizedBox(height: 8),
        ],

        // ── Items list ────────────────────────────────────────────────
        _SectionHeader(
          title: 'Detalle (${closing.items.length} registros)',
        ),
        const SizedBox(height: 8),
        if (closing.items.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'Sin registros para esta fecha',
                style: TextStyle(color: Color(0xFF6B7280)),
              ),
            ),
          )
        else
          ...closing.items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _ClosingItemCard(item: item, mFmt: mFmt),
            ),
          ),
      ],
    );
  }
}

// ─── Summary grid ─────────────────────────────────────────────────────────────

class _SummaryGrid extends StatelessWidget {
  const _SummaryGrid({required this.closing, required this.mFmt});

  final DailyClosing closing;
  final NumberFormat mFmt;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.5,
      children: [
        _SummaryCard(
          label: 'Total general',
          value: mFmt.format(closing.grandTotal),
          icon: Icons.account_balance_wallet_outlined,
          color: AppColors.brandPrimary,
        ),
        _SummaryCard(
          label: 'Cobrado',
          value: mFmt.format(closing.totalPaid),
          icon: Icons.check_circle_outline,
          color: AppColors.onlineGreen,
        ),
        _SummaryCard(
          label: 'Pendiente',
          value: mFmt.format(closing.totalUnpaid),
          icon: Icons.schedule_outlined,
          color: AppColors.statusEnEspera,
        ),
        _SummaryCard(
          label: 'Comisiones',
          value: mFmt.format(closing.grandCommission),
          icon: Icons.payments_outlined,
          color: AppColors.statusReserva,
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
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
          Icon(icon, color: color, size: 20),
          const Spacer(),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF6B7280), fontSize: 11),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Payment method breakdown ─────────────────────────────────────────────────

class _PaymentMethodBreakdown extends StatelessWidget {
  const _PaymentMethodBreakdown({required this.totals, required this.mFmt});

  final Map<String, double> totals;
  final NumberFormat mFmt;

  String _label(String m) => switch (m) {
        'cash' => 'Efectivo',
        'card' => 'Tarjeta',
        'transfer' => 'Transferencia',
        'qr' => 'QR',
        _ => m,
      };

  Color _color(String m) => switch (m) {
        'cash' => AppColors.onlineGreen,
        'card' => AppColors.statusEnServicio,
        'transfer' => AppColors.statusReserva,
        'qr' => AppColors.goldAccent,
        _ => AppColors.statusSinEstado,
      };

  @override
  Widget build(BuildContext context) {
    final entries = totals.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Column(
        children: [
          for (final e in entries)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: _color(e.key),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _label(e.key),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    mFmt.format(e.value),
                    style: const TextStyle(
                      color: AppColors.onlineGreen,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
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

// ─── Professional summary card ────────────────────────────────────────────────

class _ProfessionalSummaryCard extends StatelessWidget {
  const _ProfessionalSummaryCard({
    required this.summary,
    required this.mFmt,
  });

  final ProfessionalClosingSummary summary;
  final NumberFormat mFmt;

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
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.brandPrimary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.person_outline,
              color: AppColors.brandPrimary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summary.professionalName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '${summary.ticketCount} servicios · '
                  '${(summary.commissionRate * 100).toStringAsFixed(0)}% comisión',
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                mFmt.format(summary.totalPrice),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              Text(
                'Com: ${mFmt.format(summary.commission)}',
                style: const TextStyle(
                  color: AppColors.onlineGreen,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Closing item card ────────────────────────────────────────────────────────

class _ClosingItemCard extends StatelessWidget {
  const _ClosingItemCard({required this.item, required this.mFmt});

  final ClosingItem item;
  final NumberFormat mFmt;

  @override
  Widget build(BuildContext context) {
    final timeFmt = DateFormat('HH:mm');
    final isPaid = item.isPaid;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Expanded(
                child: Text(
                  item.clientName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
              _StatusPill(isPaid: isPaid),
              const SizedBox(width: 8),
              Text(
                mFmt.format(item.totalPrice),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Services
          Text(
            item.servicesLabel.isEmpty ? '—' : item.servicesLabel,
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          // Footer row
          Row(
            children: [
              Text(
                '${item.professionalName} · ${timeFmt.format(item.startTime)}',
                style: const TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 11,
                ),
              ),
              const Spacer(),
              if (!isPaid && item.balanceDue > 0)
                Text(
                  'Debe: ${mFmt.format(item.balanceDue)}',
                  style: const TextStyle(
                    color: AppColors.statusEnEspera,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (isPaid)
                Text(
                  'Com: ${mFmt.format(item.commission)}',
                  style: const TextStyle(
                    color: AppColors.onlineGreen,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.isPaid});

  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    final color = isPaid ? AppColors.onlineGreen : AppColors.statusEnEspera;
    final label = isPaid ? 'Pagado' : 'Pendiente';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        color: Color(0xFF6B7280),
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}
