import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/atoms/status_badge.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../clientes/presentation/providers/clients_provider.dart';
import '../../../operarias/presentation/providers/operarias_provider.dart';
import '../../domain/entities/sale.dart';
import '../providers/sales_provider.dart';
import '../widgets/sale_form_sheet.dart';

class VentasScreen extends ConsumerWidget {
  const VentasScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ventas = ref.watch(salesProvider);
    final now = DateTime.now();
    final hoy = DateTime(now.year, now.month, now.day);

    final totalHoy = ventas.where((s) {
      return s.fecha.year == hoy.year &&
          s.fecha.month == hoy.month &&
          s.fecha.day == hoy.day;
    }).fold<double>(0, (a, s) => a + s.total);

    final countHoy = ventas.where((s) {
      return s.fecha.year == hoy.year &&
          s.fecha.month == hoy.month &&
          s.fecha.day == hoy.day;
    }).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Ventas')),
      body: Column(
        children: [
          _HeaderTotal(total: totalHoy, count: countHoy),
          Expanded(
            child: ventas.isEmpty
                ? const EmptyState(
                    icon: Icons.point_of_sale,
                    title: 'Sin ventas',
                    message: 'Registra la primera con +.',
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
                    itemCount: ventas.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) => _SaleCard(sale: ventas[i]),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.brandPrimary,
        foregroundColor: Colors.white,
        onPressed: () => SaleFormSheet.show(context),
        icon: const Icon(Icons.point_of_sale),
        label: const Text('Nueva venta'),
      ),
    );
  }
}

class _HeaderTotal extends StatelessWidget {
  const _HeaderTotal({required this.total, required this.count});

  final double total;
  final int count;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 2,
    );
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.brandPrimary, AppColors.brandAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingresos de hoy',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              '$count ${count == 1 ? "venta" : "ventas"}',
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

class _SaleCard extends ConsumerWidget {
  const _SaleCard({required this.sale});

  final Sale sale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cliente = sale.clienteId == null
        ? null
        : ref.watch(clientByIdProvider(sale.clienteId!));
    final operaria = ref.watch(operariaByIdProvider(sale.operariaId));
    final fechaFmt = DateFormat('d MMM · HH:mm', 'es').format(sale.fecha);
    final totalFmt = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 2,
    ).format(sale.total);

    return Card(
      margin: EdgeInsets.zero,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    sale.categoriaPrincipal,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  totalFmt,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.brandPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              fechaFmt,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const Divider(height: 18),
            Row(
              children: [
                InitialsAvatar(
                  initials: operaria?.iniciales ?? '?',
                  size: 28,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    operaria?.nombreCompleto ?? '—',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                StatusBadge(
                  label: sale.metodoPago.label,
                  color: sale.metodoPago.color,
                  icon: sale.metodoPago.icon,
                ),
              ],
            ),
            if (cliente != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 14,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    cliente.nombreCompleto,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
            if (sale.descuento > 0) ...[
              const SizedBox(height: 6),
              Text(
                'Descuento aplicado: Bs ${sale.descuento.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.statusCancelado,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
