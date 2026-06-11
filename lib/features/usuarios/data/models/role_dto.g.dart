// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoleDtoImpl _$$RoleDtoImplFromJson(Map<String, dynamic> json) =>
    _$RoleDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      permissions: json['permissions'] == null
          ? const <String>[]
          : _permissionsFromJson(json['permissions'] as List),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$RoleDtoImplToJson(_$RoleDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'permissions': instance.permissions,
      'description': instance.description,
    };

_$RoleCreateDtoImpl _$$RoleCreateDtoImplFromJson(Map<String, dynamic> json) =>
    _$RoleCreateDtoImpl(
      name: json['name'] as String,
      permissions: (json['permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$RoleCreateDtoImplToJson(_$RoleCreateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'permissions': instance.permissions,
      'description': instance.description,
    };
