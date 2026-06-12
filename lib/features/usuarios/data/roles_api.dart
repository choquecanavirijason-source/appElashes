import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/role_dto.dart';

class RolesApi {
  const RolesApi(this._dio);

  final Dio _dio;

  Future<List<RoleDto>> list() async {
    final response = await _dio.get<List<dynamic>>(ApiEndpoints.adminRoles);
    return (response.data ?? [])
        .cast<Map<String, dynamic>>()
        .map(RoleDto.fromJson)
        .toList();
  }

  Future<RoleDto> create(RoleCreateDto dto) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.adminRoles,
      data: dto.toJson(),
    );
    return RoleDto.fromJson(response.data!);
  }

  Future<RoleDto> update(int id, RoleUpdateDto dto) async {
    final response = await _dio.put<Map<String, dynamic>>(
      '${ApiEndpoints.adminRoles}/$id',
      data: dto.toJson(),
    );
    return RoleDto.fromJson(response.data!);
  }

  Future<void> delete(int id) async {
    await _dio.delete<void>('${ApiEndpoints.adminRoles}/$id');
  }
}
