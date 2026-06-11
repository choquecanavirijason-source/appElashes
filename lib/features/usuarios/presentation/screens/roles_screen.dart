import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/role_dto.dart';
import '../../data/roles_repository_impl.dart';
import '../providers/roles_provider.dart';

// Permisos válidos del sistema
const _allPermissions = [
  'clients:view',
  'clients:manage',
  'catalog:view',
  'catalog:manage',
  'services:view',
  'services:manage',
  'payments:view',
  'payments:manage',
  'appointments:view',
  'appointments:manage',
  'inventory:view',
  'inventory:manage',
  'branches:view',
  'branches:manage',
  'forms:view',
  'forms:manage',
  'settings:view',
];

class RolesScreen extends ConsumerWidget {
  const RolesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRoles = ref.watch(rolesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Roles y permisos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(rolesProvider.notifier).refresh(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateSheet(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Nuevo rol'),
        backgroundColor: AppColors.brandPrimary,
        foregroundColor: Colors.white,
      ),
      body: AsyncValueView<List<Role>>(
        value: asyncRoles,
        onRetry: () => ref.invalidate(rolesProvider),
        builder: (roles) {
          if (roles.isEmpty) {
            return const EmptyState(
              icon: Icons.admin_panel_settings_outlined,
              title: 'Sin roles',
              message: 'Crea el primer rol para asignarlo al equipo.',
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
            itemCount: roles.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, i) => _RoleCard(
              role: roles[i],
              onDelete: () => _confirmDelete(context, ref, roles[i]),
            ),
          );
        },
      ),
    );
  }

  void _showCreateSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.darkCardElevated,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const _RoleFormSheet(),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    Role role,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar rol'),
        content: Text('¿Eliminar el rol "${role.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Eliminar',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(rolesProvider.notifier).remove(role.id);
    }
  }
}

// ─── Role card ────────────────────────────────────────────────────────────────

class _RoleCard extends StatelessWidget {
  const _RoleCard({required this.role, required this.onDelete});

  final Role role;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.brandPrimary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.shield_outlined,
                  color: AppColors.brandPrimary,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      role.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    if (role.description != null)
                      Text(
                        role.description!,
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  Icons.delete_outline,
                  color: Color(0xFF6B7280),
                  size: 20,
                ),
              ),
            ],
          ),
          if (role.permissions.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final perm in role.permissions)
                  _PermChip(permission: perm),
              ],
            ),
          ] else ...[
            const SizedBox(height: 6),
            const Text(
              'Sin permisos asignados',
              style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Permission chip ──────────────────────────────────────────────────────────

class _PermChip extends StatelessWidget {
  const _PermChip({required this.permission});

  final String permission;

  Color get _color {
    if (permission.startsWith('clients')) return AppColors.statusReserva;
    if (permission.startsWith('payments')) return AppColors.onlineGreen;
    if (permission.startsWith('appointments')) return AppColors.statusEnServicio;
    if (permission.startsWith('inventory')) return AppColors.statusEnEspera;
    if (permission.startsWith('services')) return AppColors.goldAccent;
    if (permission.startsWith('branches')) return AppColors.brandPrimary;
    return const Color(0xFF6B7280);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _color.withValues(alpha: 0.3)),
      ),
      child: Text(
        permission,
        style: TextStyle(
          color: _color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ─── Create form sheet ────────────────────────────────────────────────────────

class _RoleFormSheet extends ConsumerStatefulWidget {
  const _RoleFormSheet();

  @override
  ConsumerState<_RoleFormSheet> createState() => _RoleFormSheetState();
}

class _RoleFormSheetState extends ConsumerState<_RoleFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _selectedPerms = <String>{};
  bool _saving = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final dto = RoleCreateDto(
      name: _nameCtrl.text.trim(),
      permissions: _selectedPerms.toList(),
      description:
          _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim(),
    );
    try {
      await ref.read(rolesProvider.notifier).add(dto);
      if (mounted) Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al crear el rol')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, scrollController) => Form(
        key: _formKey,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
          children: [
            // Header
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Nuevo rol',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF6B7280)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Nombre
            TextFormField(
              controller: _nameCtrl,
              decoration: _inputDec('Nombre del rol'),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Ingresa el nombre'
                  : null,
            ),
            const SizedBox(height: 12),

            // Descripción
            TextFormField(
              controller: _descCtrl,
              decoration: _inputDec('Descripción (opcional)'),
              maxLines: 2,
            ),
            const SizedBox(height: 16),

            // Permisos
            const Text(
              'PERMISOS',
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            ..._allPermissions.map(
              (perm) => CheckboxListTile(
                dense: true,
                title: Text(
                  perm,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                value: _selectedPerms.contains(perm),
                activeColor: AppColors.brandPrimary,
                onChanged: (val) => setState(() {
                  if (val == true) {
                    _selectedPerms.add(perm);
                  } else {
                    _selectedPerms.remove(perm);
                  }
                }),
              ),
            ),
            const SizedBox(height: 20),

            // Botón guardar
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _saving ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandPrimary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _saving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Crear rol',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDec(String label) => InputDecoration(
        labelText: label,
        filled: true,
        fillColor: AppColors.darkCard,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkCardElevated),
        ),
      );
}
