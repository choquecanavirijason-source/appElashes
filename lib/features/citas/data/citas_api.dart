import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/appointment_dto.dart';

class CitasApi {
  CitasApi(this._dio);

  final Dio _dio;

  Future<List<AppointmentDto>> list({
    int? branchId,
    String? startDate,
    String? endDate,
    String? statusFilter,
    String? search,
    int limit = 200,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.agendaAppointments,
      queryParameters: {
        'limit': limit,
        if (branchId != null) 'branch_id': branchId,
        if (startDate != null) 'start_date': startDate,
        if (endDate != null) 'end_date': endDate,
        if (statusFilter != null) 'status_filter': statusFilter,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
    return response.data!
        .map((e) => AppointmentDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<AppointmentDto> getById(int id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.agendaAppointmentById(id),
    );
    return AppointmentDto.fromJson(response.data!);
  }

  Future<AppointmentDto> create(AppointmentCreateDto input) async {
    final body = input.toJson()
      ..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.agendaAppointments,
      data: body,
    );
    return AppointmentDto.fromJson(response.data!);
  }

  Future<AppointmentDto> update(int id, AppointmentUpdateDto input) async {
    final body = input.toJson()
      ..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.put<Map<String, dynamic>>(
      ApiEndpoints.agendaAppointmentById(id),
      data: body,
    );
    return AppointmentDto.fromJson(response.data!);
  }

  Future<void> delete(int id) async {
    await _dio.delete<void>(ApiEndpoints.agendaAppointmentById(id));
  }
}
