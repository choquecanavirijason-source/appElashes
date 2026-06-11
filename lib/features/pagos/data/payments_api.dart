import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/payment_dto.dart';

class PaymentsApi {
  PaymentsApi(this._dio);

  final Dio _dio;

  Future<List<PaymentDto>> list({
    int? clientId,
    int? branchId,
    String? method,
    int limit = 200,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.payments,
      queryParameters: {
        'limit': limit,
        if (clientId != null) 'client_id': clientId,
        if (branchId != null) 'branch_id': branchId,
        if (method != null) 'method': method,
      },
    );
    return response.data!
        .map((e) => PaymentDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<PaymentDto> create(PaymentCreateDto input) async {
    final body = input.toJson()..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.payments,
      data: body,
    );
    return PaymentDto.fromJson(response.data!);
  }

  Future<void> delete(int id) async {
    await _dio.delete<void>('${ApiEndpoints.payments}$id');
  }
}
