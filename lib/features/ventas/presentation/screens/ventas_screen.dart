import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/presentation/organisms/confirm_dialog.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/pos_sales_repository_impl.dart';
import '../providers/pos_sales_provider.dart';
import '../widgets/sale_form_sheet.dart';

class VentasScreen extends ConsumerWidget {
  const VentasScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVentas = ref.watch(posSalesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventas POS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(posSalesProvider.notifier).refresh(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => SaleFormSheet.show(context),
        icon: const Icon(Icons.add),
        label: const Text('Nueva venta'),
        backgroundColor: AppColors.goldAccent,
        foregroundColor: Colors.black87,
      ),
      body: AsyncValueView<List<PosSale>>(
        value: asyncVentas,
        onRetry: () => ref.invalidate(posSalesProvider),
        builder: (ventas) {
          final now = DateTime.now();
          final hoy = DateTime(now.year, now.month, now.day);
          final ventasHoy = ventas.where((v) {
            final d = v.createdAt;
            return d.year == hoy.year && d.month == hoy.month && d.day == hoy.day;
          }).toList();
          final totalHoy = ventasHoy.fold<double>(0, (a, v) => a + v.total);

          if (ventas.isEmpty) {
            return const EmptyState(
              icon: Icons.point_of_sale,
              title: 'Sin ventas',
              message: 'Las ventas POS registradas aparecerán aquí.',
            );
          }

          return Column(
            children: [
              _HeaderTotal(total: totalHoy, count: ventasHoy.length),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 88),
                  itemCount: ventas.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) => _SaleCard(
                    sale: ventas[i],
                    onCancel: ventas[i].isCancelled
                        ? null
                        : () => _onCancel(context, ref, ventas[i]),
                    onEdit: () => SaleFormSheet.show(context, sale: ventas[i]),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _onCancel(
    BuildContext context,
    WidgetRef ref,
    PosSale sale,
  ) async {
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Cancelar venta',
      message: '¿Cancelar la venta ${sale.saleCode} de ${sale.clientName}?',
      confirmLabel: 'Cancelar venta',
      destructive: true,
    );
    if (!confirmed || !context.mounted) return;

    try {
      await ref.read(posSalesProvider.notifier).cancelSale(sale.id);
    } on ApiException catch (e) {
      developer.log('Error al cancelar venta', name: 'ventas', error: e);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    }
  }
}

// ─── Header ──────────────────────────────────────────────────────────────────

class _HeaderTotal extends StatelessWidget {
  const _HeaderTotal({required this.total, required this.count});

  final double total;
  final int count;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(locale: 'es_BO', symbol: 'Bs ', decimalDigits: 2);
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.brandPrimary, Color(0xFF0D5C3A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingresos de hoy',
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  fmt.format(total),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              '$count ${count == 1 ? 'venta' : 'ventas'}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Sale card ────────────────────────────────────────────────────────────────

class _SaleCard extends StatelessWidget {
  const _SaleCard({required this.sale, this.onCancel, this.onEdit});

  final PosSale sale;
  final VoidCallback? onCancel;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(locale: 'es_BO', symbol: 'Bs ', decimalDigits: 2);
    final fechaFmt = DateFormat('d MMM · HH:mm', 'es_BO').format(sale.createdAt);
    final isCancelled = sale.isCancelled;
    final methodLabel = _methodLabel(sale.paymentMethod);
    final methodColor = _methodColor(sale.paymentMethod);

    final cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onEdit,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  sale.clientName,
                  style: TextStyle(
                    color: isCancelled ? Colors.white38 : Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    decoration: isCancelled ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              Text(
                fmt.format(sale.total),
                style: TextStyle(
                  color: isCancelled ? Colors.white38 : AppColors.brandAccent,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: onEdit,
          child: Row(
            children: [
              Text(
                fechaFmt,
                style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12),
              ),
              const SizedBox(width: 8),
              Text(
                '· ${sale.saleCode}',
                style: const TextStyle(color: Color(0xFF4B5563), fontSize: 11),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _StatusPill(
              label: isCancelled ? 'Cancelada' : 'Pagada',
              color: isCancelled ? AppColors.offlineRed : AppColors.onlineGreen,
            ),
            const SizedBox(width: 8),
            _StatusPill(label: methodLabel, color: methodColor),
            if (sale.createdByUsername != null) ...[
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  sale.createdByUsername!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xFF6B7280), fontSize: 11),
                ),
              ),
            ],
            if (onEdit != null && !isCancelled)
              GestureDetector(
                onTap: onEdit,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.edit_outlined,
                    color: AppColors.goldAccent,
                    size: 20,
                  ),
                ),
              ),
            if (onCancel != null)
              GestureDetector(
                onTap: onCancel,
                child: const Icon(
                  Icons.cancel_outlined,
                  color: Color(0xFF6B7280),
                  size: 20,
                ),
              ),
          ],
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isCancelled
              ? AppColors.offlineRed.withValues(alpha: 0.3)
              : AppColors.darkCardElevated,
        ),
      ),
      child: cardContent,
    );
  }

  String _methodLabel(String method) => switch (method) {
        'cash' => 'Efectivo',
        'card' => 'Tarjeta',
        'transfer' => 'Transferencia',
        'qr' => 'QR',
        _ => method,
      };

  Color _methodColor(String method) => switch (method) {
        'cash' => AppColors.onlineGreen,
        'card' => AppColors.statusEnServicio,
        'transfer' => AppColors.statusReserva,
        'qr' => AppColors.goldAccent,
        _ => AppColors.statusSinEstado,
      };
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(99),
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
