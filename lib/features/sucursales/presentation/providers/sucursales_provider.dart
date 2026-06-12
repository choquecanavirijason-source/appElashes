import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/storage/prefs_storage.dart';
import '../../../../shared/data/mock_sucursales.dart';
import '../../data/models/branch_dto.dart';
import '../../data/sucursales_repository_impl.dart';
import '../../domain/entities/sucursal.dart';

/// ID de la sucursal actualmente seleccionada (null = todas).
/// Inicializado desde SharedPreferences al arrancar.
final selectedBranchIdProvider = StateProvider<int?>((ref) {
  return ref.read(prefsStorageProvider).selectedBranchId;
});

// ── Real backend provider ────────────────────────────────────────────────────

class SucursalesListNotifier
    extends AutoDisposeAsyncNotifier<List<Sucursal>> {
  @override
  Future<List<Sucursal>> build() async {
    return ref.read(sucursalesRepositoryProvider).list();
  }

  Future<void> createSucursal(BranchCreateDto input) async {
    await ref.read(sucursalesRepositoryProvider).create(input);
    ref.invalidateSelf();
    await future;
  }

  Future<void> editSucursal(int id, BranchUpdateDto input) async {
    await ref.read(sucursalesRepositoryProvider).update(id, input);
    ref.invalidateSelf();
    await future;
  }

  Future<void> toggleActiva(int id, {required bool activa}) async {
    await ref.read(sucursalesRepositoryProvider).update(
          id,
          BranchUpdateDto(isActive: activa),
        );
    ref.invalidateSelf();
    await future;
  }

  Future<void> removeSucursal(int id) async {
    await ref.read(sucursalesRepositoryProvider).delete(id);
    ref.invalidateSelf();
    await future;
  }
}

final sucursalesListProvider =
    AutoDisposeAsyncNotifierProvider<SucursalesListNotifier, List<Sucursal>>(
  SucursalesListNotifier.new,
);

// ── Legacy mock provider (compatibilidad con código no migrado) ──────────────

class _MockSucursalesNotifier extends Notifier<List<Sucursal>> {
  @override
  List<Sucursal> build() => List.unmodifiable(kMockSucursales);

  Sucursal? byId(int id) {
    for (final s in state) {
      if (s.id == id) return s;
    }
    return null;
  }
}

final sucursalesProvider =
    NotifierProvider<_MockSucursalesNotifier, List<Sucursal>>(
  _MockSucursalesNotifier.new,
);

final sucursalByIdProvider = Provider.family<Sucursal?, int>(
  (ref, id) => ref.watch(sucursalesProvider.notifier).byId(id),
);
