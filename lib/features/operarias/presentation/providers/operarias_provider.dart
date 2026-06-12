import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/mock_operarias.dart';
import '../../data/models/operaria_dto.dart';
import '../../data/operarias_repository_impl.dart';
import '../../domain/entities/operaria.dart';

// ── Real backend provider ────────────────────────────────────────────────────

class OperariasListNotifier
    extends AutoDisposeAsyncNotifier<List<Operaria>> {
  @override
  Future<List<Operaria>> build() async {
    return ref.read(operariasRepositoryProvider).list();
  }

  Future<void> createOperaria(OperariaCreateDto input) async {
    await ref.read(operariasRepositoryProvider).create(input);
    ref.invalidateSelf();
    await future;
  }

  Future<void> editOperaria(int id, OperariaUpdateDto input) async {
    await ref.read(operariasRepositoryProvider).update(id, input);
    ref.invalidateSelf();
    await future;
  }

  Future<void> toggleActiva(int id, {required bool activa}) async {
    await ref.read(operariasRepositoryProvider).update(
          id,
          OperariaUpdateDto(isActive: activa),
        );
    ref.invalidateSelf();
    await future;
  }

  Future<void> removeOperaria(int id) async {
    await ref.read(operariasRepositoryProvider).delete(id);
    ref.invalidateSelf();
    await future;
  }
}

final operariasListProvider =
    AutoDisposeAsyncNotifierProvider<OperariasListNotifier, List<Operaria>>(
  OperariasListNotifier.new,
);

// ── Legacy mock providers (used by features not yet migrated) ────────────────

class _MockOperariasNotifier extends Notifier<List<Operaria>> {
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
    NotifierProvider<_MockOperariasNotifier, List<Operaria>>(
  _MockOperariasNotifier.new,
);

final operariaByIdProvider = Provider.family<Operaria?, int>(
  (ref, id) => ref.watch(operariasProvider.notifier).byId(id),
);
