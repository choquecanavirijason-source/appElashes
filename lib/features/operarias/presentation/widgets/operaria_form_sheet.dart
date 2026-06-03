import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/atoms/pill_button.dart';
import '../providers/operarias_provider.dart';

class OperariaFormSheet extends ConsumerStatefulWidget {
  const OperariaFormSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const OperariaFormSheet(),
    );
  }

  @override
  ConsumerState<OperariaFormSheet> createState() => _OperariaFormSheetState();
}

class _OperariaFormSheetState extends ConsumerState<OperariaFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _apellido = TextEditingController();
  String _especialidad = 'Pestañas clásicas';
  double _calificacion = 4.5;
  bool _activa = true;

  static const _especialidades = [
    'Pestañas clásicas',
    'Pestañas volumen',
    'Pestañas híbridas',
    'Cejas y lifting',
    'Microblading',
    'Manicure',
  ];

  @override
  void dispose() {
    _nombre.dispose();
    _apellido.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    ref.read(operariasProvider.notifier).add(
          nombre: _nombre.text,
          apellido: _apellido.text,
          especialidad: _especialidad,
          calificacion: _calificacion,
          activa: _activa,
        );
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Operaria "${_nombre.text}" agregada')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.viewInsetsOf(context).bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20 + viewInsets),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nueva operaria',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nombre,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _apellido,
                decoration: const InputDecoration(labelText: 'Apellido'),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _especialidad,
                decoration: const InputDecoration(labelText: 'Especialidad'),
                items: _especialidades
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) =>
                    setState(() => _especialidad = v ?? _especialidad),
              ),
              const SizedBox(height: 16),
              Text(
                'Calificación: ${_calificacion.toStringAsFixed(1)} ★',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Slider(
                value: _calificacion,
                min: 1,
                max: 5,
                divisions: 8,
                label: _calificacion.toStringAsFixed(1),
                onChanged: (v) => setState(() => _calificacion = v),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Activa'),
                value: _activa,
                onChanged: (v) => setState(() => _activa = v),
              ),
              const SizedBox(height: 12),
              PillButton(
                label: 'Agregar operaria',
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
