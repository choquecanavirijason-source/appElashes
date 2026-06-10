import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/storage/prefs_storage.dart';
import '../../../../shared/data/mock_services.dart';
import '../../data/models/service_dto.dart';
import '../../data/services_repository_impl.dart';
import '../../domain/entities/service.dart';

class ServicesListNotifier extends AutoDisposeAsyncNotifier<List<Service>> {
  @override
  Future<List<Service>> build() async {
    final branchId = ref.watch(prefsStorageProvider).selectedBranchId;
    return ref.read(servicesRepositoryProvider).list(branchId: branchId);
  }

  Future<void> createService(ServiceCreateDto input) async {
    await ref.read(servicesRepositoryProvider).create(input);
    ref.invalidateSelf();
  }

  Future<void> editService(int id, ServiceUpdateDto input) async {
    await ref.read(servicesRepositoryProvider).update(id, input);
    ref.invalidateSelf();
  }

  Future<void> removeService(int id) async {
    await ref.read(servicesRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

final servicesListProvider =
    AutoDisposeAsyncNotifierProvider<ServicesListNotifier, List<Service>>(
  ServicesListNotifier.new,
);

// ── Proveedores legacy — usados por ventas hasta que migre al backend ──

class _MockServicesNotifier extends Notifier<List<Service>> {
  @override
  List<Service> build() => List.unmodifiable(kMockServices);

  Service? byId(int id) => state.where((s) => s.id == id).firstOrNull;
}

/// Proveedor sincrónico con datos mock. Usado por ventas hasta su migración.
final servicesProvider =
    NotifierProvider<_MockServicesNotifier, List<Service>>(
  _MockServicesNotifier.new,
);

/// Sólo servicios activos (todos en mock — backend no tiene campo activo).
final activeServicesProvider = Provider<List<Service>>((ref) {
  return ref.watch(servicesProvider);
});
