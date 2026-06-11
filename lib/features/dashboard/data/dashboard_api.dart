import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/dashboard_dto.dart';

class DashboardApi {
  const DashboardApi(this._dio);

  final Dio _dio;

  Future<DashboardOverviewDto> getOverview() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.dashboardOverview,
    );
    return DashboardOverviewDto.fromJson(response.data!);
  }

  Future<List<RevenueSeriesItemDto>> getRevenueSeries() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.dashboardRevenueSeries,
    );
    final items = (response.data?['series'] as List<dynamic>?) ?? [];
    return items
        .cast<Map<String, dynamic>>()
        .map(RevenueSeriesItemDto.fromJson)
        .toList();
  }

  Future<List<ServiceDistributionItemDto>> getServiceDistribution() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.dashboardServiceDistribution,
    );
    final items = (response.data?['rows'] as List<dynamic>?) ?? [];
    return items
        .cast<Map<String, dynamic>>()
        .map(ServiceDistributionItemDto.fromJson)
        .toList();
  }
}
