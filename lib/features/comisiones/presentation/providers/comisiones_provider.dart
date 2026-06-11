import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/commissions_repository_impl.dart';
import '../../data/models/commission_dto.dart';

class ComisionesNotifier
    extends AutoDisposeAsyncNotifier<List<CommissionPayment>> {
  @override
  Future<List<CommissionPayment>> build() =>
      ref.read(commissionsRepositoryProvider).list();

  Future<void> refresh() async => ref.invalidateSelf();

  Future<void> add(CommissionPaymentCreateDto dto) async {
    await ref.read(commissionsRepositoryProvider).create(dto);
    ref.invalidateSelf();
  }

  Future<void> remove(int id) async {
    await ref.read(commissionsRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

final comisionesProvider =
    AutoDisposeAsyncNotifierProvider<ComisionesNotifier, List<CommissionPayment>>(
  ComisionesNotifier.new,
);

final professionalsProvider =
    FutureProvider.autoDispose<List<ProfessionalOption>>((ref) {
  return ref.read(commissionsRepositoryProvider).getProfessionals();
});
