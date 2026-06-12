// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_sale_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosSaleClientDtoImpl _$$PosSaleClientDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PosSaleClientDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      lastName: json['last_name'] as String?,
    );

Map<String, dynamic> _$$PosSaleClientDtoImplToJson(
        _$PosSaleClientDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.lastName,
    };

_$PosSaleCreatedByDtoImpl _$$PosSaleCreatedByDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PosSaleCreatedByDtoImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
    );

Map<String, dynamic> _$$PosSaleCreatedByDtoImplToJson(
        _$PosSaleCreatedByDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
    };

_$PosSaleDtoImpl _$$PosSaleDtoImplFromJson(Map<String, dynamic> json) =>
    _$PosSaleDtoImpl(
      id: (json['id'] as num).toInt(),
      saleCode: json['sale_code'] as String,
      clientId: (json['client_id'] as num).toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      createdById: (json['created_by_id'] as num?)?.toInt(),
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0.0,
      discountType: json['discount_type'] as String? ?? 'amount',
      discountValue: (json['discount_value'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      paymentMethod: json['payment_method'] as String? ?? 'cash',
      status: json['status'] as String? ?? 'paid',
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      client: PosSaleClientDto.fromJson(json['client'] as Map<String, dynamic>),
      createdBy: json['created_by'] == null
          ? null
          : PosSaleCreatedByDto.fromJson(
              json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PosSaleDtoImplToJson(_$PosSaleDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sale_code': instance.saleCode,
      'client_id': instance.clientId,
      'branch_id': instance.branchId,
      'created_by_id': instance.createdById,
      'subtotal': instance.subtotal,
      'discount_type': instance.discountType,
      'discount_value': instance.discountValue,
      'total': instance.total,
      'payment_method': instance.paymentMethod,
      'status': instance.status,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
      'client': instance.client,
      'created_by': instance.createdBy,
    };

_$PosSaleItemCreateDtoImpl _$$PosSaleItemCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PosSaleItemCreateDtoImpl(
      serviceId: (json['service_id'] as num).toInt(),
      professionalId: (json['professional_id'] as num?)?.toInt(),
      isIa: json['is_ia'] as bool? ?? false,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      branchId: (json['branch_id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PosSaleItemCreateDtoImplToJson(
        _$PosSaleItemCreateDtoImpl instance) =>
    <String, dynamic>{
      'service_id': instance.serviceId,
      'professional_id': instance.professionalId,
      'is_ia': instance.isIa,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'branch_id': instance.branchId,
      'price': instance.price,
      'quantity': instance.quantity,
    };

_$PosSaleCreateDtoImpl _$$PosSaleCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PosSaleCreateDtoImpl(
      clientId: (json['client_id'] as num).toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      paymentMethod: json['payment_method'] as String? ?? 'cash',
      discountType: json['discount_type'] as String? ?? 'amount',
      discountValue: (json['discount_value'] as num?)?.toDouble() ?? 0.0,
      notes: json['notes'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => PosSaleItemCreateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      linkAppointmentId: (json['link_appointment_id'] as num?)?.toInt(),
      saleWithoutAppointments:
          json['sale_without_appointments'] as bool? ?? false,
    );

Map<String, dynamic> _$$PosSaleCreateDtoImplToJson(
        _$PosSaleCreateDtoImpl instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'branch_id': instance.branchId,
      'payment_method': instance.paymentMethod,
      'discount_type': instance.discountType,
      'discount_value': instance.discountValue,
      'notes': instance.notes,
      'items': instance.items,
      'link_appointment_id': instance.linkAppointmentId,
      'sale_without_appointments': instance.saleWithoutAppointments,
    };
