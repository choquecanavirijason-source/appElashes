// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EyeTypeSummaryDtoImpl _$$EyeTypeSummaryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$EyeTypeSummaryDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$EyeTypeSummaryDtoImplToJson(
        _$EyeTypeSummaryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_$ClientDtoImpl _$$ClientDtoImplFromJson(Map<String, dynamic> json) =>
    _$ClientDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      lastName: json['last_name'] as String,
      age: (json['age'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      eyeTypeId: (json['eye_type_id'] as num?)?.toInt(),
      status: json['status'] as String? ?? 'sin_estado',
      lastActivityAt: json['last_activity_at'] == null
          ? null
          : DateTime.parse(json['last_activity_at'] as String),
      eyeType: json['eye_type'] == null
          ? null
          : EyeTypeSummaryDto.fromJson(
              json['eye_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClientDtoImplToJson(_$ClientDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.lastName,
      'age': instance.age,
      'phone': instance.phone,
      'email': instance.email,
      'branch_id': instance.branchId,
      'eye_type_id': instance.eyeTypeId,
      'status': instance.status,
      'last_activity_at': instance.lastActivityAt?.toIso8601String(),
      'eye_type': instance.eyeType,
    };

_$ClientCreateDtoImpl _$$ClientCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientCreateDtoImpl(
      name: json['name'] as String,
      lastName: json['last_name'] as String,
      age: (json['age'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      eyeTypeId: (json['eye_type_id'] as num?)?.toInt(),
      status: json['status'] as String? ?? 'en_espera',
    );

Map<String, dynamic> _$$ClientCreateDtoImplToJson(
        _$ClientCreateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'last_name': instance.lastName,
      'age': instance.age,
      'phone': instance.phone,
      'email': instance.email,
      'branch_id': instance.branchId,
      'eye_type_id': instance.eyeTypeId,
      'status': instance.status,
    };

_$ClientUpdateDtoImpl _$$ClientUpdateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientUpdateDtoImpl(
      name: json['name'] as String?,
      lastName: json['last_name'] as String?,
      age: (json['age'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      eyeTypeId: (json['eye_type_id'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$ClientUpdateDtoImplToJson(
        _$ClientUpdateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'last_name': instance.lastName,
      'age': instance.age,
      'phone': instance.phone,
      'email': instance.email,
      'branch_id': instance.branchId,
      'eye_type_id': instance.eyeTypeId,
      'status': instance.status,
    };
