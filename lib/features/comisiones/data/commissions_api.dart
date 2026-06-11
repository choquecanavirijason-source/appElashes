import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/commission_dto.dart';

class CommissionsApi {
  const CommissionsApi(this._dio);

  final Dio _dio;

  Future<List<CommissionPaymentDto>> list() async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.commissionPayments,
    );
    return (response.data ?? [])
        .cast<Map<String, dynamic>>()
        .map(CommissionPaymentDto.fromJson)
        .toList();
  }

  Future<CommissionPaymentDto> create(CommissionPaymentCreateDto dto) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.commissionPayments,
      data: dto.toJson(),
    );
    return CommissionPaymentDto.fromJson(response.data!);
  }

  Future<void> delete(int id) async {
    await _dio.delete<void>('${ApiEndpoints.commissionPayments}/$id');
  }

  Future<List<ProfessionalOptionDto>> getProfessionals() async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.agendaProfessionalsForSelect,
    );
    return (response.data ?? [])
        .cast<Map<String, dynamic>>()
        .map(ProfessionalOptionDto.fromJson)
        .toList();
  }
}
