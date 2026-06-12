import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/services/whatsapp_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/appointment.dart';
import '../providers/appointments_provider.dart';

class RecordatoriosScreen extends ConsumerStatefulWidget {
  const RecordatoriosScreen({super.key});

  @override
  ConsumerState<RecordatoriosScreen> createState() =>
      _RecordatoriosScreenState();
}

class _RecordatoriosScreenState extends ConsumerState<RecordatoriosScreen> {
  final Set<int> _enviados = {};

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appointmentsListProvider);
    final manana = _mananaDate();
    final fmt = DateFormat('EEEE d \'de\' MMMM', 'es');
    final titulo = fmt.format(manana);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordatorios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() => _enviados.clear());
              ref.invalidate(appointmentsListProvider);
            },
          ),
        ],
      ),
      body: AsyncValueView<List<Appointment>>(
        value: state,
        onRetry: () => ref.invalidate(appointmentsListProvider),
        builder: (citas) {
          final mananas = citas.where((c) => _esManana(c.startTime)).toList()
            ..sort((a, b) => a.startTime.compareTo(b.startTime));

          return Column(
            children: [
              _DateHeader(label: titulo, count: mananas.length),
              if (mananas.isEmpty)
                const Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.event_available_outlined,
                          size: 52,
                          color: Color(0xFF374151),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Sin citas para mañana',
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
                    itemCount: mananas.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) => _AppointmentReminderCard(
                      appointment: mananas[i],
                      enviado: _enviados.contains(mananas[i].id),
                      onEnviado: () =>
                          setState(() => _enviados.add(mananas[i].id)),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  static DateTime _mananaDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 1);
  }

  static bool _esManana(DateTime dt) {
    final m = _mananaDate();
    return dt.year == m.year && dt.month == m.month && dt.day == m.day;
  }
}

// ─── Cabecera de fecha ────────────────────────────────────────────────────────

class _DateHeader extends StatelessWidget {
  const _DateHeader({required this.label, required this.count});

  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF1F2937)),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.goldAccent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.calendar_today_outlined,
              size: 18,
              color: AppColors.goldAccent,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Citas de mañana',
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.brandAccent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$count cita${count == 1 ? '' : 's'}',
              style: const TextStyle(
                color: AppColors.brandAccent,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Card de cita con botón de recordatorio ───────────────────────────────────

class _AppointmentReminderCard extends StatelessWidget {
  const _AppointmentReminderCard({
    required this.appointment,
    required this.enviado,
    required this.onEnviado,
  });

  final Appointment appointment;
  final bool enviado;
  final VoidCallback onEnviado;

  String get _iniciales {
    final parts = appointment.clientName.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return appointment.clientName.substring(0, 2).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final hora = DateFormat('HH:mm', 'es').format(appointment.startTime);
    final fechaHora =
        DateFormat('dd/MM/yyyy HH:mm', 'es').format(appointment.startTime);
    final sinTelefono = appointment.clientPhone == null;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: enviado
              ? AppColors.brandAccent.withValues(alpha: 0.4)
              : AppColors.darkCardElevated,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InitialsAvatar(initials: _iniciales),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.clientName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      if (appointment.clientPhone != null)
                        Text(
                          appointment.clientPhone!,
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ),
                // Hora de la cita
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
              ],
            ),
            if (appointment.serviceName != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.spa_outlined,
                    size: 14,
                    color: Color(0xFF6B7280),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    appointment.serviceName!,
                    style: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 12),
            // Botón enviar recordatorio
            if (sinTelefono)
              const Row(
                children: [
                  Icon(
                    Icons.phone_disabled_outlined,
                    size: 14,
                    color: Color(0xFF4B5563),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Sin número de teléfono registrado',
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            else if (enviado)
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.brandAccent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 14,
                          color: AppColors.brandAccent,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Recordatorio enviado',
                          style: TextStyle(
                            color: AppColors.brandAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => _abrirWhatsApp(
                      context,
                      fechaHora: fechaHora,
                    ),
                    child: const Text(
                      'Reenviar',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            else
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => _abrirWhatsApp(
                    context,
                    fechaHora: fechaHora,
                    onDone: onEnviado,
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF25D366),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.chat_rounded, size: 18),
                  label: const Text(
                    'Enviar recordatorio',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _abrirWhatsApp(
    BuildContext context, {
    required String fechaHora,
    VoidCallback? onDone,
  }) async {
    await WhatsAppService.mostrarPlantillas(
      context: context,
      telefono: appointment.clientPhone!,
      nombreCliente: appointment.clientName,
      servicio: appointment.serviceName,
      fechaHora: fechaHora,
    );
    onDone?.call();
  }
}
