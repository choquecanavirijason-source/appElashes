import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/atoms/status_badge.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/operaria.dart';
import '../providers/operarias_provider.dart';
import '../widgets/operaria_form_sheet.dart';

class OperariasTab extends ConsumerWidget {
  const OperariasTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final operarias = ref.watch(operariasProvider);

    return Scaffold(
      body: operarias.isEmpty
          ? const EmptyState(
              icon: Icons.face_retouching_natural,
              title: 'Sin operarias',
              message: 'Agrega tu equipo para empezar.',
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
              itemCount: operarias.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) => _OperariaCard(operaria: operarias[i]),
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.brandPrimary,
        foregroundColor: Colors.white,
        onPressed: () => OperariaFormSheet.show(context),
        icon: const Icon(Icons.add),
        label: const Text('Nueva operaria'),
      ),
    );
  }
}

class _OperariaCard extends ConsumerWidget {
  const _OperariaCard({required this.operaria});

  final Operaria operaria;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withValues(
                alpha: 0.5,
              ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            InitialsAvatar(
              initials: operaria.iniciales,
              size: 52,
              colors: operaria.activa
                  ? const [AppColors.brandPrimary, AppColors.brandAccent]
                  : const [Color(0xFF94A3B8), Color(0xFFCBD5E1)],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    operaria.nombreCompleto,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    operaria.especialidad,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xFFFBBF24),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        operaria.calificacion.toStringAsFixed(1),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (operaria.diasDisponibles.isNotEmpty)
                        Expanded(
                          child: Text(
                            operaria.diasDisponibles.join(' · '),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              children: [
                StatusBadge(
                  label: operaria.activa ? 'Activa' : 'Inactiva',
                  color: operaria.activa
                      ? AppColors.brandAccent
                      : AppColors.statusReagendado,
                ),
                const SizedBox(height: 6),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  tooltip: operaria.activa ? 'Desactivar' : 'Activar',
                  onPressed: () => ref
                      .read(operariasProvider.notifier)
                      .toggleActiva(operaria.id),
                  icon: Icon(
                    operaria.activa
                        ? Icons.toggle_on
                        : Icons.toggle_off_outlined,
                    color: operaria.activa
                        ? AppColors.brandPrimary
                        : Colors.black45,
                    size: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
