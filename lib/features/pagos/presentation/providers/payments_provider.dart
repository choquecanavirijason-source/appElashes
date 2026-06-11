import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/payments_repository_impl.dart';

class PaymentsNotifier extends AutoDisposeAsyncNotifier<List<Payment>> {
  @override
  Future<List<Payment>> build() =>
      ref.read(paymentsRepositoryProvider).list();

  Future<void> refresh() async => ref.invalidateSelf();

  Future<void> remove(int id) async {
    await ref.read(paymentsRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

final paymentsProvider =
    AutoDisposeAsyncNotifierProvider<PaymentsNotifier, List<Payment>>(
  PaymentsNotifier.new,
);
