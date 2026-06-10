import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/storage/prefs_storage.dart';
import '../../../../shared/data/mock_clients.dart';
import '../../data/clients_repository_impl.dart';
import '../../data/models/client_dto.dart';
import '../../domain/entities/client.dart';

class ClientsListNotifier
    extends AutoDisposeAsyncNotifier<List<Client>> {
  @override
  Future<List<Client>> build() async {
    final branchId =
        ref.watch(prefsStorageProvider).selectedBranchId;
    return ref
        .read(clientsRepositoryProvider)
        .list(branchId: branchId);
  }

  Future<void> createClient(ClientCreateDto input) async {
    await ref.read(clientsRepositoryProvider).create(input);
    ref.invalidateSelf();
  }

  Future<void> editClient(int id, ClientUpdateDto input) async {
    await ref.read(clientsRepositoryProvider).update(id, input);
    ref.invalidateSelf();
  }

  Future<void> removeClient(int id) async {
    await ref.read(clientsRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

final clientsListProvider =
    AutoDisposeAsyncNotifierProvider<ClientsListNotifier, List<Client>>(
  ClientsListNotifier.new,
);

// ── Proveedores mock — se migran cuando cada feature conecte su propio backend ──

class _MockClientsNotifier extends Notifier<List<Client>> {
  @override
  List<Client> build() => List.unmodifiable(kMockClients);
}

/// Proveedor sincrónico con datos mock. Usado por features aún no migrados
/// al backend (citas, inicio, mensajes, ventas). Se eliminará al migrar cada uno.
final clientsProvider =
    NotifierProvider<_MockClientsNotifier, List<Client>>(
  _MockClientsNotifier.new,
);

final clientByIdProvider = Provider.family<Client?, int>((ref, id) {
  return ref.watch(clientsProvider).where((c) => c.id == id).firstOrNull;
});
