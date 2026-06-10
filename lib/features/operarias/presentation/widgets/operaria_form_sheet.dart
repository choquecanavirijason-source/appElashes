import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/atoms/pill_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/operaria_dto.dart';
import '../../domain/entities/operaria.dart';
import '../providers/operarias_provider.dart';

class OperariaFormSheet extends ConsumerStatefulWidget {
  const OperariaFormSheet({super.key, this.existing});

  final Operaria? existing;

  static Future<void> show(BuildContext context, {Operaria? existing}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => OperariaFormSheet(existing: existing),
    );
  }

  @override
  ConsumerState<OperariaFormSheet> createState() => _OperariaFormSheetState();
}

class _OperariaFormSheetState extends ConsumerState<OperariaFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _phone = TextEditingController();
  bool _isActive = true;
  bool _obscurePassword = true;
  bool _loading = false;

  bool get _isEditing => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final s = widget.existing;
    if (s != null) {
      _username.text = s.username;
      _email.text = s.email ?? '';
      _phone.text = s.phone ?? '';
      _isActive = s.activa;
    }
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _phone.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final username = _username.text.trim();
    final email = _email.text.trim();
    final password = _password.text;
    final phone = _phone.text.trim().isEmpty ? null : _phone.text.trim();

    try {
      final notifier = ref.read(operariasListProvider.notifier);
      if (_isEditing) {
        await notifier.editOperaria(
          widget.existing!.id,
          OperariaUpdateDto(
            username: username,
            email: email,
            password: password.isEmpty ? null : password,
            phone: phone,
            isActive: _isActive,
          ),
        );
      } else {
        await notifier.createOperaria(
          OperariaCreateDto(
            username: username,
            email: email,
            password: password,
            phone: phone,
            isActive: _isActive,
          ),
        );
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditing
                  ? 'Cuenta "$username" actualizada'
                  : 'Cuenta "$username" creada',
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

  Future<void> _onDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar cuenta'),
        content: Text(
          '¿Seguro que deseas eliminar la cuenta "${widget.existing!.username}"?\nEsta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;
    setState(() => _loading = true);

    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final nombre = widget.existing!.username;

    try {
      await ref
          .read(operariasListProvider.notifier)
          .removeOperaria(widget.existing!.id);
      navigator.pop();
      messenger.showSnackBar(
        SnackBar(content: Text('Cuenta "$nombre" eliminada')),
      );
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
              Text(
                _isEditing ? 'Editar cuenta' : 'Nueva cuenta',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _username,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                textInputAction: TextInputAction.next,
                autocorrect: false,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Requerido';
                  if (!v.contains('@')) return 'Email inválido';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _password,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: _isEditing
                      ? 'Nueva contraseña (opcional)'
                      : 'Contraseña',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                textInputAction: TextInputAction.next,
                autocorrect: false,
                validator: (v) {
                  if (!_isEditing && (v == null || v.isEmpty)) {
                    return 'Requerido';
                  }
                  if (v != null && v.isNotEmpty && v.length < 6) {
                    return 'Mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _phone,
                decoration: const InputDecoration(
                  labelText: 'Teléfono (opcional)',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 4),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Cuenta activa'),
                value: _isActive,
                onChanged: (v) => setState(() => _isActive = v),
              ),
              const SizedBox(height: 12),
              PillButton(
                label: _loading
                    ? (_isEditing ? 'Guardando…' : 'Creando…')
                    : (_isEditing ? 'Guardar cambios' : 'Crear cuenta'),
                onPressed: _loading ? null : _onSubmit,
                height: 52,
              ),
              if (_isEditing) ...[
                const SizedBox(height: 8),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.offlineRed,
                  ),
                  onPressed: _loading ? null : _onDelete,
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('Eliminar cuenta'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
