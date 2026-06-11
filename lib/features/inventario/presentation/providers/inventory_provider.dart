import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/inventory_repository_impl.dart';
import '../../data/models/inventory_dto.dart';
import '../../domain/entities/product.dart';

// ─── Categories ──────────────────────────────────────────────────────────────

class CategoriesNotifier
    extends AutoDisposeAsyncNotifier<List<InventoryCategory>> {
  @override
  Future<List<InventoryCategory>> build() =>
      ref.read(inventoryRepositoryProvider).listCategories();

  Future<void> create(String name) async {
    await ref
        .read(inventoryRepositoryProvider)
        .createCategory(InventoryCategoryCreateDto(name: name));
    ref.invalidateSelf();
  }

  Future<void> remove(int id) async {
    await ref.read(inventoryRepositoryProvider).deleteCategory(id);
    ref.invalidateSelf();
  }
}

final inventoryCategoriesProvider =
    AutoDisposeAsyncNotifierProvider<CategoriesNotifier, List<InventoryCategory>>(
  CategoriesNotifier.new,
);

// ─── Products ─────────────────────────────────────────────────────────────────

class ProductsNotifier extends AutoDisposeAsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() =>
      ref.read(inventoryRepositoryProvider).listProducts();

  Future<void> create(ProductCreateDto input) async {
    await ref.read(inventoryRepositoryProvider).createProduct(input);
    ref.invalidateSelf();
  }

  Future<void> edit(int id, ProductUpdateDto input) async {
    await ref.read(inventoryRepositoryProvider).updateProduct(id, input);
    ref.invalidateSelf();
  }

  Future<void> remove(int id) async {
    await ref.read(inventoryRepositoryProvider).deleteProduct(id);
    ref.invalidateSelf();
  }
}

final productsProvider =
    AutoDisposeAsyncNotifierProvider<ProductsNotifier, List<Product>>(
  ProductsNotifier.new,
);

// ─── Stock summary ────────────────────────────────────────────────────────────

final stockSummaryProvider =
    FutureProvider.autoDispose<List<StockSummary>>((ref) {
  return ref.read(inventoryRepositoryProvider).getStockSummary();
});

final lowStockProvider = FutureProvider.autoDispose<List<StockSummary>>((ref) async {
  final all = await ref.watch(stockSummaryProvider.future);
  return all.where((s) => s.isLowStock).toList();
});
