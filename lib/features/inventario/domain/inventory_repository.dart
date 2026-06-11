import '../data/models/inventory_dto.dart';
import 'entities/product.dart';

abstract class InventoryRepository {
  Future<List<InventoryCategory>> listCategories();
  Future<InventoryCategory> createCategory(InventoryCategoryCreateDto input);
  Future<void> deleteCategory(int id);

  Future<List<Product>> listProducts({int? categoryId, bool? activeOnly});
  Future<Product> createProduct(ProductCreateDto input);
  Future<Product> updateProduct(int id, ProductUpdateDto input);
  Future<void> deleteProduct(int id);

  Future<List<StockSummary>> getStockSummary({int? branchId});
}
