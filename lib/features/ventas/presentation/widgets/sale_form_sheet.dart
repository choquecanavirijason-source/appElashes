import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/pill_button.dart';
import '../../../../core/storage/prefs_storage.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/enums/payment_method.dart';
import '../../../clientes/presentation/providers/clients_provider.dart';
import '../../../operarias/presentation/providers/operarias_provider.dart';
import '../../../servicios/presentation/providers/services_provider.dart';
import '../../data/models/pos_sale_dto.dart';
import '../../data/pos_sales_repository_impl.dart';
import '../../domain/entities/sale.dart';
import '../providers/pos_sales_provider.dart';
import '../providers/sales_provider.dart';

class SaleFormSheet extends ConsumerStatefulWidget {
  const SaleFormSheet({super.key, this.initialSale});

  final PosSale? initialSale;

  static Future<void> show(BuildContext context, {PosSale? sale}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => SaleFormSheet(initialSale: sale),
    );
  }

  @override
  ConsumerState<SaleFormSheet> createState() => _SaleFormSheetState();
}

class _SaleFormSheetState extends ConsumerState<SaleFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _descuento = TextEditingController(text: '0');
  final _notas = TextEditingController();

  final List<SaleLine> _lineas = [];
  int? _pendingServiceId; // servicio seleccionado en el selector "agregar"
  int? _operariaId;
  int? _clienteId;
  PaymentMethod _metodo = PaymentMethod.efectivo;

  // Para el payload real del backend
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now().add(const Duration(hours: 1));
  String _discountType = 'amount'; // 'amount' | 'percent'
  bool _saleWithoutAppointments = false;

  @override
  void dispose() {
    _descuento.dispose();
    _notas.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _prefillFromSale();
  }

  void _prefillFromSale() {
    final sale = widget.initialSale;
    if (sale == null) return;

    _clienteId = sale.clientId;
    _metodo = _mapPaymentMethod(sale.paymentMethod);
    _descuento.text = sale.discountValue.toStringAsFixed(0);
    _notas.text = sale.notes ?? '';
    _discountType = 'amount'; // default; full type not in summary
    // Note: detailed items (services/professionals) from the original sale
    // are not pre-loaded here because the list PosSale is a summary.
    // User can add/adjust services below.
  }

  PaymentMethod _mapPaymentMethod(String method) => switch (method.toLowerCase()) {
        'cash' => PaymentMethod.efectivo,
        'card' => PaymentMethod.tarjeta,
        'transfer' => PaymentMethod.transferencia,
        'qr' => PaymentMethod.qr,
        _ => PaymentMethod.efectivo,
      };

  void _addService() {
    if (_pendingServiceId == null) return;
    final servicio =
        ref.read(servicesProvider.notifier).byId(_pendingServiceId!);
    if (servicio == null) return;

    setState(() {
      _lineas.add(SaleLine(
        serviceId: servicio.id,
        serviceName: servicio.nombre,
        precio: servicio.precio,
        cantidad: 1,
      ));
      _pendingServiceId = null;
    });
  }

  void _removeLine(int index) {
    setState(() {
      _lineas.removeAt(index);
    });
  }

  Future<void> _pickStartTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startTime,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_startTime),
    );
    if (time == null) return;

    setState(() {
      _startTime = DateTime(
        date.year, date.month, date.day, time.hour, time.minute,
      );
      // auto adjust end if before start
      if (_endTime.isBefore(_startTime)) {
        _endTime = _startTime.add(const Duration(hours: 1));
      }
    });
  }

  Future<void> _pickEndTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _endTime,
      firstDate: _startTime,
      lastDate: DateTime(2030),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_endTime),
    );
    if (time == null) return;

    final newEnd = DateTime(
      date.year, date.month, date.day, time.hour, time.minute,
    );
    if (newEnd.isAfter(_startTime)) {
      setState(() => _endTime = newEnd);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La hora de fin debe ser posterior al inicio')),
      );
    }
  }

  String _formatDateTime(DateTime dt) {
    return DateFormat('dd/MM/yyyy HH:mm', 'es').format(dt);
  }

  void _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_lineas.isEmpty || _operariaId == null || _clienteId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Agrega al menos un servicio, selecciona operaria y cliente')),
      );
      return;
    }

    final branchId = ref.read(prefsStorageProvider).selectedBranchId ?? 1;

    // Mapear método de pago al valor que espera el backend
    final paymentMethod = switch (_metodo) {
      PaymentMethod.efectivo => 'cash',
      PaymentMethod.tarjeta => 'card',
      PaymentMethod.transferencia => 'transfer',
      PaymentMethod.qr => 'qr',
    };

    // Construir items para el backend (usamos el mismo horario para todos por simplicidad)
    final items = _lineas
        .map((l) => PosSaleItemCreateDto(
              serviceId: l.serviceId,
              professionalId: _operariaId,
              isIa: false,
              startTime: _startTime,
              endTime: _endTime,
              branchId: branchId,
              price: l.precio,
              quantity: l.cantidad,
            ))
        .toList();

    final createDto = PosSaleCreateDto(
      clientId: _clienteId!,
      branchId: branchId,
      paymentMethod: paymentMethod,
      discountType: _discountType,
      discountValue: double.tryParse(_descuento.text) ?? 0,
      notes: _notas.text.trim().isEmpty ? null : _notas.text.trim(),
      items: items,
      linkAppointmentId: null,
      saleWithoutAppointments: _saleWithoutAppointments,
    );

    try {
      final repo = ref.read(posSalesRepositoryProvider);
      await repo.create(createDto);

      // Refrescar la lista real de ventas
      ref.invalidate(posSalesProvider);

      if (context.mounted) {
        Navigator.of(context).pop();
        final msg = widget.initialSale != null
            ? 'Venta actualizada (nuevo registro generado)'
            : 'Venta registrada correctamente';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al registrar venta: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final servicios = ref.watch(activeServicesProvider);
    final operarias =
        ref.watch(operariasProvider).where((o) => o.activa).toList();
    final clientes = ref.watch(clientsProvider);
    final viewInsets = MediaQuery.viewInsetsOf(context).bottom;

    final descuento = double.tryParse(_descuento.text) ?? 0;
    final subtotal =
        _lineas.fold<double>(0, (sum, l) => sum + l.subtotal);
    final discountAmount = _discountType == 'percent'
        ? subtotal * (descuento / 100)
        : descuento;
    final total = (subtotal - discountAmount).clamp(0, double.infinity);

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20 + viewInsets),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.initialSale != null ? 'Editar venta' : 'Registrar venta',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                initialValue: _operariaId,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Operaria'),
                items: operarias
                    .map(
                      (o) => DropdownMenuItem(
                        value: o.id,
                        child: Text(
                          o.nombreCompleto,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _operariaId = v),
                validator: (v) =>
                    v == null ? 'Selecciona una operaria' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<int?>(
                initialValue: _clienteId,
                isExpanded: true,
                decoration:
                    const InputDecoration(labelText: 'Cliente (opcional)'),
                items: [
                  const DropdownMenuItem(
                    value: null,
                    child: Text('Venta sin cliente'),
                  ),
                  ...clientes.map(
                    (c) => DropdownMenuItem<int?>(
                      value: c.id,
                      child: Text(
                        c.nombreCompleto,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
                onChanged: (v) => setState(() => _clienteId = v),
              ),
              const SizedBox(height: 16),

              // ── Servicios (múltiples) ──────────────────────────────────────
              Row(
                children: [
                  const Text(
                    'Servicios',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  if (_lineas.isNotEmpty) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.goldAccent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        '${_lineas.length}',
                        style: const TextStyle(
                          color: AppColors.goldAccent,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 6),

              // Lista de servicios agregados (con protección contra overflow)
              if (_lineas.isEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.darkCardElevated.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Agrega uno o más servicios a la venta',
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
                  ),
                )
              else
                Column(
                  children: [
                    for (int i = 0; i < _lineas.length; i++)
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.darkCardElevated.withValues(alpha: 0.55),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _lineas[i].serviceName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Bs ${_lineas[i].precio.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: AppColors.goldAccent,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () => _removeLine(i),
                              child: const Icon(
                                Icons.close_rounded,
                                size: 18,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

              const SizedBox(height: 8),

              // Selector para agregar servicio (full width + botón debajo para evitar right overflow)
              DropdownButtonFormField<int>(
                initialValue: _pendingServiceId,
                isExpanded: true,
                isDense: true,
                decoration: const InputDecoration(
                  labelText: 'Seleccionar servicio',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                items: servicios
                    .map(
                      (s) => DropdownMenuItem(
                        value: s.id,
                        child: Text(
                          '${s.nombre} · Bs ${s.precio.toStringAsFixed(0)}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _pendingServiceId = v),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _pendingServiceId == null ? null : _addService,
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Agregar servicio'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ── Horario (requerido por el backend para los items) ───────────
              const Text(
                'Horario del servicio',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _pickStartTime,
                      child: Text('Inicio: ${_formatDateTime(_startTime)}'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _pickEndTime,
                      child: Text('Fin: ${_formatDateTime(_endTime)}'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Text(
                'Método de pago',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                children: PaymentMethod.values
                    .map(
                      (m) => ChoiceChip(
                        label: Text(m.label),
                        avatar: Icon(m.icon, size: 18, color: m.color),
                        selected: _metodo == m,
                        onSelected: (_) => setState(() => _metodo = m),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 12),

              // Tipo de descuento (para coincidir con el payload del backend)
              const Text(
                'Tipo de descuento',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('Monto fijo'),
                    selected: _discountType == 'amount',
                    onSelected: (_) => setState(() => _discountType = 'amount'),
                  ),
                  ChoiceChip(
                    label: const Text('Porcentaje'),
                    selected: _discountType == 'percent',
                    onSelected: (_) => setState(() => _discountType = 'percent'),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: _descuento,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: _discountType == 'amount' ? 'Descuento (Bs)' : 'Descuento (%)',
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _notas,
                maxLines: 2,
                decoration:
                    const InputDecoration(labelText: 'Notas (opcional)'),
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Bs ${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF094732),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              PillButton(
                label: 'Cobrar',
                onPressed: _onSubmit,
                height: 52,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
