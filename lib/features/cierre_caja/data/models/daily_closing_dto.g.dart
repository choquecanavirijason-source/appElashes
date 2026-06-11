// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_closing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyClosingItemDtoImpl _$$DailyClosingItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyClosingItemDtoImpl(
      appointmentId: (json['appointment_id'] as num).toInt(),
      ticketCode: json['ticket_code'] as String?,
      saleCode: json['sale_code'] as String?,
      clientName: json['client_name'] as String? ?? '',
      serviceNames: (json['service_names'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      professionalName: json['professional_name'] as String? ?? '',
      professionalId: (json['professional_id'] as num?)?.toInt(),
      startTime: json['start_time'] as String,
      durationMinutes: (json['duration_minutes'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? '',
      totalPrice: (json['total_price'] as num?)?.toDouble() ?? 0.0,
      commissionRate: (json['commission_rate'] as num?)?.toDouble() ?? 0.0,
      commission: (json['commission'] as num?)?.toDouble() ?? 0.0,
      branchName: json['branch_name'] as String? ?? '',
      saleId: (json['sale_id'] as num?)?.toInt(),
      paymentMethod: json['payment_method'] as String?,
      isPaid: json['is_paid'] as bool? ?? false,
      advancePaymentAmount:
          (json['advance_payment_amount'] as num?)?.toDouble() ?? 0.0,
      balanceDue: (json['balance_due'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$DailyClosingItemDtoImplToJson(
        _$DailyClosingItemDtoImpl instance) =>
    <String, dynamic>{
      'appointment_id': instance.appointmentId,
      'ticket_code': instance.ticketCode,
      'sale_code': instance.saleCode,
      'client_name': instance.clientName,
      'service_names': instance.serviceNames,
      'professional_name': instance.professionalName,
      'professional_id': instance.professionalId,
      'start_time': instance.startTime,
      'duration_minutes': instance.durationMinutes,
      'status': instance.status,
      'total_price': instance.totalPrice,
      'commission_rate': instance.commissionRate,
      'commission': instance.commission,
      'branch_name': instance.branchName,
      'sale_id': instance.saleId,
      'payment_method': instance.paymentMethod,
      'is_paid': instance.isPaid,
      'advance_payment_amount': instance.advancePaymentAmount,
      'balance_due': instance.balanceDue,
    };

_$ProfessionalSummaryDtoImpl _$$ProfessionalSummaryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfessionalSummaryDtoImpl(
      professionalId: (json['professional_id'] as num?)?.toInt(),
      professionalName: json['professional_name'] as String? ?? '',
      ticketCount: (json['ticket_count'] as num?)?.toInt() ?? 0,
      totalPrice: (json['total_price'] as num?)?.toDouble() ?? 0.0,
      commission: (json['commission'] as num?)?.toDouble() ?? 0.0,
      commissionRate: (json['commission_rate'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ProfessionalSummaryDtoImplToJson(
        _$ProfessionalSummaryDtoImpl instance) =>
    <String, dynamic>{
      'professional_id': instance.professionalId,
      'professional_name': instance.professionalName,
      'ticket_count': instance.ticketCount,
      'total_price': instance.totalPrice,
      'commission': instance.commission,
      'commission_rate': instance.commissionRate,
    };

_$DailyClosingResponseDtoImpl _$$DailyClosingResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyClosingResponseDtoImpl(
      date: json['date'] as String,
      branchId: (json['branch_id'] as num?)?.toInt(),
      branchName: json['branch_name'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  DailyClosingItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      grandTotal: (json['grand_total'] as num?)?.toDouble() ?? 0.0,
      grandCommission: (json['grand_commission'] as num?)?.toDouble() ?? 0.0,
      totalPaid: (json['total_paid'] as num?)?.toDouble() ?? 0.0,
      totalUnpaid: (json['total_unpaid'] as num?)?.toDouble() ?? 0.0,
      totalsByPayment: json['totals_by_payment'] == null
          ? const <String, double>{}
          : _parseDoubleMap(json['totals_by_payment']),
      summaryByProfessional: (json['summary_by_professional'] as List<dynamic>?)
              ?.map((e) =>
                  ProfessionalSummaryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DailyClosingResponseDtoImplToJson(
        _$DailyClosingResponseDtoImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
      'items': instance.items,
      'grand_total': instance.grandTotal,
      'grand_commission': instance.grandCommission,
      'total_paid': instance.totalPaid,
      'total_unpaid': instance.totalUnpaid,
      'totals_by_payment': _identityMap(instance.totalsByPayment),
      'summary_by_professional': instance.summaryByProfessional,
    };
