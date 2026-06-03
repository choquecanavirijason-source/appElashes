import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/mock_sales.dart';
import '../../../../shared/enums/payment_method.dart';
import '../../domain/entities/sale.dart';

class SalesNotifier extends Notifier<List<Sale>> {
  @override
  List<Sale> build() {
    final initial = buildMockSales()
      ..sort((a, b) => b.fecha.compareTo(a.fecha));
    return initial;
  }

  void add({
    required int operariaId,
    required List<SaleLine> lineas,
    required PaymentMethod metodoPago,
    int? clienteId,
    double descuento = 0,
    String? notas,
    DateTime? fecha,
  }) {
    final nextId = state.isEmpty
        ? 1
        : (state.map((s) => s.id).reduce((a, b) => a > b ? a : b) + 1);
    final venta = Sale(
      id: nextId,
      fecha: fecha ?? DateTime.now(),
      operariaId: operariaId,
      clienteId: clienteId,
      lineas: lineas,
      metodoPago: metodoPago,
      descuento: descuento,
      notas: notas?.trim().isEmpty ?? true ? null : notas!.trim(),
    );
    state = [venta, ...state]
      ..sort((a, b) => b.fecha.compareTo(a.fecha));
  }
}

final salesProvider =
    NotifierProvider<SalesNotifier, List<Sale>>(SalesNotifier.new);

/// Ingresos por día durante los últimos `days` días (incluye hoy).
/// Devuelve lista ordenada del más viejo al más reciente, longitud = days.
final salesByDayProvider = Provider.family<List<DailyRevenue>, int>((ref, days) {
  final all = ref.watch(salesProvider);
  final now = DateTime.now();
  final hoy = DateTime(now.year, now.month, now.day);

  final result = <DailyRevenue>[];
  for (var i = days - 1; i >= 0; i--) {
    final d = hoy.subtract(Duration(days: i));
    final dayTotal = all.where((s) {
      return s.fecha.year == d.year &&
          s.fecha.month == d.month &&
          s.fecha.day == d.day;
    }).fold<double>(0, (a, s) => a + s.total);
    result.add(DailyRevenue(date: d, total: dayTotal));
  }
  return result;
});

class DailyRevenue {
  const DailyRevenue({required this.date, required this.total});
  final DateTime date;
  final double total;
}

/// Ingresos totales por categoría de servicio (basado en `serviceName`
/// + mapeo del catálogo). Para el pie chart.
final revenueByCategoryProvider = Provider<Map<String, double>>((ref) {
  final all = ref.watch(salesProvider);
  final result = <String, double>{};
  for (final venta in all) {
    for (final linea in venta.lineas) {
      final categoria = _categoriaPorNombre(linea.serviceName);
      result.update(
        categoria,
        (v) => v + linea.subtotal,
        ifAbsent: () => linea.subtotal,
      );
    }
  }
  return result;
});

String _categoriaPorNombre(String nombreServicio) {
  final n = nombreServicio.toLowerCase();
  if (n.contains('pestaña') || n.contains('lifting') || n.contains('retoque')) {
    return 'Pestañas';
  }
  if (n.contains('ceja') || n.contains('microblading')) {
    return 'Cejas';
  }
  if (n.contains('manicure') || n.contains('uña')) return 'Uñas';
  return 'Otros';
}

/// Ranking de operarias por ingresos totales generados.
final topOperariasProvider = Provider<List<OperariaRanking>>((ref) {
  final all = ref.watch(salesProvider);
  final totals = <int, double>{};
  final counts = <int, int>{};
  for (final v in all) {
    totals.update(
      v.operariaId,
      (x) => x + v.total,
      ifAbsent: () => v.total,
    );
    counts.update(v.operariaId, (x) => x + 1, ifAbsent: () => 1);
  }
  final entries = totals.entries
      .map(
        (e) => OperariaRanking(
          operariaId: e.key,
          total: e.value,
          ventas: counts[e.key] ?? 0,
        ),
      )
      .toList()
    ..sort((a, b) => b.total.compareTo(a.total));
  return entries;
});

class OperariaRanking {
  const OperariaRanking({
    required this.operariaId,
    required this.total,
    required this.ventas,
  });
  final int operariaId;
  final double total;
  final int ventas;
}
