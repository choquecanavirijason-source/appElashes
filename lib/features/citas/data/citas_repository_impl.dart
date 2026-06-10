import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../domain/citas_repository.dart';
import '../domain/entities/appointment.dart';
import 'citas_api.dart';
import 'models/appointment_dto.dart';

class CitasRepositoryImpl implements CitasRepository {
  CitasRepositoryImpl(this._api);

  final CitasApi _api;

  @override
  Future<List<Appointment>> list({
    int? branchId,
    String? startDate,
    String? endDate,
    String? statusFilter,
    String? search,
    int limit = 200,
  }) async {
    final dtos = await _api.list(
      branchId: branchId,
      startDate: startDate,
      endDate: endDate,
      statusFilter: statusFilter,
      search: search,
      limit: limit,
    );
    return dtos.map(Appointment.fromDto).toList();
  }

  @override
  Future<Appointment> getById(int id) async {
    final dto = await _api.getById(id);
    return Appointment.fromDto(dto);
  }

  @override
  Future<Appointment> create(AppointmentCreateDto input) async {
    final dto = await _api.create(input);
    return Appointment.fromDto(dto);
  }

  @override
  Future<Appointment> update(int id, AppointmentUpdateDto input) async {
    final dto = await _api.update(id, input);
    return Appointment.fromDto(dto);
  }

  @override
  Future<void> delete(int id) async {
    await _api.delete(id);
  }
}

final _citasApiProvider = Provider<CitasApi>(
  (ref) => CitasApi(ref.watch(dioProvider)),
);

final citasRepositoryProvider = Provider<CitasRepository>(
  (ref) => CitasRepositoryImpl(ref.watch(_citasApiProvider)),
);
