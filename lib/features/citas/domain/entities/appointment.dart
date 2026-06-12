import '../../../../shared/enums/appointment_status.dart';
import '../../data/models/appointment_dto.dart';

class Appointment {
  const Appointment({
    required this.id,
    this.ticketCode,
    required this.clientId,
    required this.clientName,
    this.clientPhone,
    this.professionalId,
    this.professionalName,
    this.serviceId,
    this.serviceName,
    this.servicePrice,
    this.branchId,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.advancePaymentAmount = 0.0,
  });

  final int id;
  final String? ticketCode;
  final int clientId;
  final String clientName;
  final String? clientPhone;
  final int? professionalId;
  final String? professionalName;
  final int? serviceId;
  final String? serviceName;
  final double? servicePrice;
  final int? branchId;
  final DateTime startTime;
  final DateTime endTime;
  final AppointmentStatus status;
  final double advancePaymentAmount;

  int get duracionMinutos => endTime.difference(startTime).inMinutes;

  bool get esHoy {
    final now = DateTime.now();
    return startTime.year == now.year &&
        startTime.month == now.month &&
        startTime.day == now.day;
  }

  String get professionalInitials {
    final name = professionalName;
    if (name == null || name.isEmpty) return '?';
    final parts = name.split(RegExp(r'[\s_]'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.substring(0, name.length >= 2 ? 2 : 1).toUpperCase();
  }

  factory Appointment.fromDto(AppointmentDto dto) {
    final clientName =
        '${dto.client.name} ${dto.client.lastName ?? ''}'.trim();
    return Appointment(
      id: dto.id,
      ticketCode: dto.ticketCode,
      clientId: dto.clientId,
      clientName: clientName,
      clientPhone: dto.client.phone,
      professionalId: dto.professionalId,
      professionalName: dto.professional?.username,
      serviceId: dto.serviceId,
      serviceName: dto.service?.name ??
          dto.services?.firstOrNull?.name,
      servicePrice: dto.service?.price ??
          dto.services?.firstOrNull?.price,
      branchId: dto.branchId,
      startTime: dto.startTime,
      endTime: dto.endTime,
      status: AppointmentStatus.fromString(dto.status),
      advancePaymentAmount: dto.advancePaymentAmount,
    );
  }

  Appointment copyWith({
    int? id,
    String? ticketCode,
    int? clientId,
    String? clientName,
    String? clientPhone,
    int? professionalId,
    String? professionalName,
    int? serviceId,
    String? serviceName,
    double? servicePrice,
    int? branchId,
    DateTime? startTime,
    DateTime? endTime,
    AppointmentStatus? status,
    double? advancePaymentAmount,
  }) {
    return Appointment(
      id: id ?? this.id,
      ticketCode: ticketCode ?? this.ticketCode,
      clientId: clientId ?? this.clientId,
      clientName: clientName ?? this.clientName,
      clientPhone: clientPhone ?? this.clientPhone,
      professionalId: professionalId ?? this.professionalId,
      professionalName: professionalName ?? this.professionalName,
      serviceId: serviceId ?? this.serviceId,
      serviceName: serviceName ?? this.serviceName,
      servicePrice: servicePrice ?? this.servicePrice,
      branchId: branchId ?? this.branchId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      advancePaymentAmount: advancePaymentAmount ?? this.advancePaymentAmount,
    );
  }
}
