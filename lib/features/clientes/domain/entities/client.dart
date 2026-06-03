class Client {
  const Client({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.edad,
    required this.tipoOjo,
    required this.visitas,
    this.email,
    this.notas,
  });

  final int id;
  final String nombre;
  final String apellido;
  final String telefono;
  final int edad;
  final String tipoOjo;
  final int visitas;
  final String? email;
  final String? notas;

  String get nombreCompleto => '$nombre $apellido';

  String get iniciales {
    final n = nombre.isNotEmpty ? nombre[0] : '';
    final a = apellido.isNotEmpty ? apellido[0] : '';
    return '$n$a'.toUpperCase();
  }

  bool get esFrecuente => visitas >= 5;

  Client copyWith({
    int? id,
    String? nombre,
    String? apellido,
    String? telefono,
    int? edad,
    String? tipoOjo,
    int? visitas,
    String? email,
    String? notas,
  }) {
    return Client(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      telefono: telefono ?? this.telefono,
      edad: edad ?? this.edad,
      tipoOjo: tipoOjo ?? this.tipoOjo,
      visitas: visitas ?? this.visitas,
      email: email ?? this.email,
      notas: notas ?? this.notas,
    );
  }
}
