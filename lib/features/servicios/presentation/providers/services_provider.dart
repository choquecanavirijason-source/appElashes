import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/mock_services.dart';
import '../../domain/entities/service.dart';

class ServicesNotifier extends Notifier<List<Service>> {
  @override
  List<Service> build() => List.unmodifiable(kMockServices);

  void add({
    required String nombre,
    required String categoria,
    required double precio,
    required int duracionMinutos,
    String? descripcion,
    bool activo = true,
  }) {
    final nextId = state.isEmpty
        ? 1
        : (state.map((s) => s.id).reduce((a, b) => a > b ? a : b) + 1);
    final nuevo = Service(
      id: nextId,
      nombre: nombre.trim(),
      categoria: categoria,
      precio: precio,
      duracionMinutos: duracionMinutos,
      activo: activo,
      descripcion: descripcion?.trim().isEmpty ?? true
          ? null
          : descripcion!.trim(),
    );
    state = [...state, nuevo];
  }

  void toggleActivo(int id) {
    state = [
      for (final s in state)
        if (s.id == id) s.copyWith(activo: !s.activo) else s,
    ];
  }

  Service? byId(int id) {
    for (final s in state) {
      if (s.id == id) return s;
    }
    return null;
  }
}

final servicesProvider =
    NotifierProvider<ServicesNotifier, List<Service>>(ServicesNotifier.new);

/// Sólo servicios activos (para usar en formulario de ventas).
final activeServicesProvider = Provider<List<Service>>((ref) {
  return ref.watch(servicesProvider).where((s) => s.activo).toList();
});
