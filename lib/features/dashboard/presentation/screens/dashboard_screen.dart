import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/molecules/stat_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../operarias/presentation/providers/operarias_provider.dart';
import '../../../ventas/presentation/providers/sales_provider.dart';
import '../widgets/category_pie_chart.dart';
import '../widgets/revenue_bar_chart.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ventas = ref.watch(salesProvider);
    final revenue7d = ref.watch(salesByDayProvider(7));
    final porCategoria = ref.watch(revenueByCategoryProvider);
    final topOperarias = ref.watch(topOperariasProvider);

    final fmt = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 0,
    );
    final totalSemana =
        revenue7d.fold<double>(0, (a, d) => a + d.total);
    final ticketPromedio = ventas.isEmpty
        ? 0.0
        : ventas.fold<double>(0, (a, s) => a + s.total) / ventas.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(salesProvider);
        },
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            // KPIs
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.35,
              children: [
                StatCard(
                  label: 'Ingresos 7d',
                  value: fmt.format(totalSemana),
                  icon: Icons.trending_up,
                  accentColor: AppColors.brandPrimary,
                ),
                StatCard(
                  label: 'Ventas 7d',
                  value: '${ventas.where((s) {
                    final delta = DateTime.now().difference(s.fecha).inDays;
                    return delta <= 6;
                  }).length}',
                  icon: Icons.receipt_long,
                  accentColor: AppColors.brandAccent,
                ),
                StatCard(
                  label: 'Ticket promedio',
                  value: fmt.format(ticketPromedio),
                  icon: Icons.payments_outlined,
                  accentColor: AppColors.statusReserva,
                ),
                StatCard(
                  label: 'Total ventas',
                  value: '${ventas.length}',
                  icon: Icons.shopping_bag_outlined,
                  accentColor: AppColors.statusEnEspera,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Bar chart de los últimos 7 días
            _SectionCard(
              title: 'Ingresos últimos 7 días',
              child: RevenueBarChart(data: revenue7d),
            ),
            const SizedBox(height: 16),

            // Pie de categorías
            _SectionCard(
              title: 'Distribución por categoría',
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CategoryPieChart(data: porCategoria),
              ),
            ),
            const SizedBox(height: 16),

            // Top operarias
            _SectionCard(
              title: 'Top operarias',
              child: Column(
                children: [
                  for (var i = 0; i < topOperarias.length; i++)
                    _OperariaRankRow(
                      ranking: i + 1,
                      operariaId: topOperarias[i].operariaId,
                      total: topOperarias[i].total,
                      ventas: topOperarias[i].ventas,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withValues(
                alpha: 0.4,
              ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _OperariaRankRow extends ConsumerWidget {
  const _OperariaRankRow({
    required this.ranking,
    required this.operariaId,
    required this.total,
    required this.ventas,
  });

  final int ranking;
  final int operariaId;
  final double total;
  final int ventas;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final operaria = ref.watch(operariaByIdProvider(operariaId));
    final fmt = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 0,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.brandPrimary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$ranking',
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: AppColors.brandPrimary,
              ),
            ),
          ),
          const SizedBox(width: 10),
          InitialsAvatar(
            initials: operaria?.iniciales ?? '?',
            size: 32,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  operaria?.nombreCompleto ?? '—',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  '$ventas ${ventas == 1 ? "venta" : "ventas"}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Text(
            fmt.format(total),
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.brandPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
