import 'entities/appointment.dart';
import '../data/models/appointment_dto.dart';

abstract class CitasRepository {
  Future<List<Appointment>> list({
    int? branchId,
    String? startDate,
    String? endDate,
    String? statusFilter,
    String? search,
    int limit = 200,
  });

  Future<Appointment> getById(int id);

  Future<Appointment> create(AppointmentCreateDto input);

  Future<Appointment> update(int id, AppointmentUpdateDto input);

  Future<void> delete(int id);
}
