import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/service_dto.dart';

class ServicesApi {
  ServicesApi(this._dio);

  final Dio _dio;

  Future<List<ServiceDto>> list({
    int? branchId,
    int? categoryId,
    int limit = 200,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.agendaServices,
      queryParameters: {
        'limit': limit,
        if (branchId != null) 'branch_id': branchId,
        if (categoryId != null) 'category_id': categoryId,
      },
    );
    return response.data!
        .map((e) => ServiceDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<ServiceDto> getById(int id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.agendaServiceById(id),
    );
    return ServiceDto.fromJson(response.data!);
  }

  Future<ServiceDto> create(ServiceCreateDto input) async {
    final body = input.toJson()
      ..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.agendaServices,
      data: body,
    );
    return ServiceDto.fromJson(response.data!);
  }

  Future<ServiceDto> update(int id, ServiceUpdateDto input) async {
    final body = input.toJson()
      ..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.put<Map<String, dynamic>>(
      ApiEndpoints.agendaServiceById(id),
      data: body,
    );
    return ServiceDto.fromJson(response.data!);
  }

  Future<void> delete(int id) async {
    await _dio.delete<void>(ApiEndpoints.agendaServiceById(id));
  }
}
