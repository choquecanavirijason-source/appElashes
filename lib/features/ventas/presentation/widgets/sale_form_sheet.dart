import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/atoms/pill_button.dart';
import '../../../../shared/enums/payment_method.dart';
import '../../../clientes/presentation/providers/clients_provider.dart';
import '../../../operarias/presentation/providers/operarias_provider.dart';
import '../../../servicios/presentation/providers/services_provider.dart';
import '../../domain/entities/sale.dart';
import '../providers/sales_provider.dart';

class SaleFormSheet extends ConsumerStatefulWidget {
  const SaleFormSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const SaleFormSheet(),
    );
  }

  @override
  ConsumerState<SaleFormSheet> createState() => _SaleFormSheetState();
}

class _SaleFormSheetState extends ConsumerState<SaleFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _descuento = TextEditingController(text: '0');
  final _notas = TextEditingController();

  int? _servicioId;
  int? _operariaId;
  int? _clienteId;
  PaymentMethod _metodo = PaymentMethod.efectivo;

  @override
  void dispose() {
    _descuento.dispose();
    _notas.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    if (_servicioId == null || _operariaId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona servicio y operaria')),
      );
      return;
    }
    final servicio =
        ref.read(servicesProvider.notifier).byId(_servicioId!);
    if (servicio == null) return;

    ref.read(salesProvider.notifier).add(
          operariaId: _operariaId!,
          clienteId: _clienteId,
          metodoPago: _metodo,
          descuento: double.tryParse(_descuento.text) ?? 0,
          notas: _notas.text,
          lineas: [
            SaleLine(
              serviceId: servicio.id,
              serviceName: servicio.nombre,
              precio: servicio.precio,
              cantidad: 1,
            ),
          ],
        );
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Venta registrada')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final servicios = ref.watch(activeServicesProvider);
    final operarias =
        ref.watch(operariasProvider).where((o) => o.activa).toList();
    final clientes = ref.watch(clientsProvider);
    final viewInsets = MediaQuery.viewInsetsOf(context).bottom;

    final servicio = _servicioId == null
        ? null
        : ref.read(servicesProvider.notifier).byId(_servicioId!);
    final descuento = double.tryParse(_descuento.text) ?? 0;
    final total = ((servicio?.precio ?? 0) - descuento).clamp(0, double.infinity);

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20 + viewInsets),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Registrar venta',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                initialValue: _servicioId,
                decoration: const InputDecoration(labelText: 'Servicio'),
                items: servicios
                    .map(
                      (s) => DropdownMenuItem(
                        value: s.id,
                        child: Text(
                          '${s.nombre}  ·  Bs ${s.precio.toStringAsFixed(0)}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _servicioId = v),
                validator: (v) =>
                    v == null ? 'Selecciona un servicio' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                initialValue: _operariaId,
                decoration: const InputDecoration(labelText: 'Operaria'),
                items: operarias
                    .map(
                      (o) => DropdownMenuItem(
                        value: o.id,
                        child: Text(o.nombreCompleto),
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
                      child: Text(c.nombreCompleto),
                    ),
                  ),
                ],
                onChanged: (v) => setState(() => _clienteId = v),
              ),
              const SizedBox(height: 12),
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
              TextFormField(
                controller: _descuento,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Descuento (Bs)',
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
