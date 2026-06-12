import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/operaria.dart';
import '../providers/operarias_provider.dart';
import '../widgets/operaria_form_sheet.dart';

class EquipoTab extends ConsumerWidget {
  const EquipoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(operariasListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(operariasListProvider),
          ),
        ],
      ),
      body: AsyncValueView<List<Operaria>>(
        value: state,
        onRetry: () => ref.invalidate(operariasListProvider),
        builder: (operarias) {
          final activas = operarias.where((o) => o.activa).toList();
          final inactivas = operarias.where((o) => !o.activa).toList();

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(operariasListProvider);
              await ref.read(operariasListProvider.future);
            },
            color: AppColors.brandAccent,
            backgroundColor: AppColors.darkCard,
            child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
            children: [
              const SizedBox(height: 12),
              Text(
                '${operarias.length} personas',
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(height: 16),
              _SectionHeader(
                color: AppColors.onlineGreen,
                label: 'Activas',
                count: activas.length,
              ),
              const SizedBox(height: 10),
              ...activas.map(
                (o) => Padding(
                  key: ValueKey('activa-${o.id}'),
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _MemberCard(key: ValueKey(o.id), operaria: o),
                ),
              ),
              if (inactivas.isNotEmpty) ...[
                const SizedBox(height: 8),
                _SectionHeader(
                  color: AppColors.offlineRed,
                  label: 'Inactivas',
                  count: inactivas.length,
                ),
                const SizedBox(height: 10),
                ...inactivas.map(
                  (o) => Padding(
                    key: ValueKey('inactiva-${o.id}'),
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _MemberCard(key: ValueKey(o.id), operaria: o),
                  ),
                ),
              ],
            ],
          ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.goldAccent,
        foregroundColor: Colors.black87,
        onPressed: () => OperariaFormSheet.show(context),
        icon: const Icon(Icons.person_add_outlined),
        label: const Text(
          'Nueva cuenta',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.color,
    required this.label,
    required this.count,
  });

  final Color color;
  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 10),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '$count',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _MemberCard extends ConsumerStatefulWidget {
  const _MemberCard({super.key, required this.operaria});

  final Operaria operaria;

  @override
  ConsumerState<_MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends ConsumerState<_MemberCard> {
  bool _toggling = false;

  Color get _rolColor {
    switch (widget.operaria.rol) {
      case 'Supervisora':
      case 'Admin':
        return AppColors.statusEnServicio;
      case 'Operaria':
        return AppColors.statusEnEspera;
      case 'Super Admin':
        return AppColors.goldAccent;
      default:
        return const Color(0xFF9CA3AF);
    }
  }

  Future<void> _toggle() async {
    final nueva = !widget.operaria.activa;
    setState(() => _toggling = true);
    try {
      await ref
          .read(operariasListProvider.notifier)
          .toggleActiva(widget.operaria.id, activa: nueva);
    } on DioException catch (e) {
      final msg = e.error is ApiException
          ? (e.error as ApiException).message
          : 'Error al cambiar estado';
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: AppColors.statusCancelado,
        ),
      );
    } finally {
      if (mounted) setState(() => _toggling = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final o = widget.operaria;
    final statusColor = o.activa ? AppColors.onlineGreen : AppColors.offlineRed;

    return Opacity(
      opacity: o.activa ? 1.0 : 0.65,
      child: Material(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => OperariaFormSheet.show(context, existing: o),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.darkCardElevated),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InitialsAvatar(
                      initials: o.iniciales,
                      size: 46,
                      backgroundColor: AppColors.avatarOlive,
                      statusColor: statusColor,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            o.nombreCompleto,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          if (o.email != null)
                            Text(
                              o.email!,
                              style: const TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 12,
                              ),
                            ),
                        ],
                      ),
                    ),
                    _StatusPill(activa: o.activa),
                    const SizedBox(width: 4),
                    if (_toggling)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.brandAccent,
                        ),
                      )
                    else
                      PopupMenuButton<_CardAction>(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Color(0xFF6B7280),
                          size: 20,
                        ),
                        onSelected: (action) {
                          switch (action) {
                            case _CardAction.edit:
                              OperariaFormSheet.show(context, existing: o);
                            case _CardAction.toggle:
                              _toggle();
                          }
                        },
                        itemBuilder: (_) => [
                          const PopupMenuItem(
                            value: _CardAction.edit,
                            child: Row(
                              children: [
                                Icon(Icons.edit_outlined, size: 18),
                                SizedBox(width: 10),
                                Text('Editar'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: _CardAction.toggle,
                            child: Row(
                              children: [
                                Icon(
                                  o.activa
                                      ? Icons.pause_circle_outline
                                      : Icons.play_circle_outline,
                                  size: 18,
                                  color: o.activa
                                      ? AppColors.statusEnEspera
                                      : AppColors.brandAccent,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  o.activa ? 'Deshabilitar' : 'Habilitar',
                                  style: TextStyle(
                                    color: o.activa
                                        ? AppColors.statusEnEspera
                                        : AppColors.brandAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _RoleChip(label: o.rol, color: _rolColor),
                    if (o.sucursal.isNotEmpty)
                      _SucursalChip(nombre: o.sucursal),
                    if (o.phone != null) _PhoneChip(phone: o.phone!),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _CardAction { edit, toggle }

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.activa});

  final bool activa;

  @override
  Widget build(BuildContext context) {
    final color = activa ? AppColors.onlineGreen : AppColors.offlineRed;
    final label = activa ? 'Activa' : 'Inactiva';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 7, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleChip extends StatelessWidget {
  const _RoleChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SucursalChip extends StatelessWidget {
  const _SucursalChip({required this.nombre});

  final String nombre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.iconBgOlive,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.store, size: 11, color: Color(0xFF9CA3AF)),
          const SizedBox(width: 4),
          Text(
            nombre,
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneChip extends StatelessWidget {
  const _PhoneChip({required this.phone});

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.iconBgOlive,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.phone, size: 11, color: Color(0xFF9CA3AF)),
          const SizedBox(width: 4),
          Text(
            phone,
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
