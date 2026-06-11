import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../domain/dashboard_repository.dart';
import '../domain/entities/dashboard_overview.dart';
import '../domain/entities/revenue_point.dart';
import 'dashboard_api.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  const DashboardRepositoryImpl(this._api);

  final DashboardApi _api;

  @override
  Future<DashboardOverview> getOverview() async {
    final dto = await _api.getOverview();
    return DashboardOverview.fromDto(dto);
  }

  @override
  Future<List<DashboardRevenuePoint>> getRevenueSeries() async {
    final items = await _api.getRevenueSeries();
    return items
        .map(
          (dto) => DashboardRevenuePoint(
            date: DateTime.parse(dto.bucket),
            total: dto.paidAmount,
          ),
        )
        .toList();
  }

  @override
  Future<Map<String, double>> getServiceDistribution() async {
    final items = await _api.getServiceDistribution();
    return {for (final item in items) item.serviceName: item.estimatedRevenue};
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return DashboardRepositoryImpl(DashboardApi(dio));
});
