import '../../features/ventas/domain/entities/sale.dart';
import '../enums/payment_method.dart';

/// Genera ventas distribuidas en los últimos 7 días para alimentar el
/// dashboard. Las cantidades varían para que el gráfico se vea realista.
List<Sale> buildMockSales() {
  final now = DateTime.now();
  DateTime at(int daysAgo, int hour, [int minute = 0]) {
    return DateTime(now.year, now.month, now.day, hour, minute)
        .subtract(Duration(days: daysAgo));
  }

  return [
    // Hoy
    Sale(
      id: 1,
      fecha: at(0, 9, 30),
      operariaId: 1,
      clienteId: 1,
      metodoPago: PaymentMethod.qr,
      lineas: const [
        SaleLine(
          serviceId: 1,
          serviceName: 'Pestañas clásicas',
          precio: 220,
          cantidad: 1,
        ),
      ],
    ),
    Sale(
      id: 2,
      fecha: at(0, 13, 15),
      operariaId: 2,
      clienteId: 3,
      metodoPago: PaymentMethod.tarjeta,
      descuento: 30,
      lineas: const [
        SaleLine(
          serviceId: 2,
          serviceName: 'Pestañas volumen ruso',
          precio: 350,
          cantidad: 1,
        ),
      ],
    ),

    // Ayer
    Sale(
      id: 3,
      fecha: at(1, 10, 0),
      operariaId: 3,
      clienteId: 7,
      metodoPago: PaymentMethod.efectivo,
      lineas: const [
        SaleLine(
          serviceId: 8,
          serviceName: 'Diseño + tinte de cejas',
          precio: 120,
          cantidad: 1,
        ),
      ],
    ),
    Sale(
      id: 4,
      fecha: at(1, 14, 30),
      operariaId: 1,
      metodoPago: PaymentMethod.efectivo,
      lineas: const [
        SaleLine(
          serviceId: 5,
          serviceName: 'Lifting de pestañas',
          precio: 200,
          cantidad: 1,
        ),
      ],
    ),
    Sale(
      id: 5,
      fecha: at(1, 17, 45),
      operariaId: 2,
      clienteId: 4,
      metodoPago: PaymentMethod.qr,
      lineas: const [
        SaleLine(
          serviceId: 3,
          serviceName: 'Pestañas híbridas',
          precio: 280,
          cantidad: 1,
        ),
      ],
    ),

    // 2 días
    Sale(
      id: 6,
      fecha: at(2, 11, 0),
      operariaId: 4,
      clienteId: 8,
      metodoPago: PaymentMethod.transferencia,
      lineas: const [
        SaleLine(
          serviceId: 9,
          serviceName: 'Microblading',
          precio: 850,
          cantidad: 1,
        ),
      ],
    ),

    // 3 días
    Sale(
      id: 7,
      fecha: at(3, 9, 0),
      operariaId: 1,
      clienteId: 6,
      metodoPago: PaymentMethod.tarjeta,
      lineas: const [
        SaleLine(
          serviceId: 1,
          serviceName: 'Pestañas clásicas',
          precio: 220,
          cantidad: 1,
        ),
      ],
    ),
    Sale(
      id: 8,
      fecha: at(3, 16, 0),
      operariaId: 3,
      metodoPago: PaymentMethod.efectivo,
      lineas: const [
        SaleLine(
          serviceId: 6,
          serviceName: 'Diseño de cejas',
          precio: 80,
          cantidad: 1,
        ),
      ],
    ),

    // 4 días
    Sale(
      id: 9,
      fecha: at(4, 10, 30),
      operariaId: 2,
      clienteId: 1,
      metodoPago: PaymentMethod.qr,
      lineas: const [
        SaleLine(
          serviceId: 2,
          serviceName: 'Pestañas volumen ruso',
          precio: 350,
          cantidad: 1,
        ),
      ],
    ),

    // 5 días
    Sale(
      id: 10,
      fecha: at(5, 12, 0),
      operariaId: 1,
      clienteId: 5,
      metodoPago: PaymentMethod.efectivo,
      lineas: const [
        SaleLine(
          serviceId: 1,
          serviceName: 'Pestañas clásicas',
          precio: 220,
          cantidad: 1,
        ),
      ],
    ),
    Sale(
      id: 11,
      fecha: at(5, 15, 30),
      operariaId: 3,
      clienteId: 2,
      metodoPago: PaymentMethod.tarjeta,
      lineas: const [
        SaleLine(
          serviceId: 7,
          serviceName: 'Tinte de cejas',
          precio: 70,
          cantidad: 1,
        ),
      ],
    ),

    // 6 días
    Sale(
      id: 12,
      fecha: at(6, 11, 0),
      operariaId: 2,
      clienteId: 3,
      metodoPago: PaymentMethod.qr,
      descuento: 20,
      lineas: const [
        SaleLine(
          serviceId: 4,
          serviceName: 'Retoque pestañas',
          precio: 180,
          cantidad: 1,
        ),
      ],
    ),
  ];
}
