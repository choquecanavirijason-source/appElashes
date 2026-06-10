import '../../features/citas/domain/entities/appointment.dart';
import '../enums/appointment_status.dart';

List<Appointment> buildMockAppointments() {
  final now = DateTime.now();
  final hoy = DateTime(now.year, now.month, now.day);

  Appointment make({
    required int id,
    required String clientName,
    required String? professionalName,
    required String? serviceName,
    required double? servicePrice,
    required DateTime startTime,
    required int durationMinutes,
    required AppointmentStatus status,
  }) {
    return Appointment(
      id: id,
      clientId: id,
      clientName: clientName,
      professionalName: professionalName,
      serviceName: serviceName,
      servicePrice: servicePrice,
      startTime: startTime,
      endTime: startTime.add(Duration(minutes: durationMinutes)),
      status: status,
    );
  }

  return [
    make(
      id: 1,
      clientName: 'María Rodríguez',
      professionalName: 'ana_gomez',
      serviceName: 'Pestañas clásicas',
      servicePrice: 220,
      startTime: hoy.add(const Duration(hours: 9)),
      durationMinutes: 90,
      status: AppointmentStatus.atendida,
    ),
    make(
      id: 2,
      clientName: 'Lucía Mendoza',
      professionalName: 'carla_rios',
      serviceName: 'Pestañas volumen ruso',
      servicePrice: 350,
      startTime: hoy.add(const Duration(hours: 11, minutes: 30)),
      durationMinutes: 120,
      status: AppointmentStatus.enServicio,
    ),
    make(
      id: 3,
      clientName: 'Valeria Torrico',
      professionalName: 'sofia_vega',
      serviceName: 'Diseño y tinte de cejas',
      servicePrice: 120,
      startTime: hoy.add(const Duration(hours: 15)),
      durationMinutes: 45,
      status: AppointmentStatus.reserva,
    ),
    make(
      id: 4,
      clientName: 'Daniela Quispe',
      professionalName: 'ana_gomez',
      serviceName: 'Lifting de pestañas',
      servicePrice: 180,
      startTime: hoy.add(const Duration(hours: 17, minutes: 30)),
      durationMinutes: 60,
      status: AppointmentStatus.reserva,
    ),
    make(
      id: 5,
      clientName: 'Camila Vargas',
      professionalName: 'carla_rios',
      serviceName: 'Retoque de volumen',
      servicePrice: 180,
      startTime: hoy.add(const Duration(days: 1, hours: 10)),
      durationMinutes: 75,
      status: AppointmentStatus.reserva,
    ),
    make(
      id: 6,
      clientName: 'Isabella Salazar',
      professionalName: null,
      serviceName: 'Microblading',
      servicePrice: 850,
      startTime: hoy.add(const Duration(days: 1, hours: 14)),
      durationMinutes: 150,
      status: AppointmentStatus.reserva,
    ),
    make(
      id: 7,
      clientName: 'Sofía Castro',
      professionalName: 'ana_gomez',
      serviceName: 'Pestañas clásicas',
      servicePrice: 220,
      startTime: hoy.add(const Duration(days: 2, hours: 11)),
      durationMinutes: 90,
      status: AppointmentStatus.reserva,
    ),
    make(
      id: 8,
      clientName: 'Andrea Flores',
      professionalName: 'sofia_vega',
      serviceName: 'Diseño de cejas',
      servicePrice: 80,
      startTime: hoy.add(const Duration(days: 3, hours: 16, minutes: 30)),
      durationMinutes: 30,
      status: AppointmentStatus.reserva,
    ),
    make(
      id: 9,
      clientName: 'María Rodríguez',
      professionalName: 'carla_rios',
      serviceName: 'Pestañas volumen ruso',
      servicePrice: 350,
      startTime: hoy.subtract(const Duration(days: 2, hours: -10)),
      durationMinutes: 120,
      status: AppointmentStatus.pagada,
    ),
    make(
      id: 10,
      clientName: 'Daniela Quispe',
      professionalName: 'sofia_vega',
      serviceName: 'Tinte de cejas',
      servicePrice: 70,
      startTime: hoy.subtract(const Duration(days: 5, hours: -14)),
      durationMinutes: 30,
      status: AppointmentStatus.cancelada,
    ),
  ];
}
