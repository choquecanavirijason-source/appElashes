import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_dto.freezed.dart';
part 'appointment_dto.g.dart';

@freezed
class ClientSummaryDto with _$ClientSummaryDto {
  const factory ClientSummaryDto({
    required int id,
    required String name,
    @JsonKey(name: 'last_name') String? lastName,
    int? age,
    String? phone,
    String? email,
  }) = _ClientSummaryDto;

  factory ClientSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$ClientSummaryDtoFromJson(json);
}

@freezed
class UserSummaryDto with _$UserSummaryDto {
  const factory UserSummaryDto({
    required int id,
    required String username,
    required String email,
    String? phone,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _UserSummaryDto;

  factory UserSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryDtoFromJson(json);
}

@freezed
class AppointmentServiceDto with _$AppointmentServiceDto {
  const factory AppointmentServiceDto({
    required int id,
    required String name,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    required double price,
    String? description,
  }) = _AppointmentServiceDto;

  factory AppointmentServiceDto.fromJson(Map<String, dynamic> json) =>
      _$AppointmentServiceDtoFromJson(json);
}

@freezed
class AppointmentDto with _$AppointmentDto {
  const factory AppointmentDto({
    required int id,
    @JsonKey(name: 'ticket_code') String? ticketCode,
    @JsonKey(name: 'client_id') required int clientId,
    @JsonKey(name: 'created_by_id') int? createdById,
    @JsonKey(name: 'professional_id') int? professionalId,
    @JsonKey(name: 'service_id') int? serviceId,
    @JsonKey(name: 'service_ids') List<int>? serviceIds,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'sale_id') int? saleId,
    @JsonKey(name: 'is_ia') @Default(false) bool isIa,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    @Default('pending') String status,
    @JsonKey(name: 'advance_payment_amount') @Default(0.0) double advancePaymentAmount,
    required ClientSummaryDto client,
    @JsonKey(name: 'created_by') UserSummaryDto? createdBy,
    UserSummaryDto? professional,
    AppointmentServiceDto? service,
    List<AppointmentServiceDto>? services,
  }) = _AppointmentDto;

  factory AppointmentDto.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDtoFromJson(json);
}

@freezed
class AppointmentCreateDto with _$AppointmentCreateDto {
  const factory AppointmentCreateDto({
    @JsonKey(name: 'client_id') required int clientId,
    @JsonKey(name: 'professional_id') int? professionalId,
    @JsonKey(name: 'service_id') int? serviceId,
    @JsonKey(name: 'service_ids') List<int>? serviceIds,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'is_ia') @Default(false) bool isIa,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    @Default('pending') String status,
    @JsonKey(name: 'advance_payment_amount') @Default(0.0) double advancePaymentAmount,
  }) = _AppointmentCreateDto;

  factory AppointmentCreateDto.fromJson(Map<String, dynamic> json) =>
      _$AppointmentCreateDtoFromJson(json);
}

@freezed
class AppointmentUpdateDto with _$AppointmentUpdateDto {
  const factory AppointmentUpdateDto({
    @JsonKey(name: 'client_id') int? clientId,
    @JsonKey(name: 'professional_id') int? professionalId,
    @JsonKey(name: 'service_id') int? serviceId,
    @JsonKey(name: 'service_ids') List<int>? serviceIds,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'is_ia') bool? isIa,
    @JsonKey(name: 'start_time') DateTime? startTime,
    @JsonKey(name: 'end_time') DateTime? endTime,
    String? status,
    @JsonKey(name: 'skip_availability_check') @Default(false) bool skipAvailabilityCheck,
  }) = _AppointmentUpdateDto;

  factory AppointmentUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$AppointmentUpdateDtoFromJson(json);
}
