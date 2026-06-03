class Operaria {
  const Operaria({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.especialidad,
    required this.calificacion,
    required this.activa,
    this.diasDisponibles = const [],
  });

  final int id;
  final String nombre;
  final String apellido;
  final String especialidad;
  final double calificacion;
  final bool activa;
  final List<String> diasDisponibles;

  String get nombreCompleto => '$nombre $apellido';

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
  }) {
    return Operaria(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      especialidad: especialidad ?? this.especialidad,
      calificacion: calificacion ?? this.calificacion,
      activa: activa ?? this.activa,
      diasDisponibles: diasDisponibles ?? this.diasDisponibles,
    );
  }
}
