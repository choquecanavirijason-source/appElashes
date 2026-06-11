// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentClientDtoImpl _$$PaymentClientDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentClientDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      lastName: json['last_name'] as String?,
    );

Map<String, dynamic> _$$PaymentClientDtoImplToJson(
        _$PaymentClientDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.lastName,
    };

_$PaymentDtoImpl _$$PaymentDtoImplFromJson(Map<String, dynamic> json) =>
    _$PaymentDtoImpl(
      id: (json['id'] as num).toInt(),
      clientId: (json['client_id'] as num).toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      appointmentId: (json['appointment_id'] as num?)?.toInt(),
      saleId: (json['sale_id'] as num?)?.toInt(),
      registeredById: (json['registered_by_id'] as num?)?.toInt(),
      amount: (json['amount'] as num).toDouble(),
      method: json['method'] as String,
      status: json['status'] as String? ?? 'paid',
      reference: json['reference'] as String?,
      notes: json['notes'] as String?,
      paidAt: DateTime.parse(json['paid_at'] as String),
      client: PaymentClientDto.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentDtoImplToJson(_$PaymentDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_id': instance.clientId,
      'branch_id': instance.branchId,
      'appointment_id': instance.appointmentId,
      'sale_id': instance.saleId,
      'registered_by_id': instance.registeredById,
      'amount': instance.amount,
      'method': instance.method,
      'status': instance.status,
      'reference': instance.reference,
      'notes': instance.notes,
      'paid_at': instance.paidAt.toIso8601String(),
      'client': instance.client,
    };

_$PaymentCreateDtoImpl _$$PaymentCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentCreateDtoImpl(
      clientId: (json['client_id'] as num).toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      appointmentId: (json['appointment_id'] as num?)?.toInt(),
      saleId: (json['sale_id'] as num?)?.toInt(),
      amount: (json['amount'] as num).toDouble(),
      method: json['method'] as String? ?? 'cash',
      status: json['status'] as String? ?? 'paid',
      reference: json['reference'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$PaymentCreateDtoImplToJson(
        _$PaymentCreateDtoImpl instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'branch_id': instance.branchId,
      'appointment_id': instance.appointmentId,
      'sale_id': instance.saleId,
      'amount': instance.amount,
      'method': instance.method,
      'status': instance.status,
      'reference': instance.reference,
      'notes': instance.notes,
    };
