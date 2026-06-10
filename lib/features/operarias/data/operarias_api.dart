import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/operaria_dto.dart';

class OperariasApi {
  OperariasApi(this._dio);

  final Dio _dio;

  Future<List<OperariaDto>> list({String? search, int limit = 100}) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.adminUsers,
      queryParameters: {
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
    return response.data!
        .map((e) => OperariaDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<OperariaDto> getById(int id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.adminUserById(id),
    );
    return OperariaDto.fromJson(response.data!);
  }

  Future<OperariaDto> create(OperariaCreateDto input) async {
    final body = input.toJson()
      ..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.adminUsers,
      data: body,
    );
    return OperariaDto.fromJson(response.data!);
  }

  Future<OperariaDto> update(int id, OperariaUpdateDto input) async {
    final body = input.toJson()
      ..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.put<Map<String, dynamic>>(
      ApiEndpoints.adminUserById(id),
      data: body,
    );
    return OperariaDto.fromJson(response.data!);
  }

  Future<void> delete(int id) async {
    await _dio.delete<void>(ApiEndpoints.adminUserById(id));
  }
}
