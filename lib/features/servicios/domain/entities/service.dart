class Service {
  const Service({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.precio,
    required this.duracionMinutos,
    required this.activo,
    this.descripcion,
  });

  final int id;
  final String nombre;
  final String categoria;
  final double precio;
  final int duracionMinutos;
  final bool activo;
  final String? descripcion;

  Service copyWith({
    int? id,
    String? nombre,
    String? categoria,
    double? precio,
    int? duracionMinutos,
    bool? activo,
    String? descripcion,
  }) {
    return Service(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      categoria: categoria ?? this.categoria,
      precio: precio ?? this.precio,
      duracionMinutos: duracionMinutos ?? this.duracionMinutos,
      activo: activo ?? this.activo,
      descripcion: descripcion ?? this.descripcion,
    );
  }
}
