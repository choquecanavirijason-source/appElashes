import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/dashboard_repository_impl.dart';
import '../../domain/entities/dashboard_overview.dart';
import '../../domain/entities/revenue_point.dart';

class DashboardOverviewNotifier
    extends AutoDisposeAsyncNotifier<DashboardOverview> {
  @override
  Future<DashboardOverview> build() async {
    return ref.read(dashboardRepositoryProvider).getOverview();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(dashboardRepositoryProvider).getOverview(),
    );
  }
}

final dashboardOverviewProvider =
    AutoDisposeAsyncNotifierProvider<DashboardOverviewNotifier, DashboardOverview>(
  DashboardOverviewNotifier.new,
);

final revenueSeriesProvider =
    FutureProvider.autoDispose<List<DashboardRevenuePoint>>((ref) {
  return ref.read(dashboardRepositoryProvider).getRevenueSeries();
});

final serviceDistributionProvider =
    FutureProvider.autoDispose<Map<String, double>>((ref) {
  return ref.read(dashboardRepositoryProvider).getServiceDistribution();
});
