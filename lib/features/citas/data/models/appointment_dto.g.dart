// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientSummaryDtoImpl _$$ClientSummaryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientSummaryDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      lastName: json['last_name'] as String?,
      age: (json['age'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$ClientSummaryDtoImplToJson(
        _$ClientSummaryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.lastName,
      'age': instance.age,
      'phone': instance.phone,
      'email': instance.email,
    };

_$UserSummaryDtoImpl _$$UserSummaryDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserSummaryDtoImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserSummaryDtoImplToJson(
        _$UserSummaryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'is_active': instance.isActive,
    };

_$AppointmentServiceDtoImpl _$$AppointmentServiceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentServiceDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$AppointmentServiceDtoImplToJson(
        _$AppointmentServiceDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration_minutes': instance.durationMinutes,
      'price': instance.price,
      'description': instance.description,
    };

_$AppointmentDtoImpl _$$AppointmentDtoImplFromJson(Map<String, dynamic> json) =>
    _$AppointmentDtoImpl(
      id: (json['id'] as num).toInt(),
      ticketCode: json['ticket_code'] as String?,
      clientId: (json['client_id'] as num).toInt(),
      createdById: (json['created_by_id'] as num?)?.toInt(),
      professionalId: (json['professional_id'] as num?)?.toInt(),
      serviceId: (json['service_id'] as num?)?.toInt(),
      serviceIds: (json['service_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      saleId: (json['sale_id'] as num?)?.toInt(),
      isIa: json['is_ia'] as bool? ?? false,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      status: json['status'] as String? ?? 'pending',
      advancePaymentAmount:
          (json['advance_payment_amount'] as num?)?.toDouble() ?? 0.0,
      client: ClientSummaryDto.fromJson(json['client'] as Map<String, dynamic>),
      createdBy: json['created_by'] == null
          ? null
          : UserSummaryDto.fromJson(json['created_by'] as Map<String, dynamic>),
      professional: json['professional'] == null
          ? null
          : UserSummaryDto.fromJson(
              json['professional'] as Map<String, dynamic>),
      service: json['service'] == null
          ? null
          : AppointmentServiceDto.fromJson(
              json['service'] as Map<String, dynamic>),
      services: (json['services'] as List<dynamic>?)
          ?.map(
              (e) => AppointmentServiceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AppointmentDtoImplToJson(
        _$AppointmentDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_code': instance.ticketCode,
      'client_id': instance.clientId,
      'created_by_id': instance.createdById,
      'professional_id': instance.professionalId,
      'service_id': instance.serviceId,
      'service_ids': instance.serviceIds,
      'branch_id': instance.branchId,
      'sale_id': instance.saleId,
      'is_ia': instance.isIa,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'status': instance.status,
      'advance_payment_amount': instance.advancePaymentAmount,
      'client': instance.client,
      'created_by': instance.createdBy,
      'professional': instance.professional,
      'service': instance.service,
      'services': instance.services,
    };

_$AppointmentCreateDtoImpl _$$AppointmentCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentCreateDtoImpl(
      clientId: (json['client_id'] as num).toInt(),
      professionalId: (json['professional_id'] as num?)?.toInt(),
      serviceId: (json['service_id'] as num?)?.toInt(),
      serviceIds: (json['service_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      isIa: json['is_ia'] as bool? ?? false,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      status: json['status'] as String? ?? 'pending',
      advancePaymentAmount:
          (json['advance_payment_amount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$AppointmentCreateDtoImplToJson(
        _$AppointmentCreateDtoImpl instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'professional_id': instance.professionalId,
      'service_id': instance.serviceId,
      'service_ids': instance.serviceIds,
      'branch_id': instance.branchId,
      'is_ia': instance.isIa,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'status': instance.status,
      'advance_payment_amount': instance.advancePaymentAmount,
    };

_$AppointmentUpdateDtoImpl _$$AppointmentUpdateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentUpdateDtoImpl(
      clientId: (json['client_id'] as num?)?.toInt(),
      professionalId: (json['professional_id'] as num?)?.toInt(),
      serviceId: (json['service_id'] as num?)?.toInt(),
      serviceIds: (json['service_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      isIa: json['is_ia'] as bool?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      status: json['status'] as String?,
      skipAvailabilityCheck: json['skip_availability_check'] as bool? ?? false,
    );

Map<String, dynamic> _$$AppointmentUpdateDtoImplToJson(
        _$AppointmentUpdateDtoImpl instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'professional_id': instance.professionalId,
      'service_id': instance.serviceId,
      'service_ids': instance.serviceIds,
      'branch_id': instance.branchId,
      'is_ia': instance.isIa,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'status': instance.status,
      'skip_availability_check': instance.skipAvailabilityCheck,
    };
