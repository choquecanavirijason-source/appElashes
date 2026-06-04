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

  String get nombreCompleto {
    if (apellido.isEmpty) return nombre;
    return '$nombre $apellido';
  }

  String get iniciales {
    final n = nombre.isNotEmpty ? nombre[0] : '';
    final a = apellido.isNotEmpty ? apellido[0] : '';
    return '$n$a'.toUpperCase();
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
    );
  }
}
