import '../../data/models/operaria_dto.dart';

class Operaria {
  const Operaria({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.especialidad,
    required this.calificacion,
    required this.activa,
    this.diasDisponibles = const [],
    this.username = '',
    this.rol = 'Operaria',
    this.enLinea = false,
    this.sucursal = '',
    this.productividadDiaria,
    // Campos backend
    this.email,
    this.phone,
    this.roleId,
    this.branchId,
    this.skillLevel,
  });

  final int id;
  final String nombre;
  final String apellido;
  final String especialidad;
  final double calificacion;
  final bool activa;
  final List<String> diasDisponibles;
  final String username;
  final String rol;
  final bool enLinea;
  final String sucursal;
  final double? productividadDiaria;
  final String? email;
  final String? phone;
  final int? roleId;
  final int? branchId;
  final int? skillLevel;

  String get nombreCompleto {
    if (apellido.isEmpty) return nombre;
    return '$nombre $apellido';
  }

  String get iniciales {
    final n = nombre.isNotEmpty ? nombre[0] : '';
    final a = apellido.isNotEmpty ? apellido[0] : '';
    if (a.isNotEmpty) return '$n$a'.toUpperCase();
    return nombre.length >= 2
        ? nombre.substring(0, 2).toUpperCase()
        : n.toUpperCase();
  }

  factory Operaria.fromDto(OperariaDto dto) {
    final displayName = _formatUsername(dto.username);
    return Operaria(
      id: dto.id,
      nombre: displayName,
      apellido: '',
      especialidad: dto.role?.name ?? 'Sin rol',
      calificacion: dto.skillLevel?.toDouble() ?? 0.0,
      activa: dto.isActive,
      username: dto.username,
      rol: dto.role?.name ?? 'Sin rol',
      enLinea: false,
      sucursal: dto.branch?.name ?? '',
      email: dto.email,
      phone: dto.phone,
      roleId: dto.roleId,
      branchId: dto.branchId,
      skillLevel: dto.skillLevel,
    );
  }

  static String _formatUsername(String username) {
    return username
        .replaceAll(RegExp(r'^@'), '')
        .replaceAll(RegExp(r'[._\-]'), ' ')
        .split(' ')
        .where((p) => p.isNotEmpty)
        .map((p) => p[0].toUpperCase() + p.substring(1))
        .join(' ');
  }

  Operaria copyWith({
    int? id,
    String? nombre,
    String? apellido,
    String? especialidad,
    double? calificacion,
    bool? activa,
    List<String>? diasDisponibles,
    String? username,
    String? rol,
    bool? enLinea,
    String? sucursal,
    double? productividadDiaria,
    String? email,
    String? phone,
    int? roleId,
    int? branchId,
    int? skillLevel,
  }) {
    return Operaria(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      especialidad: especialidad ?? this.especialidad,
      calificacion: calificacion ?? this.calificacion,
      activa: activa ?? this.activa,
      diasDisponibles: diasDisponibles ?? this.diasDisponibles,
      username: username ?? this.username,
      rol: rol ?? this.rol,
      enLinea: enLinea ?? this.enLinea,
      sucursal: sucursal ?? this.sucursal,
      productividadDiaria: productividadDiaria ?? this.productividadDiaria,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      roleId: roleId ?? this.roleId,
      branchId: branchId ?? this.branchId,
      skillLevel: skillLevel ?? this.skillLevel,
    );
  }
}
