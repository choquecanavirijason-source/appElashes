import '../../data/models/service_dto.dart';

class Service {
  const Service({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.duracionMinutos,
    this.categoria,
    this.descripcion,
    this.categoryId,
    this.imageUrl,
    this.commissionRate,
    this.ticketCount = 0,
  });

  final int id;
  final String nombre;
  final String? categoria;
  final double precio;
  final int duracionMinutos;
  final String? descripcion;
  final int? categoryId;
  final String? imageUrl;
  final double? commissionRate;
  final int ticketCount;

  factory Service.fromDto(ServiceDto dto) => Service(
        id: dto.id,
        nombre: dto.name,
        categoria: dto.category?.name,
        precio: dto.price,
        duracionMinutos: dto.durationMinutes,
        descripcion: dto.description,
        categoryId: dto.categoryId,
        imageUrl: dto.imageUrl,
        commissionRate: dto.commissionRate,
        ticketCount: dto.ticketCount,
      );

  Service copyWith({
    int? id,
    String? nombre,
    String? categoria,
    double? precio,
    int? duracionMinutos,
    String? descripcion,
    int? categoryId,
    String? imageUrl,
    double? commissionRate,
    int? ticketCount,
  }) {
    return Service(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      categoria: categoria ?? this.categoria,
      precio: precio ?? this.precio,
      duracionMinutos: duracionMinutos ?? this.duracionMinutos,
      descripcion: descripcion ?? this.descripcion,
      categoryId: categoryId ?? this.categoryId,
      imageUrl: imageUrl ?? this.imageUrl,
      commissionRate: commissionRate ?? this.commissionRate,
      ticketCount: ticketCount ?? this.ticketCount,
    );
  }
}
