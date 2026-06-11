import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_dto.freezed.dart';
part 'payment_dto.g.dart';

@freezed
class PaymentClientDto with _$PaymentClientDto {
  const factory PaymentClientDto({
    required int id,
    required String name,
    @JsonKey(name: 'last_name') String? lastName,
  }) = _PaymentClientDto;
  factory PaymentClientDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentClientDtoFromJson(json);
}

@freezed
class PaymentDto with _$PaymentDto {
  const factory PaymentDto({
    required int id,
    @JsonKey(name: 'client_id') required int clientId,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'appointment_id') int? appointmentId,
    @JsonKey(name: 'sale_id') int? saleId,
    @JsonKey(name: 'registered_by_id') int? registeredById,
    required double amount,
    required String method,
    @Default('paid') String status,
    String? reference,
    String? notes,
    @JsonKey(name: 'paid_at') required DateTime paidAt,
    required PaymentClientDto client,
  }) = _PaymentDto;
  factory PaymentDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentDtoFromJson(json);
}

@freezed
class PaymentCreateDto with _$PaymentCreateDto {
  const factory PaymentCreateDto({
    @JsonKey(name: 'client_id') required int clientId,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'appointment_id') int? appointmentId,
    @JsonKey(name: 'sale_id') int? saleId,
    required double amount,
    @Default('cash') String method,
    @Default('paid') String status,
    String? reference,
    String? notes,
  }) = _PaymentCreateDto;
  factory PaymentCreateDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentCreateDtoFromJson(json);
}
