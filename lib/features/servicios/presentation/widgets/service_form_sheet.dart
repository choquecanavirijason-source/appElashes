import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/atoms/pill_button.dart';
import '../../data/models/service_dto.dart';
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
  bool _isLoading = false;

  @override
  void dispose() {
    _nombre.dispose();
    _precio.dispose();
    _duracion.dispose();
    _descripcion.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final descVal = _descripcion.text.trim();
    final input = ServiceCreateDto(
      name: _nombre.text.trim(),
      durationMinutes: int.parse(_duracion.text.trim()),
      price: double.parse(_precio.text.trim()),
      description: descVal.isEmpty ? null : descVal,
    );

    try {
      await ref.read(servicesListProvider.notifier).createService(input);
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Servicio "${input.name}" agregado')),
        );
      }
    } on ApiException catch (e) {
      developer.log('Error al crear servicio', name: 'servicios', error: e);
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    } catch (e, st) {
      developer.log(
        'Error inesperado al crear servicio',
        name: 'servicios',
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
                'Nuevo servicio',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nombre,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(labelText: 'Nombre *'),
                validator: (v) =>
                    v == null || v.trim().length < 2 ? 'Mínimo 2 caracteres' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _precio,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Precio (Bs) *'),
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
                      decoration: const InputDecoration(labelText: 'Duración (min) *'),
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
              const SizedBox(height: 20),
              PillButton(
                label: _isLoading ? 'Guardando…' : 'Agregar servicio',
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
