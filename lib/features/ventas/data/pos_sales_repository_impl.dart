import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import 'models/pos_sale_dto.dart';
import 'pos_sales_api.dart';

class PosSale {
  const PosSale({
    required this.id,
    required this.saleCode,
    required this.clientId,
    required this.clientName,
    required this.subtotal,
    required this.discountValue,
    required this.total,
    required this.paymentMethod,
    required this.status,
    required this.createdAt,
    this.branchId,
    this.createdByUsername,
    this.notes,
  });

  final int id;
  final String saleCode;
  final int clientId;
  final String clientName;
  final double subtotal;
  final double discountValue;
  final double total;
  final String paymentMethod;
  final String status;
  final DateTime createdAt;
  final int? branchId;
  final String? createdByUsername;
  final String? notes;

  bool get isCancelled => status == 'cancelled';

  factory PosSale.fromDto(PosSaleDto dto) => PosSale(
        id: dto.id,
        saleCode: dto.saleCode,
        clientId: dto.clientId,
        clientName: '${dto.client.name}${dto.client.lastName != null ? ' ${dto.client.lastName}' : ''}',
        subtotal: dto.subtotal,
        discountValue: dto.discountValue,
        total: dto.total,
        paymentMethod: dto.paymentMethod,
        status: dto.status,
        createdAt: dto.createdAt,
        branchId: dto.branchId,
        createdByUsername: dto.createdBy?.username,
        notes: dto.notes,
      );
}

class PosSalesRepository {
  PosSalesRepository(this._api);

  final PosSalesApi _api;

  Future<List<PosSale>> list({int limit = 100}) async {
    final dtos = await _api.list(limit: limit);
    return dtos.map(PosSale.fromDto).toList();
  }

  Future<PosSale> create(PosSaleCreateDto input) async {
    final dto = await _api.create(input);
    return PosSale.fromDto(dto);
  }

  Future<PosSale> cancel(int id) async {
    final dto = await _api.cancel(id);
    return PosSale.fromDto(dto);
  }

  Future<void> delete(int id) => _api.delete(id);
}

final _posSalesApiProvider = Provider<PosSalesApi>(
  (ref) => PosSalesApi(ref.watch(dioProvider)),
);

final posSalesRepositoryProvider = Provider<PosSalesRepository>(
  (ref) => PosSalesRepository(ref.watch(_posSalesApiProvider)),
);
