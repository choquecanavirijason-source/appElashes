import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/enums/appointment_status.dart';
import '../../data/models/appointment_dto.dart';
import '../../domain/entities/appointment.dart';
import '../providers/appointments_provider.dart';

class RecepcionScreen extends ConsumerWidget {
  const RecepcionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appointmentsListProvider);
    final now = DateTime.now();
    final titulo = DateFormat("EEEE d 'de' MMMM", 'es').format(now);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recepción'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(appointmentsListProvider),
          ),
        ],
      ),
      body: AsyncValueView<List<Appointment>>(
        value: state,
        onRetry: () => ref.invalidate(appointmentsListProvider),
        builder: (citas) {
          final hoy = citas.where((c) => c.esHoy).toList()
            ..sort((a, b) => a.startTime.compareTo(b.startTime));

          final pendientes = hoy
              .where(
                (c) =>
                    c.status != AppointmentStatus.pagada &&
                    c.status != AppointmentStatus.cancelada &&
                    c.status != AppointmentStatus.noSePresento,
              )
              .length;

          return Column(
            children: [
              _DayHeader(
                label: titulo,
                total: hoy.length,
                pendientes: pendientes,
              ),
              if (hoy.isEmpty)
                const Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.event_busy_outlined,
                          size: 52,
                          color: Color(0xFF374151),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Sin citas para hoy',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
                    itemCount: hoy.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) =>
                        _AppointmentCard(appointment: hoy[i]),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

// ─── Cabecera del día ─────────────────────────────────────────────────────────

class _DayHeader extends StatelessWidget {
  const _DayHeader({
    required this.label,
    required this.total,
    required this.pendientes,
  });

  final String label;
  final int total;
  final int pendientes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFF1F2937))),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.statusEnEspera.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.storefront_outlined,
              size: 18,
              color: AppColors.statusEnEspera,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Agenda de hoy',
                  style: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.brandAccent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '$total cita${total == 1 ? '' : 's'}',
                  style: const TextStyle(
                    color: AppColors.brandAccent,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (pendientes > 0) ...[
                const SizedBox(height: 4),
                Text(
                  '$pendientes pendiente${pendientes == 1 ? '' : 's'}',
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 10,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Card de cita con acciones ────────────────────────────────────────────────

class _AppointmentCard extends ConsumerStatefulWidget {
  const _AppointmentCard({required this.appointment});

  final Appointment appointment;

  @override
  ConsumerState<_AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends ConsumerState<_AppointmentCard> {
  bool _loading = false;

  Future<void> _cambiarEstado(AppointmentStatus next) async {
    setState(() => _loading = true);
    try {
      await ref.read(appointmentsListProvider.notifier).editAppointment(
            widget.appointment.id,
            AppointmentUpdateDto(
              status: next.apiValue,
              skipAvailabilityCheck: true,
            ),
          );
    } on DioException catch (e) {
      final msg = e.error is ApiException
          ? (e.error as ApiException).message
          : 'Error al actualizar el estado';
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: AppColors.statusCancelado,
        ),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appt = widget.appointment;
    final status = appt.status;
    final hora = DateFormat('HH:mm', 'es').format(appt.startTime);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _borderColor(status)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila principal: hora + avatar + nombre + estado
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.goldAccent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    hora,
                    style: const TextStyle(
                      color: AppColors.goldAccent,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InitialsAvatar(
                  initials: _iniciales(appt.clientName),
                  size: 38,
                  statusColor: _statusDot(status),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appt.clientName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      if (appt.clientPhone != null)
                        Text(
                          appt.clientPhone!,
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ),
                _StatusChip(status: status),
              ],
            ),
            // Servicio y operaria
            if (appt.serviceName != null || appt.professionalName != null) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                children: [
                  if (appt.serviceName != null)
                    _InfoTag(
                      icon: Icons.spa_outlined,
                      label: appt.serviceName!,
                    ),
                  if (appt.professionalName != null)
                    _InfoTag(
                      icon: Icons.person_outline,
                      label: appt.professionalName!,
                    ),
                ],
              ),
            ],
            const SizedBox(height: 12),
            // Botones de acción
            if (_loading)
              const Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            else
              _ActionRow(
                status: status,
                onNext: _cambiarEstado,
                onNoShow: () =>
                    _cambiarEstado(AppointmentStatus.noSePresento),
              ),
          ],
        ),
      ),
    );
  }

  Color _borderColor(AppointmentStatus s) => switch (s) {
        AppointmentStatus.enServicio =>
          AppColors.statusEnServicio.withValues(alpha: 0.4),
        AppointmentStatus.enEspera =>
          AppColors.statusEnEspera.withValues(alpha: 0.4),
        AppointmentStatus.pagada =>
          AppColors.brandAccent.withValues(alpha: 0.3),
        AppointmentStatus.cancelada ||
        AppointmentStatus.noSePresento =>
          AppColors.statusCancelado.withValues(alpha: 0.3),
        _ => AppColors.darkCardElevated,
      };

  Color? _statusDot(AppointmentStatus s) => switch (s) {
        AppointmentStatus.enServicio => AppColors.statusEnServicio,
        AppointmentStatus.enEspera => AppColors.statusEnEspera,
        _ => null,
      };

  String _iniciales(String nombre) {
    final parts = nombre.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return nombre.substring(0, nombre.length >= 2 ? 2 : 1).toUpperCase();
  }
}

// ─── Botones de acción según estado ──────────────────────────────────────────

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.status,
    required this.onNext,
    required this.onNoShow,
  });

  final AppointmentStatus status;
  final void Function(AppointmentStatus) onNext;
  final VoidCallback onNoShow;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AppointmentStatus.pagada:
        return const Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 16,
              color: AppColors.brandAccent,
            ),
            SizedBox(width: 6),
            Text(
              'Completado y pagado',
              style: TextStyle(
                color: AppColors.brandAccent,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );

      case AppointmentStatus.cancelada:
        return const Row(
          children: [
            Icon(
              Icons.cancel_outlined,
              size: 16,
              color: AppColors.statusCancelado,
            ),
            SizedBox(width: 6),
            Text(
              'Cita cancelada',
              style: TextStyle(
                color: AppColors.statusCancelado,
                fontSize: 12,
              ),
            ),
          ],
        );

      case AppointmentStatus.noSePresento:
        return const Row(
          children: [
            Icon(
              Icons.person_off_outlined,
              size: 16,
              color: Color(0xFF6B7280),
            ),
            SizedBox(width: 6),
            Text(
              'No se presentó',
              style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
            ),
          ],
        );

      case AppointmentStatus.atendida:
        return SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: () => onNext(AppointmentStatus.pagada),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.statusPagado,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(Icons.payments_outlined, size: 18),
            label: const Text(
              'Registrar pago',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
          ),
        );

      default:
        final next = _nextStatus(status);
        final label = _nextLabel(status);
        final color = _nextColor(status);
        final showNoShow = status == AppointmentStatus.reserva ||
            status == AppointmentStatus.enEspera;

        return Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: next != null ? () => onNext(next) : null,
                style: FilledButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            if (showNoShow) ...[
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: onNoShow,
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF6B7280),
                  side: const BorderSide(color: Color(0xFF374151)),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('No vino', style: TextStyle(fontSize: 12)),
              ),
            ],
          ],
        );
    }
  }

  AppointmentStatus? _nextStatus(AppointmentStatus s) => switch (s) {
        AppointmentStatus.reserva => AppointmentStatus.enEspera,
        AppointmentStatus.enEspera => AppointmentStatus.enServicio,
        AppointmentStatus.enServicio => AppointmentStatus.atendida,
        _ => null,
      };

  String _nextLabel(AppointmentStatus s) => switch (s) {
        AppointmentStatus.reserva => 'Llegó — Check-in',
        AppointmentStatus.enEspera => 'Iniciar servicio',
        AppointmentStatus.enServicio => 'Servicio terminado',
        _ => '',
      };

  Color _nextColor(AppointmentStatus s) => switch (s) {
        AppointmentStatus.reserva => AppColors.statusEnEspera,
        AppointmentStatus.enEspera => AppColors.statusEnServicio,
        AppointmentStatus.enServicio => AppColors.statusAtendido,
        _ => AppColors.brandAccent,
      };
}

// ─── Widgets auxiliares ───────────────────────────────────────────────────────

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final AppointmentStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          color: status.color,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _InfoTag extends StatelessWidget {
  const _InfoTag({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: const Color(0xFF6B7280)),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
        ),
      ],
    );
  }
}
