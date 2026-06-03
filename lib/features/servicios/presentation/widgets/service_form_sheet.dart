import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/atoms/pill_button.dart';
import '../providers/services_provider.dart';

class ServiceFormSheet extends ConsumerStatefulWidget {
  const ServiceFormSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const ServiceFormSheet(),
    );
  }

  @override
  ConsumerState<ServiceFormSheet> createState() => _ServiceFormSheetState();
}

class _ServiceFormSheetState extends ConsumerState<ServiceFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _precio = TextEditingController(text: '200');
  final _duracion = TextEditingController(text: '60');
  final _descripcion = TextEditingController();
  String _categoria = 'Pestañas';
  bool _activo = true;

  static const _categorias = ['Pestañas', 'Cejas', 'Uñas', 'Otros'];

  @override
  void dispose() {
    _nombre.dispose();
    _precio.dispose();
    _duracion.dispose();
    _descripcion.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    ref.read(servicesProvider.notifier).add(
          nombre: _nombre.text,
          categoria: _categoria,
          precio: double.parse(_precio.text),
          duracionMinutos: int.parse(_duracion.text),
          descripcion: _descripcion.text,
          activo: _activo,
        );
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Servicio "${_nombre.text}" agregado')),
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
                'Nuevo servicio',
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
              DropdownButtonFormField<String>(
                initialValue: _categoria,
                decoration: const InputDecoration(labelText: 'Categoría'),
                items: _categorias
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setState(() => _categoria = v ?? _categoria),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _precio,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Precio (Bs)',
                      ),
                      validator: (v) {
                        final n = double.tryParse(v ?? '');
                        if (n == null || n < 0) return 'Inválido';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
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
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descripcion,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Descripción (opcional)',
                ),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Activo'),
                value: _activo,
                onChanged: (v) => setState(() => _activo = v),
              ),
              const SizedBox(height: 8),
              PillButton(
                label: 'Agregar servicio',
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
