import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/pill_button.dart';
import '../../../clientes/presentation/providers/clients_provider.dart';
import '../../../operarias/presentation/providers/operarias_provider.dart';
import '../providers/appointments_provider.dart';

class AppointmentFormSheet extends ConsumerStatefulWidget {
  const AppointmentFormSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const AppointmentFormSheet(),
    );
  }

  @override
  ConsumerState<AppointmentFormSheet> createState() =>
      _AppointmentFormSheetState();
}

class _AppointmentFormSheetState extends ConsumerState<AppointmentFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _servicio = TextEditingController(text: 'Pestañas clásicas');
  final _precio = TextEditingController(text: '220');
  final _duracion = TextEditingController(text: '90');
  final _notas = TextEditingController();

  int? _clienteId;
  int? _operariaId;
  DateTime _fecha = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _hora = const TimeOfDay(hour: 10, minute: 0);

  @override
  void dispose() {
    _servicio.dispose();
    _precio.dispose();
    _duracion.dispose();
    _notas.dispose();
    super.dispose();
  }

  Future<void> _pickFecha() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fecha,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('es'),
    );
    if (picked != null) setState(() => _fecha = picked);
  }

  Future<void> _pickHora() async {
    final picked = await showTimePicker(context: context, initialTime: _hora);
    if (picked != null) setState(() => _hora = picked);
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    if (_clienteId == null || _operariaId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona cliente y operaria')),
      );
      return;
    }
    final fechaHora = DateTime(
      _fecha.year,
      _fecha.month,
      _fecha.day,
      _hora.hour,
      _hora.minute,
    );
    ref.read(appointmentsProvider.notifier).add(
          clienteId: _clienteId!,
          operariaId: _operariaId!,
          servicio: _servicio.text,
          fechaHora: fechaHora,
          duracionMinutos: int.parse(_duracion.text),
          precio: double.parse(_precio.text),
          notas: _notas.text,
        );
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cita agendada')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final clientes = ref.watch(clientsProvider);
    final operarias = ref.watch(operariasProvider);
    final viewInsets = MediaQuery.viewInsetsOf(context).bottom;
    final fechaLabel = DateFormat("d 'de' MMMM yyyy", 'es').format(_fecha);
    final horaLabel = _hora.format(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20 + viewInsets),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nueva cita',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                initialValue: _clienteId,
                decoration: const InputDecoration(labelText: 'Cliente'),
                items: clientes
                    .map(
                      (c) => DropdownMenuItem(
                        value: c.id,
                        child: Text(c.nombreCompleto),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _clienteId = v),
                validator: (v) => v == null ? 'Selecciona un cliente' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                initialValue: _operariaId,
                decoration: const InputDecoration(labelText: 'Operaria'),
                items: operarias
                    .where((o) => o.activa)
                    .map(
                      (o) => DropdownMenuItem(
                        value: o.id,
                        child: Text(
                          '${o.nombreCompleto} · ${o.especialidad}',
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
              TextFormField(
                controller: _servicio,
                decoration: const InputDecoration(labelText: 'Servicio'),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _pickFecha,
                      icon: const Icon(Icons.calendar_today),
                      label: Text(
                        fechaLabel,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _pickHora,
                      icon: const Icon(Icons.schedule),
                      label: Text(horaLabel),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _duracion,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Duración (min)',
                      ),
                      validator: (v) {
                        final n = int.tryParse(v ?? '');
                        if (n == null || n <= 0) return '> 0';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _precio,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'Precio (Bs)'),
                      validator: (v) {
                        final n = double.tryParse(v ?? '');
                        if (n == null || n < 0) return 'Inválido';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _notas,
                maxLines: 2,
                decoration:
                    const InputDecoration(labelText: 'Notas (opcional)'),
              ),
              const SizedBox(height: 20),
              PillButton(
                label: 'Agendar cita',
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
