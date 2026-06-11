import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_closing_dto.freezed.dart';
part 'daily_closing_dto.g.dart';

@freezed
class DailyClosingItemDto with _$DailyClosingItemDto {
  const factory DailyClosingItemDto({
    @JsonKey(name: 'appointment_id') required int appointmentId,
    @JsonKey(name: 'ticket_code') String? ticketCode,
    @JsonKey(name: 'sale_code') String? saleCode,
    @JsonKey(name: 'client_name') @Default('') String clientName,
    @JsonKey(name: 'service_names') @Default([]) List<String> serviceNames,
    @JsonKey(name: 'professional_name') @Default('') String professionalName,
    @JsonKey(name: 'professional_id') int? professionalId,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'duration_minutes') @Default(0) int durationMinutes,
    @Default('') String status,
    @JsonKey(name: 'total_price') @Default(0.0) double totalPrice,
    @JsonKey(name: 'commission_rate') @Default(0.0) double commissionRate,
    @Default(0.0) double commission,
    @JsonKey(name: 'branch_name') @Default('') String branchName,
    @JsonKey(name: 'sale_id') int? saleId,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'is_paid') @Default(false) bool isPaid,
    @JsonKey(name: 'advance_payment_amount') @Default(0.0) double advancePaymentAmount,
    @JsonKey(name: 'balance_due') @Default(0.0) double balanceDue,
  }) = _DailyClosingItemDto;

  factory DailyClosingItemDto.fromJson(Map<String, dynamic> json) =>
      _$DailyClosingItemDtoFromJson(json);
}

@freezed
class ProfessionalSummaryDto with _$ProfessionalSummaryDto {
  const factory ProfessionalSummaryDto({
    @JsonKey(name: 'professional_id') int? professionalId,
    @JsonKey(name: 'professional_name') @Default('') String professionalName,
    @JsonKey(name: 'ticket_count') @Default(0) int ticketCount,
    @JsonKey(name: 'total_price') @Default(0.0) double totalPrice,
    @Default(0.0) double commission,
    @JsonKey(name: 'commission_rate') @Default(0.0) double commissionRate,
  }) = _ProfessionalSummaryDto;

  factory ProfessionalSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalSummaryDtoFromJson(json);
}

@freezed
class DailyClosingResponseDto with _$DailyClosingResponseDto {
  const factory DailyClosingResponseDto({
    required String date,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'branch_name') String? branchName,
    @Default([]) List<DailyClosingItemDto> items,
    @JsonKey(name: 'grand_total') @Default(0.0) double grandTotal,
    @JsonKey(name: 'grand_commission') @Default(0.0) double grandCommission,
    @JsonKey(name: 'total_paid') @Default(0.0) double totalPaid,
    @JsonKey(name: 'total_unpaid') @Default(0.0) double totalUnpaid,
    @JsonKey(
      name: 'totals_by_payment',
      fromJson: _parseDoubleMap,
      toJson: _identityMap,
    )
    @Default(<String, double>{})
    Map<String, double> totalsByPayment,
    @JsonKey(name: 'summary_by_professional')
    @Default([])
    List<ProfessionalSummaryDto> summaryByProfessional,
  }) = _DailyClosingResponseDto;

  factory DailyClosingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DailyClosingResponseDtoFromJson(json);
}

Map<String, double> _parseDoubleMap(Object? json) {
  if (json == null) return {};
  return (json as Map).map(
    (k, v) => MapEntry(k as String, (v as num).toDouble()),
  );
}

Map<String, double> _identityMap(Map<String, double> m) => m;
