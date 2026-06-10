// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceCategoryDtoImpl _$$ServiceCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceCategoryDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      isMobile: json['is_mobile'] as bool? ?? false,
    );

Map<String, dynamic> _$$ServiceCategoryDtoImplToJson(
        _$ServiceCategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'is_mobile': instance.isMobile,
    };

_$ServiceDtoImpl _$$ServiceDtoImplFromJson(Map<String, dynamic> json) =>
    _$ServiceDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      commissionRate: (json['commission_rate'] as num?)?.toDouble(),
      branchIds: (json['branch_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      category: json['category'] == null
          ? null
          : ServiceCategoryDto.fromJson(
              json['category'] as Map<String, dynamic>),
      ticketCount: (json['ticket_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ServiceDtoImplToJson(_$ServiceDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'category_id': instance.categoryId,
      'duration_minutes': instance.durationMinutes,
      'price': instance.price,
      'commission_rate': instance.commissionRate,
      'branch_ids': instance.branchIds,
      'category': instance.category,
      'ticket_count': instance.ticketCount,
    };

_$ServiceCreateDtoImpl _$$ServiceCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceCreateDtoImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      commissionRate: (json['commission_rate'] as num?)?.toDouble(),
      branchIds: (json['branch_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$ServiceCreateDtoImplToJson(
        _$ServiceCreateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'category_id': instance.categoryId,
      'duration_minutes': instance.durationMinutes,
      'price': instance.price,
      'commission_rate': instance.commissionRate,
      'branch_ids': instance.branchIds,
    };

_$ServiceUpdateDtoImpl _$$ServiceUpdateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceUpdateDtoImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      commissionRate: (json['commission_rate'] as num?)?.toDouble(),
      branchIds: (json['branch_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$ServiceUpdateDtoImplToJson(
        _$ServiceUpdateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'category_id': instance.categoryId,
      'duration_minutes': instance.durationMinutes,
      'price': instance.price,
      'commission_rate': instance.commissionRate,
      'branch_ids': instance.branchIds,
    };
