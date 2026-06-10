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
}
