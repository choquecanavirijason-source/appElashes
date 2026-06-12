import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/role_dto.dart';
import '../../data/roles_repository_impl.dart';
import '../providers/roles_provider.dart';

// ─── Módulos del panel web con sus permisos ────────────────────────────────────

class _PermModule {
  const _PermModule({
    required this.label,
    required this.icon,
    required this.color,
    required this.viewPerm,
    this.managePerm,
    this.viewLabel = 'Ver',
    this.manageLabel = 'Gestionar',
  });

  final String label;
  final IconData icon;
  final Color color;
  final String viewPerm;
  final String? managePerm;
  final String viewLabel;
  final String manageLabel;
}

const _modules = [
  _PermModule(
    label: 'Clientes',
    icon: Icons.people_outline,
    color: AppColors.statusReserva,
    viewPerm: 'clients:view',
    managePerm: 'clients:manage',
    viewLabel: 'Ver listado',
    manageLabel: 'Crear / editar',
  ),
  _PermModule(
    label: 'Citas / Agenda',
    icon: Icons.calendar_today_outlined,
    color: AppColors.statusEnServicio,
    viewPerm: 'appointments:view',
    managePerm: 'appointments:manage',
    viewLabel: 'Ver agenda',
    manageLabel: 'Crear / modificar citas',
  ),
  _PermModule(
    label: 'Pagos',
    icon: Icons.payments_outlined,
    color: AppColors.onlineGreen,
    viewPerm: 'payments:view',
    managePerm: 'payments:manage',
    viewLabel: 'Ver historial',
    manageLabel: 'Registrar cobros',
  ),
  _PermModule(
    label: 'Servicios',
    icon: Icons.spa_outlined,
    color: AppColors.goldAccent,
    viewPerm: 'services:view',
    managePerm: 'services:manage',
    viewLabel: 'Ver catálogo',
    manageLabel: 'Crear / editar servicios',
  ),
  _PermModule(
    label: 'Inventario',
    icon: Icons.inventory_2_outlined,
    color: AppColors.statusEnEspera,
    viewPerm: 'inventory:view',
    managePerm: 'inventory:manage',
    viewLabel: 'Ver stock',
    manageLabel: 'Gestionar productos',
  ),
  _PermModule(
    label: 'Sucursales',
    icon: Icons.store_outlined,
    color: AppColors.brandAccent,
    viewPerm: 'branches:view',
    managePerm: 'branches:manage',
    viewLabel: 'Ver sucursales',
    manageLabel: 'Crear / administrar',
  ),
  _PermModule(
    label: 'Catálogos',
    icon: Icons.category_outlined,
    color: Color(0xFF818CF8),
    viewPerm: 'catalog:view',
    managePerm: 'catalog:manage',
    viewLabel: 'Ver catálogos',
    manageLabel: 'Editar catálogos',
  ),
  _PermModule(
    label: 'Formularios',
    icon: Icons.assignment_outlined,
    color: Color(0xFFF472B6),
    viewPerm: 'forms:view',
    managePerm: 'forms:manage',
    viewLabel: 'Ver formularios',
    manageLabel: 'Crear / editar',
  ),
  _PermModule(
    label: 'Configuración',
    icon: Icons.settings_outlined,
    color: Color(0xFF9CA3AF),
    viewPerm: 'settings:view',
    viewLabel: 'Acceder a ajustes',
  ),
];

// ─── Screen ───────────────────────────────────────────────────────────────────

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
        onPressed: () => _RoleFormSheet.show(context),
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
            itemBuilder: (_, i) => _RoleCard(role: roles[i]),
          );
        },
      ),
    );
  }
}

// ─── Role card ────────────────────────────────────────────────────────────────

class _RoleCard extends ConsumerWidget {
  const _RoleCard({required this.role});

  final Role role;

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Cabecera ────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 8, 10),
            child: Row(
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
                PopupMenuButton<_CardAction>(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Color(0xFF6B7280),
                    size: 20,
                  ),
                  onSelected: (action) {
                    switch (action) {
                      case _CardAction.edit:
                        _RoleFormSheet.show(context, existing: role);
                      case _CardAction.delete:
                        _confirmDelete(context, ref);
                    }
                  },
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: _CardAction.edit,
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined, size: 18),
                          SizedBox(width: 10),
                          Text('Editar permisos'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: _CardAction.delete,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            size: 18,
                            color: Colors.redAccent,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Eliminar',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ── Permisos ─────────────────────────────────────────────────
          if (role.permissions.isNotEmpty) ...[
            const Divider(height: 1, color: AppColors.darkCardElevated),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final perm in role.permissions)
                    _PermChip(permission: perm),
                ],
              ),
            ),
          ] else
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: Row(
                children: [
                  const Icon(
                    Icons.block_outlined,
                    size: 13,
                    color: Color(0xFF4B5563),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Sin acceso al panel web',
                    style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => _RoleFormSheet.show(context, existing: role),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.brandAccent,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Asignar permisos',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

enum _CardAction { edit, delete }

// ─── Permission chip ──────────────────────────────────────────────────────────

class _PermChip extends StatelessWidget {
  const _PermChip({required this.permission});

  final String permission;

  static Color _colorFor(String p) {
    if (p.startsWith('clients')) return AppColors.statusReserva;
    if (p.startsWith('payments')) return AppColors.onlineGreen;
    if (p.startsWith('appointments')) return AppColors.statusEnServicio;
    if (p.startsWith('inventory')) return AppColors.statusEnEspera;
    if (p.startsWith('services')) return AppColors.goldAccent;
    if (p.startsWith('branches')) return AppColors.brandAccent;
    if (p.startsWith('catalog')) return const Color(0xFF818CF8);
    if (p.startsWith('forms')) return const Color(0xFFF472B6);
    return const Color(0xFF6B7280);
  }

  static String _labelFor(String p) {
    final module = _modules.where(
      (m) => m.viewPerm == p || m.managePerm == p,
    ).firstOrNull;
    if (module == null) return p;
    final isManage = p.endsWith(':manage');
    return '${module.label} · ${isManage ? module.manageLabel : module.viewLabel}';
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorFor(permission);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        _labelFor(permission),
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ─── Form sheet (crear y editar) ──────────────────────────────────────────────

class _RoleFormSheet extends ConsumerStatefulWidget {
  const _RoleFormSheet({this.existing});

  final Role? existing;

  static void show(BuildContext context, {Role? existing}) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.darkCardElevated,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _RoleFormSheet(existing: existing),
    );
  }

  @override
  ConsumerState<_RoleFormSheet> createState() => _RoleFormSheetState();
}

class _RoleFormSheetState extends ConsumerState<_RoleFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _descCtrl;
  late final Set<String> _selectedPerms;
  bool _saving = false;

  bool get _isEditing => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;
    _nameCtrl = TextEditingController(text: existing?.name ?? '');
    _descCtrl = TextEditingController(text: existing?.description ?? '');
    _selectedPerms = Set<String>.from(existing?.permissions ?? []);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  void _togglePerm(String perm, bool? checked) {
    setState(() {
      if (checked == true) {
        _selectedPerms.add(perm);
      } else {
        _selectedPerms.remove(perm);
      }
    });
  }

  // Al activar :manage, activa también :view automáticamente
  void _toggleModule(_PermModule mod, bool? checked) {
    setState(() {
      if (checked == true) {
        _selectedPerms.add(mod.viewPerm);
        if (mod.managePerm != null) _selectedPerms.add(mod.managePerm!);
      } else {
        _selectedPerms.remove(mod.viewPerm);
        if (mod.managePerm != null) _selectedPerms.remove(mod.managePerm!);
      }
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      if (_isEditing) {
        await ref.read(rolesProvider.notifier).edit(
              widget.existing!.id,
              RoleUpdateDto(
                name: _nameCtrl.text.trim(),
                permissions: _selectedPerms.toList(),
                description:
                    _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim(),
              ),
            );
      } else {
        await ref.read(rolesProvider.notifier).add(
              RoleCreateDto(
                name: _nameCtrl.text.trim(),
                permissions: _selectedPerms.toList(),
                description:
                    _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim(),
              ),
            );
      }
      if (mounted) Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEditing ? 'Error al guardar' : 'Error al crear el rol'),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.88,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, scrollCtrl) => Form(
        key: _formKey,
        child: ListView(
          controller: scrollCtrl,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          children: [
            // ── Drag handle ──────────────────────────────────────────
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF374151),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // ── Header ───────────────────────────────────────────────
            Row(
              children: [
                Expanded(
                  child: Text(
                    _isEditing ? 'Editar rol' : 'Nuevo rol',
                    style: const TextStyle(
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
            // ── Nombre ───────────────────────────────────────────────
            TextFormField(
              controller: _nameCtrl,
              decoration: _inputDec('Nombre del rol'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Ingresa el nombre' : null,
            ),
            const SizedBox(height: 12),
            // ── Descripción ──────────────────────────────────────────
            TextFormField(
              controller: _descCtrl,
              decoration: _inputDec('Descripción (opcional)'),
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            // ── Permisos ─────────────────────────────────────────────
            const _SectionLabel('ACCESO AL PANEL WEB'),
            const SizedBox(height: 4),
            const Text(
              'Define qué secciones puede ver y administrar este rol.',
              style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
            ),
            const SizedBox(height: 14),
            for (final mod in _modules) _ModuleRow(
              mod: mod,
              selectedPerms: _selectedPerms,
              onTogglePerm: _togglePerm,
              onToggleAll: _toggleModule,
            ),
            const SizedBox(height: 24),
            // ── Guardar ──────────────────────────────────────────────
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
                    : Text(
                        _isEditing ? 'Guardar cambios' : 'Crear rol',
                        style: const TextStyle(fontWeight: FontWeight.w700),
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

// ─── Fila de módulo con toggles ───────────────────────────────────────────────

class _ModuleRow extends StatelessWidget {
  const _ModuleRow({
    required this.mod,
    required this.selectedPerms,
    required this.onTogglePerm,
    required this.onToggleAll,
  });

  final _PermModule mod;
  final Set<String> selectedPerms;
  final void Function(String perm, bool? val) onTogglePerm;
  final void Function(_PermModule mod, bool? val) onToggleAll;

  @override
  Widget build(BuildContext context) {
    final hasView = selectedPerms.contains(mod.viewPerm);
    final hasManage =
        mod.managePerm != null && selectedPerms.contains(mod.managePerm!);
    final allSelected = hasView && (mod.managePerm == null || hasManage);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasView
              ? mod.color.withValues(alpha: 0.3)
              : AppColors.darkCardElevated,
        ),
      ),
      child: Column(
        children: [
          // Cabecera del módulo
          InkWell(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            onTap: () => onToggleAll(mod, !allSelected),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: mod.color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(mod.icon, color: mod.color, size: 16),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      mod.label,
                      style: TextStyle(
                        color: hasView ? Colors.white : const Color(0xFF6B7280),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Switch(
                    value: allSelected,
                    onChanged: (v) => onToggleAll(mod, v),
                    activeThumbColor: mod.color,
                    activeTrackColor: mod.color.withValues(alpha: 0.35),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ),
          ),
          // Permisos individuales (solo si el módulo tiene alguno activo)
          if (hasView && mod.managePerm != null) ...[
            Divider(
              height: 1,
              color: mod.color.withValues(alpha: 0.15),
              indent: 14,
              endIndent: 14,
            ),
            _PermToggleRow(
              label: mod.viewLabel,
              sublabel: 'Solo lectura',
              perm: mod.viewPerm,
              color: mod.color,
              selected: hasView,
              onChanged: (v) {
                // Al desactivar ver, desactiva también gestionar
                if (v == false && mod.managePerm != null) {
                  onTogglePerm(mod.managePerm!, false);
                }
                onTogglePerm(mod.viewPerm, v);
              },
            ),
            _PermToggleRow(
              label: mod.manageLabel,
              sublabel: 'Lectura + escritura',
              perm: mod.managePerm!,
              color: mod.color,
              selected: hasManage,
              onChanged: (v) {
                // Al activar gestionar, activa también ver
                if (v == true) onTogglePerm(mod.viewPerm, true);
                onTogglePerm(mod.managePerm!, v);
              },
            ),
          ],
        ],
      ),
    );
  }
}

class _PermToggleRow extends StatelessWidget {
  const _PermToggleRow({
    required this.label,
    required this.sublabel,
    required this.perm,
    required this.color,
    required this.selected,
    required this.onChanged,
  });

  final String label;
  final String sublabel;
  final String perm;
  final Color color;
  final bool selected;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: color,
      checkColor: Colors.black,
      value: selected,
      onChanged: onChanged,
      title: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : const Color(0xFF6B7280),
          fontSize: 13,
          fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
        ),
      ),
      subtitle: Text(
        sublabel,
        style: const TextStyle(color: Color(0xFF4B5563), fontSize: 11),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF6B7280),
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}
