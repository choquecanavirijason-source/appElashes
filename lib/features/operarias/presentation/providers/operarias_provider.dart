import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/mock_operarias.dart';
import '../../domain/entities/operaria.dart';

class OperariasNotifier extends Notifier<List<Operaria>> {
  @override
  List<Operaria> build() => List.unmodifiable(kMockOperarias);

  void add({
    required String nombre,
    required String apellido,
    required String especialidad,
    required double calificacion,
    required bool activa,
    List<String> diasDisponibles = const [],
  }) {
    final nextId = state.isEmpty
        ? 1
        : (state.map((o) => o.id).reduce((a, b) => a > b ? a : b) + 1);
    final nueva = Operaria(
      id: nextId,
      nombre: nombre.trim(),
      apellido: apellido.trim(),
      especialidad: especialidad.trim(),
      calificacion: calificacion,
      activa: activa,
      diasDisponibles: diasDisponibles,
    );
    state = [...state, nueva];
  }

  void toggleActiva(int id) {
    state = [
      for (final o in state)
        if (o.id == id) o.copyWith(activa: !o.activa) else o,
    ];
  }

  Operaria? byId(int id) {
    for (final o in state) {
      if (o.id == id) return o;
    }
    return null;
  }
}

final operariasProvider =
    NotifierProvider<OperariasNotifier, List<Operaria>>(OperariasNotifier.new);

final operariaByIdProvider = Provider.family<Operaria?, int>((ref, id) {
  return ref.watch(operariasProvider.notifier).byId(id);
});
