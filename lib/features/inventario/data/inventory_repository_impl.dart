import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../domain/entities/product.dart';
import '../domain/inventory_repository.dart';
import 'inventory_api.dart';
import 'models/inventory_dto.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  InventoryRepositoryImpl(this._api);

  final InventoryApi _api;

  @override
  Future<List<InventoryCategory>> listCategories() async {
    final dtos = await _api.listCategories();
    return dtos.map(InventoryCategory.fromDto).toList();
  }

  @override
  Future<InventoryCategory> createCategory(InventoryCategoryCreateDto input) async {
    final dto = await _api.createCategory(input);
    return InventoryCategory.fromDto(dto);
  }

  @override
  Future<void> deleteCategory(int id) => _api.deleteCategory(id);

  @override
  Future<List<Product>> listProducts({int? categoryId, bool? activeOnly}) async {
    final dtos = await _api.listProducts(categoryId: categoryId, activeOnly: activeOnly);
    return dtos.map(Product.fromDto).toList();
  }

  @override
  Future<Product> createProduct(ProductCreateDto input) async {
    final dto = await _api.createProduct(input);
    return Product.fromDto(dto);
  }

  @override
  Future<Product> updateProduct(int id, ProductUpdateDto input) async {
    final dto = await _api.updateProduct(id, input);
    return Product.fromDto(dto);
  }

  @override
  Future<void> deleteProduct(int id) => _api.deleteProduct(id);

  @override
  Future<List<StockSummary>> getStockSummary({int? branchId}) async {
    final dtos = await _api.getStockSummary(branchId: branchId);
    return dtos.map(StockSummary.fromDto).toList();
  }
}

final _inventoryApiProvider = Provider<InventoryApi>(
  (ref) => InventoryApi(ref.watch(dioProvider)),
);

final inventoryRepositoryProvider = Provider<InventoryRepository>(
  (ref) => InventoryRepositoryImpl(ref.watch(_inventoryApiProvider)),
);
