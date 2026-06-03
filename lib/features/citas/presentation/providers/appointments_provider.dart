import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/mock_appointments.dart';
import '../../../../shared/enums/appointment_status.dart';
import '../../domain/entities/appointment.dart';

class AppointmentsNotifier extends Notifier<List<Appointment>> {
  @override
  List<Appointment> build() {
    final initial = buildMockAppointments()
      ..sort((a, b) => a.fechaHora.compareTo(b.fechaHora));
    return initial;
  }

  void add({
    required int clienteId,
    required int operariaId,
    required String servicio,
    required DateTime fechaHora,
    required int duracionMinutos,
    required double precio,
    String? notas,
  }) {
    final nextId = state.isEmpty
        ? 1
        : (state.map((a) => a.id).reduce((a, b) => a > b ? a : b) + 1);
    final cita = Appointment(
      id: nextId,
      clienteId: clienteId,
      operariaId: operariaId,
      servicio: servicio.trim(),
      fechaHora: fechaHora,
      duracionMinutos: duracionMinutos,
      precio: precio,
      estado: AppointmentStatus.reserva,
      notas: notas?.trim().isEmpty ?? true ? null : notas!.trim(),
    );
    state = [...state, cita]
      ..sort((a, b) => a.fechaHora.compareTo(b.fechaHora));
  }

  void cambiarEstado(int id, AppointmentStatus nuevoEstado) {
    state = [
      for (final a in state)
        if (a.id == id) a.copyWith(estado: nuevoEstado) else a,
    ];
  }
}

final appointmentsProvider =
    NotifierProvider<AppointmentsNotifier, List<Appointment>>(
  AppointmentsNotifier.new,
);

/// Citas de hoy ordenadas por hora.
final citasHoyProvider = Provider<List<Appointment>>((ref) {
  final all = ref.watch(appointmentsProvider);
  return all.where((c) => c.esHoy).toList();
});

/// Próximas citas (futuras incluyendo hoy).
final proximasCitasProvider = Provider<List<Appointment>>((ref) {
  final all = ref.watch(appointmentsProvider);
  final now = DateTime.now();
  return all.where((c) => c.fechaHora.isAfter(now)).toList();
});
