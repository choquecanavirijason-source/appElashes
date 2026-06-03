import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/mock_clients.dart';
import '../../domain/entities/client.dart';

class ClientsNotifier extends Notifier<List<Client>> {
  @override
  List<Client> build() => List.unmodifiable(kMockClients);

  void add({
    required String nombre,
    required String apellido,
    required String telefono,
    required int edad,
    required String tipoOjo,
    String? email,
    String? notas,
  }) {
    final nextId = state.isEmpty
        ? 1
        : (state.map((c) => c.id).reduce((a, b) => a > b ? a : b) + 1);
    final newClient = Client(
      id: nextId,
      nombre: nombre.trim(),
      apellido: apellido.trim(),
      telefono: telefono.trim(),
      edad: edad,
      tipoOjo: tipoOjo,
      visitas: 0,
      email: email?.trim().isEmpty ?? true ? null : email!.trim(),
      notas: notas?.trim().isEmpty ?? true ? null : notas!.trim(),
    );
    state = [...state, newClient];
  }

  Client? byId(int id) {
    for (final c in state) {
      if (c.id == id) return c;
    }
    return null;
  }
}

final clientsProvider =
    NotifierProvider<ClientsNotifier, List<Client>>(ClientsNotifier.new);

final clientByIdProvider = Provider.family<Client?, int>((ref, id) {
  return ref.watch(clientsProvider.notifier).byId(id);
});
