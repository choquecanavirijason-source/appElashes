import '../../../../shared/enums/payment_method.dart';

class SaleLine {
  const SaleLine({
    required this.serviceId,
    required this.serviceName,
    required this.precio,
    required this.cantidad,
  });

  final int serviceId;
  final String serviceName;
  final double precio;
  final int cantidad;

  double get subtotal => precio * cantidad;
}

class Sale {
  const Sale({
    required this.id,
    required this.fecha,
    required this.operariaId,
    required this.lineas,
    required this.metodoPago,
    this.clienteId,
    this.descuento = 0,
    this.notas,
  });

  final int id;
  final DateTime fecha;
  final int operariaId;
  final List<SaleLine> lineas;
  final PaymentMethod metodoPago;
  final int? clienteId;
  final double descuento;
  final String? notas;

  double get subtotal => lineas.fold<double>(0, (a, l) => a + l.subtotal);

  double get total => (subtotal - descuento).clamp(0, double.infinity);

  String get categoriaPrincipal =>
      lineas.isEmpty ? '—' : lineas.first.serviceName;
}
