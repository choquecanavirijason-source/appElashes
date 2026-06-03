import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/atoms/pill_button.dart';
import '../providers/clients_provider.dart';

class ClientFormSheet extends ConsumerStatefulWidget {
  const ClientFormSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const ClientFormSheet(),
    );
  }

  @override
  ConsumerState<ClientFormSheet> createState() => _ClientFormSheetState();
}

class _ClientFormSheetState extends ConsumerState<ClientFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _apellido = TextEditingController();
  final _telefono = TextEditingController(text: '+591 ');
  final _edad = TextEditingController();
  final _email = TextEditingController();
  final _notas = TextEditingController();
  String _tipoOjo = 'Almendrados';

  static const _tipos = ['Almendrados', 'Redondos', 'Caídos', 'Asiáticos'];

  @override
  void dispose() {
    _nombre.dispose();
    _apellido.dispose();
    _telefono.dispose();
    _edad.dispose();
    _email.dispose();
    _notas.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    ref.read(clientsProvider.notifier).add(
          nombre: _nombre.text,
          apellido: _apellido.text,
          telefono: _telefono.text,
          edad: int.parse(_edad.text),
          tipoOjo: _tipoOjo,
          email: _email.text,
          notas: _notas.text,
        );
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cliente "${_nombre.text}" registrado')),
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
                'Nuevo cliente',
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
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _telefono,
                      keyboardType: TextInputType.phone,
                      decoration:
                          const InputDecoration(labelText: 'Teléfono'),
                      validator: (v) => v == null || v.trim().length < 8
                          ? 'Mínimo 8 dígitos'
                          : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _edad,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Edad'),
                      validator: (v) {
                        final n = int.tryParse(v ?? '');
                        if (n == null || n < 14 || n > 100) {
                          return '14–100';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _tipoOjo,
                decoration: const InputDecoration(labelText: 'Tipo de ojo'),
                items: _tipos
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) => setState(() => _tipoOjo = v ?? _tipoOjo),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    const InputDecoration(labelText: 'Email (opcional)'),
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
                label: 'Registrar cliente',
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
