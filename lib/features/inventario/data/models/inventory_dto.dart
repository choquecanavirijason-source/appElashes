import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_dto.freezed.dart';
part 'inventory_dto.g.dart';

// ─── Category ────────────────────────────────────────────────────────────────

@freezed
class InventoryCategoryDto with _$InventoryCategoryDto {
  const factory InventoryCategoryDto({
    required int id,
    required String name,
    String? description,
  }) = _InventoryCategoryDto;
  factory InventoryCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$InventoryCategoryDtoFromJson(json);
}

@freezed
class InventoryCategoryCreateDto with _$InventoryCategoryCreateDto {
  const factory InventoryCategoryCreateDto({
    required String name,
    String? description,
  }) = _InventoryCategoryCreateDto;
  factory InventoryCategoryCreateDto.fromJson(Map<String, dynamic> json) =>
      _$InventoryCategoryCreateDtoFromJson(json);
}

// ─── Product ─────────────────────────────────────────────────────────────────

@freezed
class ProductDto with _$ProductDto {
  const factory ProductDto({
    required int id,
    required String sku,
    required String name,
    @JsonKey(name: 'category_id') int? categoryId,
    @Default(0.0) double price,
    @Default(0.0) double cost,
    @Default(true) bool status,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'min_stock') double? minStock,
    InventoryCategoryDto? category,
  }) = _ProductDto;
  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}

@freezed
class ProductCreateDto with _$ProductCreateDto {
  const factory ProductCreateDto({
    required String sku,
    required String name,
    @JsonKey(name: 'category_id') int? categoryId,
    @Default(0.0) double price,
    @Default(0.0) double cost,
    @Default(true) bool status,
    @JsonKey(name: 'min_stock') double? minStock,
    @JsonKey(name: 'initial_stock') double? initialStock,
    @JsonKey(name: 'branch_id') int? branchId,
  }) = _ProductCreateDto;
  factory ProductCreateDto.fromJson(Map<String, dynamic> json) =>
      _$ProductCreateDtoFromJson(json);
}

@freezed
class ProductUpdateDto with _$ProductUpdateDto {
  const factory ProductUpdateDto({
    String? sku,
    String? name,
    @JsonKey(name: 'category_id') int? categoryId,
    double? price,
    double? cost,
    bool? status,
    @JsonKey(name: 'min_stock') double? minStock,
  }) = _ProductUpdateDto;
  factory ProductUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$ProductUpdateDtoFromJson(json);
}

// ─── Stock summary ───────────────────────────────────────────────────────────

@freezed
class StockSummaryDto with _$StockSummaryDto {
  const factory StockSummaryDto({
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_sku') required String productSku,
    @JsonKey(name: 'branch_id') required int branchId,
    @JsonKey(name: 'branch_name') required String branchName,
    @JsonKey(name: 'total_stock') @Default(0.0) double totalStock,
  }) = _StockSummaryDto;
  factory StockSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$StockSummaryDtoFromJson(json);
}
