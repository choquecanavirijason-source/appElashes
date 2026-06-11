// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommissionPaymentDtoImpl _$$CommissionPaymentDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionPaymentDtoImpl(
      id: (json['id'] as num).toInt(),
      professionalId: (json['professional_id'] as num).toInt(),
      professionalName: json['professional_name'] as String,
      amount: (json['amount'] as num).toDouble(),
      periodStart: json['period_start'] as String?,
      periodEnd: json['period_end'] as String?,
      notes: json['notes'] as String?,
      registeredAt: json['registered_at'] as String,
      registeredByName: json['registered_by_name'] as String?,
    );

Map<String, dynamic> _$$CommissionPaymentDtoImplToJson(
        _$CommissionPaymentDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'professional_id': instance.professionalId,
      'professional_name': instance.professionalName,
      'amount': instance.amount,
      'period_start': instance.periodStart,
      'period_end': instance.periodEnd,
      'notes': instance.notes,
      'registered_at': instance.registeredAt,
      'registered_by_name': instance.registeredByName,
    };

_$CommissionPaymentCreateDtoImpl _$$CommissionPaymentCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionPaymentCreateDtoImpl(
      professionalId: (json['professional_id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      periodStart: json['period_start'] as String?,
      periodEnd: json['period_end'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$CommissionPaymentCreateDtoImplToJson(
        _$CommissionPaymentCreateDtoImpl instance) =>
    <String, dynamic>{
      'professional_id': instance.professionalId,
      'amount': instance.amount,
      'period_start': instance.periodStart,
      'period_end': instance.periodEnd,
      'notes': instance.notes,
    };

_$ProfessionalOptionDtoImpl _$$ProfessionalOptionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfessionalOptionDtoImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$ProfessionalOptionDtoImplToJson(
        _$ProfessionalOptionDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
    };
