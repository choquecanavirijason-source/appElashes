import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/atoms/pill_button.dart';
import '../../data/models/client_dto.dart';
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
  final _telefono = TextEditingController(text: '+591');
  final _edad = TextEditingController();
  final _email = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nombre.dispose();
    _apellido.dispose();
    _telefono.dispose();
    _edad.dispose();
    _email.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final telefonoVal = _telefono.text.trim();
    final emailVal = _email.text.trim();

    final input = ClientCreateDto(
      name: _nombre.text.trim(),
      lastName: _apellido.text.trim(),
      age: _edad.text.trim().isEmpty ? null : int.tryParse(_edad.text.trim()),
      phone: telefonoVal.isEmpty ? null : telefonoVal,
      email: emailVal.isEmpty ? null : emailVal,
    );

    try {
      await ref.read(clientsListProvider.notifier).createClient(input);
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${input.name} ${input.lastName} registrado'),
          ),
        );
      }
    } on ApiException catch (e) {
      developer.log('Error al crear cliente', name: 'clientes', error: e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } catch (e, st) {
      developer.log(
        'Error inesperado al crear cliente',
        name: 'clientes',
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
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(labelText: 'Nombre *'),
                validator: (v) =>
                    v == null || v.trim().length < 2 ? 'Mínimo 2 caracteres' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _apellido,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(labelText: 'Apellido *'),
                validator: (v) =>
                    v == null || v.trim().length < 2 ? 'Mínimo 2 caracteres' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _telefono,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Teléfono',
                        hintText: '+59171234567',
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _edad,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Edad'),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return null;
                        final n = int.tryParse(v.trim());
                        if (n == null || n < 1 || n > 100) return '1–100';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email (opcional)'),
              ),
              const SizedBox(height: 24),
              PillButton(
                label: _isLoading ? 'Guardando…' : 'Registrar cliente',
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
