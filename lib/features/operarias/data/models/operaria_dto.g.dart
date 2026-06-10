// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operaria_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OperariaRoleSummaryDtoImpl _$$OperariaRoleSummaryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OperariaRoleSummaryDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$OperariaRoleSummaryDtoImplToJson(
        _$OperariaRoleSummaryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$OperariaBranchSummaryDtoImpl _$$OperariaBranchSummaryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OperariaBranchSummaryDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$OperariaBranchSummaryDtoImplToJson(
        _$OperariaBranchSummaryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$OperariaDtoImpl _$$OperariaDtoImplFromJson(Map<String, dynamic> json) =>
    _$OperariaDtoImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      roleId: (json['role_id'] as num?)?.toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      skillLevel: (json['skill_level'] as num?)?.toInt(),
      role: json['role'] == null
          ? null
          : OperariaRoleSummaryDto.fromJson(
              json['role'] as Map<String, dynamic>),
      branch: json['branch'] == null
          ? null
          : OperariaBranchSummaryDto.fromJson(
              json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OperariaDtoImplToJson(_$OperariaDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'role_id': instance.roleId,
      'branch_id': instance.branchId,
      'skill_level': instance.skillLevel,
      'role': instance.role,
      'branch': instance.branch,
    };

_$OperariaCreateDtoImpl _$$OperariaCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OperariaCreateDtoImpl(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      roleId: (json['role_id'] as num?)?.toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OperariaCreateDtoImplToJson(
        _$OperariaCreateDtoImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'is_active': instance.isActive,
      'role_id': instance.roleId,
      'branch_id': instance.branchId,
    };

_$OperariaUpdateDtoImpl _$$OperariaUpdateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OperariaUpdateDtoImpl(
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as bool?,
      roleId: (json['role_id'] as num?)?.toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      skillLevel: (json['skill_level'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OperariaUpdateDtoImplToJson(
        _$OperariaUpdateDtoImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'is_active': instance.isActive,
      'role_id': instance.roleId,
      'branch_id': instance.branchId,
      'skill_level': instance.skillLevel,
    };
