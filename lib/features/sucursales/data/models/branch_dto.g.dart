// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchTimeRangeDtoImpl _$$BranchTimeRangeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BranchTimeRangeDtoImpl(
      openTime: json['open_time'] as String,
      closeTime: json['close_time'] as String,
    );

Map<String, dynamic> _$$BranchTimeRangeDtoImplToJson(
        _$BranchTimeRangeDtoImpl instance) =>
    <String, dynamic>{
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
    };

_$BranchDayScheduleDtoImpl _$$BranchDayScheduleDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BranchDayScheduleDtoImpl(
      day: json['day'] as String,
      ranges: (json['ranges'] as List<dynamic>?)
              ?.map(
                  (e) => BranchTimeRangeDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BranchDayScheduleDtoImplToJson(
        _$BranchDayScheduleDtoImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'ranges': instance.ranges,
    };

_$BranchDtoImpl _$$BranchDtoImplFromJson(Map<String, dynamic> json) =>
    _$BranchDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String?,
      city: json['city'] as String?,
      department: json['department'] as String?,
      openingHours: (json['opening_hours'] as List<dynamic>?)
              ?.map((e) =>
                  BranchDayScheduleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userIds: (json['user_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BranchDtoImplToJson(_$BranchDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'department': instance.department,
      'opening_hours': instance.openingHours,
      'user_ids': instance.userIds,
    };

_$BranchCreateDtoImpl _$$BranchCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BranchCreateDtoImpl(
      name: json['name'] as String,
      address: json['address'] as String?,
      city: json['city'] as String?,
      department: json['department'] as String?,
      openingHours: (json['opening_hours'] as List<dynamic>?)
              ?.map((e) =>
                  BranchDayScheduleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userIds: (json['user_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BranchCreateDtoImplToJson(
        _$BranchCreateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'department': instance.department,
      'opening_hours': instance.openingHours,
      'user_ids': instance.userIds,
    };

_$BranchUpdateDtoImpl _$$BranchUpdateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BranchUpdateDtoImpl(
      name: json['name'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      department: json['department'] as String?,
      openingHours: (json['opening_hours'] as List<dynamic>?)
          ?.map((e) => BranchDayScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      userIds: (json['user_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$BranchUpdateDtoImplToJson(
        _$BranchUpdateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'department': instance.department,
      'opening_hours': instance.openingHours,
      'user_ids': instance.userIds,
    };
