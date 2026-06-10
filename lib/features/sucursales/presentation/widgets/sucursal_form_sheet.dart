import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/atoms/pill_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/branch_dto.dart';
import '../../domain/entities/sucursal.dart';
import '../providers/sucursales_provider.dart';

class SucursalFormSheet extends ConsumerStatefulWidget {
  const SucursalFormSheet({super.key, this.existing});

  final Sucursal? existing;

  static Future<void> show(BuildContext context, {Sucursal? existing}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => SucursalFormSheet(existing: existing),
    );
  }

  @override
  ConsumerState<SucursalFormSheet> createState() => _SucursalFormSheetState();
}

class _SucursalFormSheetState extends ConsumerState<SucursalFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _ciudad = TextEditingController();
  final _departamento = TextEditingController();
  final _direccion = TextEditingController();
  bool _loading = false;

  bool get _isEditing => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final s = widget.existing;
    if (s != null) {
      _nombre.text = s.nombre;
      _ciudad.text = s.ciudad ?? '';
      _departamento.text = s.departamento ?? '';
      _direccion.text = s.direccion ?? '';
    }
  }

  @override
  void dispose() {
    _nombre.dispose();
    _ciudad.dispose();
    _departamento.dispose();
    _direccion.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final nombre = _nombre.text.trim();
    final address = _direccion.text.trim().isEmpty ? null : _direccion.text.trim();
    final city = _ciudad.text.trim().isEmpty ? null : _ciudad.text.trim();
    final dept = _departamento.text.trim().isEmpty ? null : _departamento.text.trim();

    try {
      final notifier = ref.read(sucursalesListProvider.notifier);
      if (_isEditing) {
        await notifier.editSucursal(
          widget.existing!.id,
          BranchUpdateDto(name: nombre, address: address, city: city, department: dept),
        );
      } else {
        await notifier.createSucursal(
          BranchCreateDto(name: nombre, address: address, city: city, department: dept),
        );
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditing
                  ? 'Sucursal "$nombre" actualizada'
                  : 'Sucursal "$nombre" creada',
            ),
          ),
        );
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
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
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.iconBgOlive,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.store_outlined,
                      color: AppColors.goldAccent,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _isEditing ? 'Editar sucursal' : 'Nueva sucursal',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nombre,
                decoration: const InputDecoration(
                  labelText: 'Nombre *',
                  prefixIcon: Icon(Icons.store_outlined),
                ),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _ciudad,
                      decoration: const InputDecoration(
                        labelText: 'Ciudad',
                        prefixIcon: Icon(Icons.location_city_outlined),
                      ),
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _departamento,
                      decoration: const InputDecoration(
                        labelText: 'Departamento',
                        prefixIcon: Icon(Icons.map_outlined),
                      ),
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _direccion,
                decoration: const InputDecoration(
                  labelText: 'Dirección',
                  prefixIcon: Icon(Icons.pin_drop_outlined),
                ),
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 24),
              PillButton(
                label: _loading
                    ? (_isEditing ? 'Guardando…' : 'Creando…')
                    : (_isEditing ? 'Guardar cambios' : 'Crear sucursal'),
                onPressed: _loading ? null : _onSubmit,
                height: 52,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
