import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/sucursales/presentation/providers/sucursales_provider.dart';
import '../../data/payments_repository_impl.dart';

/// null = todos los métodos
final paymentMethodFilterProvider = StateProvider<String?>((ref) => null);

class PaymentsNotifier extends AutoDisposeAsyncNotifier<List<Payment>> {
  @override
  Future<List<Payment>> build() {
    final branchId = ref.watch(selectedBranchIdProvider);
    final method = ref.watch(paymentMethodFilterProvider);
    return ref.read(paymentsRepositoryProvider).list(
          branchId: branchId,
          method: method,
        );
  }

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
