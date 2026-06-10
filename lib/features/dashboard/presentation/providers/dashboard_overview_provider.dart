import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/dashboard_repository_impl.dart';
import '../../domain/entities/dashboard_overview.dart';

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
