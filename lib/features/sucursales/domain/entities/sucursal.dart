import '../../data/models/branch_dto.dart';

class Sucursal {
  const Sucursal({
    required this.id,
    required this.nombre,
    this.activa = true,
    this.ciudad,
    this.departamento,
    this.telefono,
    this.direccion,
    this.equipoCount = 0,
    this.clientasCount = 0,
    this.citasCount = 0,
    this.openingHours = const [],
    this.userIds = const [],
  });

  final int id;
  final String nombre;
  final bool activa;
  final String? ciudad;
  final String? departamento;
  final String? telefono;
  final String? direccion;
  final int equipoCount;
  final int clientasCount;
  final int citasCount;
  final List<BranchDayScheduleDto> openingHours;
  final List<int> userIds;

  factory Sucursal.fromDto(BranchDto dto) => Sucursal(
        id: dto.id,
        nombre: dto.name,
        activa: dto.isActive,
        ciudad: dto.city,
        departamento: dto.department,
        direccion: dto.address,
        openingHours: dto.openingHours,
        userIds: dto.userIds,
      );

  Sucursal copyWith({
    int? id,
    String? nombre,
    bool? activa,
    String? ciudad,
    String? departamento,
    String? telefono,
    String? direccion,
    int? equipoCount,
    int? clientasCount,
    int? citasCount,
    List<BranchDayScheduleDto>? openingHours,
    List<int>? userIds,
  }) {
    return Sucursal(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      activa: activa ?? this.activa,
      ciudad: ciudad ?? this.ciudad,
      departamento: departamento ?? this.departamento,
      telefono: telefono ?? this.telefono,
      direccion: direccion ?? this.direccion,
      equipoCount: equipoCount ?? this.equipoCount,
      clientasCount: clientasCount ?? this.clientasCount,
      citasCount: citasCount ?? this.citasCount,
      openingHours: openingHours ?? this.openingHours,
      userIds: userIds ?? this.userIds,
    );
  }
}
