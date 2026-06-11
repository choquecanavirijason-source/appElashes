import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'models/inventory_dto.dart';

class InventoryApi {
  InventoryApi(this._dio);

  final Dio _dio;

  // ─── Categories ──────────────────────────────────────────────────────────

  Future<List<InventoryCategoryDto>> listCategories() async {
    final response = await _dio.get<List<dynamic>>(ApiEndpoints.inventoryCategories);
    return response.data!
        .map((e) => InventoryCategoryDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<InventoryCategoryDto> createCategory(InventoryCategoryCreateDto input) async {
    final body = input.toJson()..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.inventoryCategories,
      data: body,
    );
    return InventoryCategoryDto.fromJson(response.data!);
  }

  Future<void> deleteCategory(int id) async {
    await _dio.delete<void>('${ApiEndpoints.inventoryCategories}/$id');
  }

  // ─── Products ─────────────────────────────────────────────────────────────

  Future<List<ProductDto>> listProducts({
    int? categoryId,
    bool? activeOnly,
    int limit = 300,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.inventoryProducts,
      queryParameters: {
        'limit': limit,
        if (categoryId != null) 'category_id': categoryId,
        if (activeOnly != null) 'active_only': activeOnly,
      },
    );
    return response.data!
        .map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<ProductDto> createProduct(ProductCreateDto input) async {
    final body = input.toJson()..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.inventoryProducts,
      data: body,
    );
    return ProductDto.fromJson(response.data!);
  }

  Future<ProductDto> updateProduct(int id, ProductUpdateDto input) async {
    final body = input.toJson()..removeWhere((String _, dynamic v) => v == null);
    final response = await _dio.put<Map<String, dynamic>>(
      '${ApiEndpoints.inventoryProducts}/$id',
      data: body,
    );
    return ProductDto.fromJson(response.data!);
  }

  Future<void> deleteProduct(int id) async {
    await _dio.delete<void>('${ApiEndpoints.inventoryProducts}/$id');
  }

  // ─── Stock summary ────────────────────────────────────────────────────────

  Future<List<StockSummaryDto>> getStockSummary({int? branchId}) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.inventoryStockSummary,
      queryParameters: {
        if (branchId != null) 'branch_id': branchId,
      },
    );
    return response.data!
        .map((e) => StockSummaryDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
