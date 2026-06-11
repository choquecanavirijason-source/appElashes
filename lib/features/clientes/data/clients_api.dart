import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/client_dto.dart';

class ClientsApi {
  ClientsApi(this._dio);

  final Dio _dio;

  Future<List<ClientDto>> list({
    int? branchId,
    String? search,
    int limit = 100,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.clients,
      queryParameters: {
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
        if (branchId != null) 'branch_id': branchId,
      },
    );
    return response.data!
        .map((e) => ClientDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<ClientDto> getById(int id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.clientById(id),
    );
    return ClientDto.fromJson(response.data!);
  }

  Future<ClientDto> create(ClientCreateDto input) async {
    final body = input.toJson()
      ..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.clients,
      data: body,
    );
    return ClientDto.fromJson(response.data!);
  }

  Future<ClientDto> update(int id, ClientUpdateDto input) async {
    final body = input.toJson()
      ..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.put<Map<String, dynamic>>(
      ApiEndpoints.clientById(id),
      data: body,
    );
    return ClientDto.fromJson(response.data!);
  }

  Future<void> delete(int id) async {
    await _dio.delete<void>(ApiEndpoints.clientById(id));
  }
}
