class Sucursal {
  const Sucursal({
    required this.id,
    required this.nombre,
    required this.activa,
    required this.ciudad,
    required this.departamento,
    required this.telefono,
    required this.direccion,
    required this.equipoCount,
    required this.clientasCount,
    required this.citasCount,
  });

  final int id;
  final String nombre;
  final bool activa;
  final String ciudad;
  final String departamento;
  final String telefono;
  final String direccion;
  final int equipoCount;
  final int clientasCount;
  final int citasCount;
}
