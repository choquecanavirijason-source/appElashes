import '../../features/citas/domain/entities/appointment.dart';
import '../enums/appointment_status.dart';

List<Appointment> buildMockAppointments() {
  final now = DateTime.now();
  final hoy = DateTime(now.year, now.month, now.day);

  return [
    // Hoy
    Appointment(
      id: 1,
      clienteId: 1,
      operariaId: 1,
      servicio: 'Pestañas clásicas',
      fechaHora: hoy.add(const Duration(hours: 9)),
      duracionMinutos: 90,
      precio: 220,
      estado: AppointmentStatus.atendida,
    ),
    Appointment(
      id: 2,
      clienteId: 3,
      operariaId: 2,
      servicio: 'Pestañas volumen ruso',
      fechaHora: hoy.add(const Duration(hours: 11, minutes: 30)),
      duracionMinutos: 120,
      precio: 350,
      estado: AppointmentStatus.enServicio,
    ),
    Appointment(
      id: 3,
      clienteId: 7,
      operariaId: 3,
      servicio: 'Diseño y tinte de cejas',
      fechaHora: hoy.add(const Duration(hours: 15)),
      duracionMinutos: 45,
      precio: 120,
      estado: AppointmentStatus.reserva,
    ),
    Appointment(
      id: 4,
      clienteId: 5,
      operariaId: 1,
      servicio: 'Lifting de pestañas',
      fechaHora: hoy.add(const Duration(hours: 17, minutes: 30)),
      duracionMinutos: 60,
      precio: 180,
      estado: AppointmentStatus.reserva,
      notas: 'Primera vez',
    ),

    // Mañana
    Appointment(
      id: 5,
      clienteId: 2,
      operariaId: 2,
      servicio: 'Retoque de volumen',
      fechaHora: hoy.add(const Duration(days: 1, hours: 10)),
      duracionMinutos: 75,
      precio: 180,
      estado: AppointmentStatus.reserva,
    ),
    Appointment(
      id: 6,
      clienteId: 8,
      operariaId: 4,
      servicio: 'Microblading',
      fechaHora: hoy.add(const Duration(days: 1, hours: 14)),
      duracionMinutos: 150,
      precio: 850,
      estado: AppointmentStatus.reserva,
    ),

    // Próximos días
    Appointment(
      id: 7,
      clienteId: 4,
      operariaId: 1,
      servicio: 'Pestañas clásicas',
      fechaHora: hoy.add(const Duration(days: 2, hours: 11)),
      duracionMinutos: 90,
      precio: 220,
      estado: AppointmentStatus.reserva,
    ),
    Appointment(
      id: 8,
      clienteId: 6,
      operariaId: 3,
      servicio: 'Diseño de cejas',
      fechaHora: hoy.add(const Duration(days: 3, hours: 16, minutes: 30)),
      duracionMinutos: 30,
      precio: 80,
      estado: AppointmentStatus.reserva,
    ),

    // Pasado
    Appointment(
      id: 9,
      clienteId: 1,
      operariaId: 2,
      servicio: 'Pestañas volumen ruso',
      fechaHora: hoy.subtract(const Duration(days: 2, hours: -10)),
      duracionMinutos: 120,
      precio: 350,
      estado: AppointmentStatus.pagada,
    ),
    Appointment(
      id: 10,
      clienteId: 5,
      operariaId: 3,
      servicio: 'Tinte de cejas',
      fechaHora: hoy.subtract(const Duration(days: 5, hours: -14)),
      duracionMinutos: 30,
      precio: 70,
      estado: AppointmentStatus.cancelada,
    ),
  ];
}
