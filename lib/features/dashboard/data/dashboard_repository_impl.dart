import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../domain/dashboard_repository.dart';
import '../domain/entities/dashboard_overview.dart';
import 'dashboard_api.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  const DashboardRepositoryImpl(this._api);

  final DashboardApi _api;

  @override
  Future<DashboardOverview> getOverview() async {
    final dto = await _api.getOverview();
    return DashboardOverview.fromDto(dto);
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return DashboardRepositoryImpl(DashboardApi(dio));
});
