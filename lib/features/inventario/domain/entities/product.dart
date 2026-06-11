import '../../data/models/inventory_dto.dart';

class InventoryCategory {
  const InventoryCategory({
    required this.id,
    required this.name,
    this.description,
  });

  final int id;
  final String name;
  final String? description;

  factory InventoryCategory.fromDto(InventoryCategoryDto dto) =>
      InventoryCategory(id: dto.id, name: dto.name, description: dto.description);
}

class Product {
  const Product({
    required this.id,
    required this.sku,
    required this.name,
    required this.price,
    required this.cost,
    required this.isActive,
    this.categoryId,
    this.categoryName,
    this.minStock,
    this.imageUrl,
  });

  final int id;
  final String sku;
  final String name;
  final double price;
  final double cost;
  final bool isActive;
  final int? categoryId;
  final String? categoryName;
  final double? minStock;
  final String? imageUrl;

  factory Product.fromDto(ProductDto dto) => Product(
        id: dto.id,
        sku: dto.sku,
        name: dto.name,
        price: dto.price,
        cost: dto.cost,
        isActive: dto.status,
        categoryId: dto.categoryId,
        categoryName: dto.category?.name,
        minStock: dto.minStock,
        imageUrl: dto.imageUrl,
      );
}

class StockSummary {
  const StockSummary({
    required this.productId,
    required this.productName,
    required this.productSku,
    required this.branchId,
    required this.branchName,
    required this.totalStock,
    this.minStock,
  });

  final int productId;
  final String productName;
  final String productSku;
  final int branchId;
  final String branchName;
  final double totalStock;
  final double? minStock;

  bool get isLowStock => minStock != null && totalStock <= minStock!;

  factory StockSummary.fromDto(StockSummaryDto dto) => StockSummary(
        productId: dto.productId,
        productName: dto.productName,
        productSku: dto.productSku,
        branchId: dto.branchId,
        branchName: dto.branchName,
        totalStock: dto.totalStock,
      );
}
