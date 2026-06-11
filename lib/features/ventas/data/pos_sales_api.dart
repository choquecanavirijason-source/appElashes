import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/pos_sale_dto.dart';

class PosSalesApi {
  PosSalesApi(this._dio);

  final Dio _dio;

  Future<List<PosSaleDto>> list({int limit = 100}) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.posSales,
      queryParameters: {'limit': limit},
    );
    return response.data!
        .map((e) => PosSaleDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<PosSaleDto> getById(int id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.posSaleById(id),
    );
    return PosSaleDto.fromJson(response.data!);
  }

  Future<PosSaleDto> create(PosSaleCreateDto input) async {
    final body = input.toJson();
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.posSales,
      data: body,
    );
    return PosSaleDto.fromJson(response.data!);
  }

  Future<PosSaleDto> cancel(int id) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.posSaleCancel(id),
    );
    return PosSaleDto.fromJson(response.data!);
  }

  Future<void> delete(int id) async {
    await _dio.delete<void>(ApiEndpoints.posSaleById(id));
  }
}
