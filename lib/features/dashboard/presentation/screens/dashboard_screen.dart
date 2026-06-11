import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/molecules/stat_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/dashboard_overview_provider.dart';
import '../widgets/category_pie_chart.dart';
import '../widgets/revenue_bar_chart.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncOverview = ref.watch(dashboardOverviewProvider);
    final asyncRevenue = ref.watch(revenueSeriesProvider);
    final asyncServices = ref.watch(serviceDistributionProvider);

    final fmt = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(dashboardOverviewProvider);
              ref.invalidate(revenueSeriesProvider);
              ref.invalidate(serviceDistributionProvider);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardOverviewProvider);
          ref.invalidate(revenueSeriesProvider);
          ref.invalidate(serviceDistributionProvider);
        },
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            // ── KPIs ──────────────────────────────────────────────────────
            asyncOverview.when(
              loading: () => const _KpiShimmer(),
              error: (_, __) => const _KpiError(),
              data: (overview) => GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.35,
                children: [
                  StatCard(
                    label: 'Ingresos cobrados',
                    value: fmt.format(overview.paymentsPaidTotal),
                    icon: Icons.trending_up,
                    accentColor: AppColors.brandPrimary,
                  ),
                  StatCard(
                    label: 'Atendidas',
                    value: '${overview.appointmentsCompleted}',
                    icon: Icons.check_circle_outline,
                    accentColor: AppColors.onlineGreen,
                  ),
                  StatCard(
                    label: 'Pendientes',
                    value: '${overview.appointmentsPending}',
                    icon: Icons.schedule_outlined,
                    accentColor: AppColors.statusEnEspera,
                  ),
                  StatCard(
                    label: 'Clientes',
                    value: '${overview.clientsTotal}',
                    icon: Icons.people_outline,
                    accentColor: AppColors.statusReserva,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ── Ingresos por período ──────────────────────────────────────
            _SectionCard(
              title: 'Ingresos por período',
              child: asyncRevenue.when(
                loading: () => const SizedBox(
                  height: 160,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (_, __) => const _ChartError(),
                data: (points) => points.isEmpty
                    ? const _EmptyChart(label: 'Sin datos de ingresos')
                    : RevenueBarChart(data: points),
              ),
            ),
            const SizedBox(height: 16),

            // ── Distribución por servicio ─────────────────────────────────
            _SectionCard(
              title: 'Distribución por servicio',
              child: asyncServices.when(
                loading: () => const SizedBox(
                  height: 130,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (_, __) => const _ChartError(),
                data: (data) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CategoryPieChart(data: data),
                ),
              ),
            ),

            // ── Alertas de stock ──────────────────────────────────────────
            asyncOverview.maybeWhen(
              data: (overview) => overview.lowStockItems > 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: _AlertBanner(
                        icon: Icons.inventory_2_outlined,
                        label:
                            '${overview.lowStockItems} productos con stock bajo',
                        color: AppColors.statusEnEspera,
                      ),
                    )
                  : const SizedBox.shrink(),
              orElse: () => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Section card ─────────────────────────────────────────────────────────────

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
          color: Theme.of(context)
              .colorScheme
              .outlineVariant
              .withValues(alpha: 0.4),
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

// ─── Loading / error placeholders ─────────────────────────────────────────────

class _KpiShimmer extends StatelessWidget {
  const _KpiShimmer();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.35,
      children: List.generate(
        4,
        (_) => Container(
          decoration: BoxDecoration(
            color: AppColors.darkCard,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class _KpiError extends StatelessWidget {
  const _KpiError();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      child: const Text(
        'Error al cargar KPIs',
        style: TextStyle(color: Color(0xFF6B7280)),
      ),
    );
  }
}

class _ChartError extends StatelessWidget {
  const _ChartError();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Center(
        child: Text(
          'No disponible',
          style: TextStyle(color: Color(0xFF6B7280)),
        ),
      ),
    );
  }
}

class _EmptyChart extends StatelessWidget {
  const _EmptyChart({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: Text(label, style: const TextStyle(color: Color(0xFF6B7280))),
      ),
    );
  }
}

class _AlertBanner extends StatelessWidget {
  const _AlertBanner({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
