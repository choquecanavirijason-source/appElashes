import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/atoms/pill_button.dart';
import '../../../../core/storage/prefs_storage.dart';
import '../../../clientes/presentation/providers/clients_provider.dart';
import '../../../operarias/presentation/providers/operarias_provider.dart';
import '../../data/models/appointment_dto.dart';
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
  final _duracion = TextEditingController(text: '90');

  int? _clienteId;
  int? _operariaId;
  DateTime _fecha = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _hora = const TimeOfDay(hour: 10, minute: 0);
  bool _isLoading = false;

  @override
  void dispose() {
    _duracion.dispose();
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

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_clienteId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona un cliente')),
      );
      return;
    }

    setState(() => _isLoading = true);

    final startTime = DateTime(
      _fecha.year,
      _fecha.month,
      _fecha.day,
      _hora.hour,
      _hora.minute,
    );
    final durMinutes = int.parse(_duracion.text);
    final endTime = startTime.add(Duration(minutes: durMinutes));
    final branchId = ref.read(prefsStorageProvider).selectedBranchId;

    final input = AppointmentCreateDto(
      clientId: _clienteId!,
      professionalId: _operariaId,
      branchId: branchId,
      startTime: startTime,
      endTime: endTime,
    );

    try {
      await ref
          .read(appointmentsListProvider.notifier)
          .createAppointment(input);
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cita agendada')),
        );
      }
    } on ApiException catch (e) {
      developer.log('Error al crear cita', name: 'citas', error: e);
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    } catch (e, st) {
      developer.log(
        'Error inesperado al crear cita',
        name: 'citas',
        error: e,
        stackTrace: st,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error inesperado. Intenta de nuevo.')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Real clients from backend
    final clientsAsync = ref.watch(clientsListProvider);
    // Operarias still from mock (pending step 5)
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
              // Client dropdown — from real backend
              clientsAsync.when(
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text(
                  'Error al cargar clientes',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                data: (clientes) => DropdownButtonFormField<int>(
                  initialValue: _clienteId,
                  decoration: const InputDecoration(labelText: 'Cliente *'),
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
              ),
              const SizedBox(height: 12),
              // Operaria dropdown — still mock until step 5
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
              TextFormField(
                controller: _duracion,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Duración (min)'),
                validator: (v) {
                  final n = int.tryParse(v ?? '');
                  if (n == null || n <= 0) return '> 0';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              PillButton(
                label: _isLoading ? 'Guardando…' : 'Agendar cita',
                onPressed: _isLoading ? null : _onSubmit,
                height: 52,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
