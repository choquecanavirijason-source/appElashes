import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_dto.freezed.dart';
part 'commission_dto.g.dart';

@freezed
class CommissionPaymentDto with _$CommissionPaymentDto {
  const factory CommissionPaymentDto({
    required int id,
    @JsonKey(name: 'professional_id') required int professionalId,
    @JsonKey(name: 'professional_name') required String professionalName,
    required double amount,
    @JsonKey(name: 'period_start') String? periodStart,
    @JsonKey(name: 'period_end') String? periodEnd,
    String? notes,
    @JsonKey(name: 'registered_at') required String registeredAt,
    @JsonKey(name: 'registered_by_name') String? registeredByName,
  }) = _CommissionPaymentDto;

  factory CommissionPaymentDto.fromJson(Map<String, dynamic> json) =>
      _$CommissionPaymentDtoFromJson(json);
}

@freezed
class CommissionPaymentCreateDto with _$CommissionPaymentCreateDto {
  const factory CommissionPaymentCreateDto({
    @JsonKey(name: 'professional_id') required int professionalId,
    required double amount,
    @JsonKey(name: 'period_start') String? periodStart,
    @JsonKey(name: 'period_end') String? periodEnd,
    String? notes,
  }) = _CommissionPaymentCreateDto;

  factory CommissionPaymentCreateDto.fromJson(Map<String, dynamic> json) =>
      _$CommissionPaymentCreateDtoFromJson(json);
}

@freezed
class ProfessionalOptionDto with _$ProfessionalOptionDto {
  const factory ProfessionalOptionDto({
    required int id,
    required String username,
    String? email,
  }) = _ProfessionalOptionDto;

  factory ProfessionalOptionDto.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalOptionDtoFromJson(json);
}
