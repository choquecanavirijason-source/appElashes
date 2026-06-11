import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/pos_sales_repository_impl.dart';

class PosSalesNotifier extends AutoDisposeAsyncNotifier<List<PosSale>> {
  @override
  Future<List<PosSale>> build() =>
      ref.read(posSalesRepositoryProvider).list(limit: 200);

  Future<void> refresh() async => ref.invalidateSelf();

  Future<void> cancelSale(int id) async {
    await ref.read(posSalesRepositoryProvider).cancel(id);
    ref.invalidateSelf();
  }

  Future<void> removeSale(int id) async {
    await ref.read(posSalesRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

final posSalesProvider =
    AutoDisposeAsyncNotifierProvider<PosSalesNotifier, List<PosSale>>(
  PosSalesNotifier.new,
);
