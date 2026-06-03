import '../../../../shared/enums/appointment_status.dart';

class Appointment {
  const Appointment({
    required this.id,
    required this.clienteId,
    required this.operariaId,
    required this.servicio,
    required this.fechaHora,
    required this.duracionMinutos,
    required this.precio,
    required this.estado,
    this.notas,
  });

  final int id;
  final int clienteId;
  final int operariaId;
  final String servicio;
  final DateTime fechaHora;
  final int duracionMinutos;
  final double precio;
  final AppointmentStatus estado;
  final String? notas;

  DateTime get fechaFin =>
      fechaHora.add(Duration(minutes: duracionMinutos));

  bool get esHoy {
    final now = DateTime.now();
    return fechaHora.year == now.year &&
        fechaHora.month == now.month &&
        fechaHora.day == now.day;
  }

  Appointment copyWith({
    int? id,
    int? clienteId,
    int? operariaId,
    String? servicio,
    DateTime? fechaHora,
    int? duracionMinutos,
    double? precio,
    AppointmentStatus? estado,
    String? notas,
  }) {
    return Appointment(
      id: id ?? this.id,
      clienteId: clienteId ?? this.clienteId,
      operariaId: operariaId ?? this.operariaId,
      servicio: servicio ?? this.servicio,
      fechaHora: fechaHora ?? this.fechaHora,
      duracionMinutos: duracionMinutos ?? this.duracionMinutos,
      precio: precio ?? this.precio,
      estado: estado ?? this.estado,
      notas: notas ?? this.notas,
    );
  }
}
