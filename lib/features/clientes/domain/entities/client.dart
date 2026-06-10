import '../../data/models/client_dto.dart';
import '../../../../shared/enums/client_status.dart';

class Client {
  const Client({
    required this.id,
    required this.nombre,
    required this.apellido,
    this.telefono,
    this.edad,
    this.tipoOjo,
    this.email,
    required this.status,
    this.eyeTypeId,
    this.branchId,
    this.lastActivityAt,
  });

  final int id;
  final String nombre;
  final String apellido;
  final String? telefono;
  final int? edad;
  final String? tipoOjo;
  final String? email;
  final ClientStatus status;
  final int? eyeTypeId;
  final int? branchId;
  final DateTime? lastActivityAt;

  String get nombreCompleto => '$nombre $apellido';

  String get iniciales {
    final n = nombre.isNotEmpty ? nombre[0] : '';
    final a = apellido.isNotEmpty ? apellido[0] : '';
    return '$n$a'.toUpperCase();
  }

  factory Client.fromDto(ClientDto dto) => Client(
        id: dto.id,
        nombre: dto.name,
        apellido: dto.lastName,
        telefono: dto.phone,
        edad: dto.age,
        tipoOjo: dto.eyeType?.name,
        email: dto.email,
        status: ClientStatus.fromString(dto.status),
        eyeTypeId: dto.eyeTypeId,
        branchId: dto.branchId,
        lastActivityAt: dto.lastActivityAt,
      );

  Client copyWith({
    int? id,
    String? nombre,
    String? apellido,
    String? telefono,
    int? edad,
    String? tipoOjo,
    String? email,
    ClientStatus? status,
    int? eyeTypeId,
    int? branchId,
    DateTime? lastActivityAt,
  }) =>
      Client(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        telefono: telefono ?? this.telefono,
        edad: edad ?? this.edad,
        tipoOjo: tipoOjo ?? this.tipoOjo,
        email: email ?? this.email,
        status: status ?? this.status,
        eyeTypeId: eyeTypeId ?? this.eyeTypeId,
        branchId: branchId ?? this.branchId,
        lastActivityAt: lastActivityAt ?? this.lastActivityAt,
      );
}
