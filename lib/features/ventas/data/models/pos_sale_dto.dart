import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_sale_dto.freezed.dart';
part 'pos_sale_dto.g.dart';

@freezed
class PosSaleClientDto with _$PosSaleClientDto {
  const factory PosSaleClientDto({
    required int id,
    required String name,
    @JsonKey(name: 'last_name') String? lastName,
  }) = _PosSaleClientDto;
  factory PosSaleClientDto.fromJson(Map<String, dynamic> json) =>
      _$PosSaleClientDtoFromJson(json);
}

@freezed
class PosSaleCreatedByDto with _$PosSaleCreatedByDto {
  const factory PosSaleCreatedByDto({
    required int id,
    required String username,
  }) = _PosSaleCreatedByDto;
  factory PosSaleCreatedByDto.fromJson(Map<String, dynamic> json) =>
      _$PosSaleCreatedByDtoFromJson(json);
}

@freezed
class PosSaleDto with _$PosSaleDto {
  const factory PosSaleDto({
    required int id,
    @JsonKey(name: 'sale_code') required String saleCode,
    @JsonKey(name: 'client_id') required int clientId,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'created_by_id') int? createdById,
    @Default(0.0) double subtotal,
    @JsonKey(name: 'discount_type') @Default('amount') String discountType,
    @JsonKey(name: 'discount_value') @Default(0.0) double discountValue,
    @Default(0.0) double total,
    @JsonKey(name: 'payment_method') @Default('cash') String paymentMethod,
    @Default('paid') String status,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required PosSaleClientDto client,
    @JsonKey(name: 'created_by') PosSaleCreatedByDto? createdBy,
  }) = _PosSaleDto;
  factory PosSaleDto.fromJson(Map<String, dynamic> json) =>
      _$PosSaleDtoFromJson(json);
}

@freezed
class PosSaleItemCreateDto with _$PosSaleItemCreateDto {
  const factory PosSaleItemCreateDto({
    @JsonKey(name: 'service_id') required int serviceId,
    @JsonKey(name: 'professional_id') int? professionalId,
    @JsonKey(name: 'is_ia') @Default(false) bool isIa,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    @JsonKey(name: 'branch_id') int? branchId,
    double? price,
    int? quantity,
  }) = _PosSaleItemCreateDto;
  factory PosSaleItemCreateDto.fromJson(Map<String, dynamic> json) =>
      _$PosSaleItemCreateDtoFromJson(json);
}

@freezed
class PosSaleCreateDto with _$PosSaleCreateDto {
  const factory PosSaleCreateDto({
    @JsonKey(name: 'client_id') required int clientId,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'payment_method') @Default('cash') String paymentMethod,
    @JsonKey(name: 'discount_type') @Default('amount') String discountType,
    @JsonKey(name: 'discount_value') @Default(0.0) double discountValue,
    String? notes,
    required List<PosSaleItemCreateDto> items,
    @JsonKey(name: 'link_appointment_id') int? linkAppointmentId,
    @JsonKey(name: 'sale_without_appointments') @Default(false) bool saleWithoutAppointments,
  }) = _PosSaleCreateDto;
  factory PosSaleCreateDto.fromJson(Map<String, dynamic> json) =>
      _$PosSaleCreateDtoFromJson(json);
}
