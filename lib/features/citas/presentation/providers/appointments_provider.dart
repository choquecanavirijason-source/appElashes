import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/storage/prefs_storage.dart';
import '../../data/citas_repository_impl.dart';
import '../../data/models/appointment_dto.dart';
import '../../domain/entities/appointment.dart';

class AppointmentsListNotifier
    extends AutoDisposeAsyncNotifier<List<Appointment>> {
  @override
  Future<List<Appointment>> build() async {
    final branchId = ref.watch(prefsStorageProvider).selectedBranchId;
    return ref.read(citasRepositoryProvider).list(branchId: branchId);
  }

  Future<void> createAppointment(AppointmentCreateDto input) async {
    await ref.read(citasRepositoryProvider).create(input);
    ref.invalidateSelf();
  }

  Future<void> editAppointment(int id, AppointmentUpdateDto input) async {
    await ref.read(citasRepositoryProvider).update(id, input);
    ref.invalidateSelf();
  }

  Future<void> removeAppointment(int id) async {
    await ref.read(citasRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

final appointmentsListProvider = AutoDisposeAsyncNotifierProvider<
    AppointmentsListNotifier, List<Appointment>>(
  AppointmentsListNotifier.new,
);

// ── Proveedores legacy — se eliminan cuando operarias se migre al backend ──

/// Citas de hoy (derivado del provider real, solo disponible cuando data está cargada).
final citasHoyProvider = Provider<List<Appointment>>((ref) {
  final all = ref.watch(appointmentsListProvider).valueOrNull ?? [];
  return all.where((c) => c.esHoy).toList();
});

/// Próximas citas futuras (incluyendo hoy).
final proximasCitasProvider = Provider<List<Appointment>>((ref) {
  final all = ref.watch(appointmentsListProvider).valueOrNull ?? [];
  final now = DateTime.now();
  return all.where((c) => c.startTime.isAfter(now)).toList();
});
