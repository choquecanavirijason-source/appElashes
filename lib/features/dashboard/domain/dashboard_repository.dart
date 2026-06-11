import 'entities/dashboard_overview.dart';
import 'entities/revenue_point.dart';

abstract interface class DashboardRepository {
  Future<DashboardOverview> getOverview();
  Future<List<DashboardRevenuePoint>> getRevenueSeries();
  Future<Map<String, double>> getServiceDistribution();
}
