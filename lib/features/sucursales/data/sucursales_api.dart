import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/branch_dto.dart';

class SucursalesApi {
  SucursalesApi(this._dio);

  final Dio _dio;

  Future<List<BranchDto>> list() async {
    final response = await _dio.get<List<dynamic>>(ApiEndpoints.branches);
    return response.data!
        .map((e) => BranchDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<BranchDto> getById(int id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.branchById(id),
    );
    return BranchDto.fromJson(response.data!);
  }

  Future<BranchDto> create(BranchCreateDto input) async {
    final body = input.toJson()
      ..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.branches,
      data: body,
    );
    return BranchDto.fromJson(response.data!);
  }

  Future<BranchDto> update(int id, BranchUpdateDto input) async {
    final body = input.toJson()
      ..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.put<Map<String, dynamic>>(
      ApiEndpoints.branchById(id),
      data: body,
    );
    return BranchDto.fromJson(response.data!);
  }

  Future<void> delete(int id) async {
    await _dio.delete<void>(ApiEndpoints.branchById(id));
  }
}
