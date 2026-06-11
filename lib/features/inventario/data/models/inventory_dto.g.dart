// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryCategoryDtoImpl _$$InventoryCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryCategoryDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$InventoryCategoryDtoImplToJson(
        _$InventoryCategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_$InventoryCategoryCreateDtoImpl _$$InventoryCategoryCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryCategoryCreateDtoImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$InventoryCategoryCreateDtoImplToJson(
        _$InventoryCategoryCreateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

_$ProductDtoImpl _$$ProductDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProductDtoImpl(
      id: (json['id'] as num).toInt(),
      sku: json['sku'] as String,
      name: json['name'] as String,
      categoryId: (json['category_id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as bool? ?? true,
      imageUrl: json['image_url'] as String?,
      minStock: (json['min_stock'] as num?)?.toDouble(),
      category: json['category'] == null
          ? null
          : InventoryCategoryDto.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductDtoImplToJson(_$ProductDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'category_id': instance.categoryId,
      'price': instance.price,
      'cost': instance.cost,
      'status': instance.status,
      'image_url': instance.imageUrl,
      'min_stock': instance.minStock,
      'category': instance.category,
    };

_$ProductCreateDtoImpl _$$ProductCreateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCreateDtoImpl(
      sku: json['sku'] as String,
      name: json['name'] as String,
      categoryId: (json['category_id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as bool? ?? true,
      minStock: (json['min_stock'] as num?)?.toDouble(),
      initialStock: (json['initial_stock'] as num?)?.toDouble(),
      branchId: (json['branch_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductCreateDtoImplToJson(
        _$ProductCreateDtoImpl instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'name': instance.name,
      'category_id': instance.categoryId,
      'price': instance.price,
      'cost': instance.cost,
      'status': instance.status,
      'min_stock': instance.minStock,
      'initial_stock': instance.initialStock,
      'branch_id': instance.branchId,
    };

_$ProductUpdateDtoImpl _$$ProductUpdateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductUpdateDtoImpl(
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      cost: (json['cost'] as num?)?.toDouble(),
      status: json['status'] as bool?,
      minStock: (json['min_stock'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ProductUpdateDtoImplToJson(
        _$ProductUpdateDtoImpl instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'name': instance.name,
      'category_id': instance.categoryId,
      'price': instance.price,
      'cost': instance.cost,
      'status': instance.status,
      'min_stock': instance.minStock,
    };

_$StockSummaryDtoImpl _$$StockSummaryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$StockSummaryDtoImpl(
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      productSku: json['product_sku'] as String,
      branchId: (json['branch_id'] as num).toInt(),
      branchName: json['branch_name'] as String,
      totalStock: (json['total_stock'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$StockSummaryDtoImplToJson(
        _$StockSummaryDtoImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_sku': instance.productSku,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
      'total_stock': instance.totalStock,
    };
