import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../citas/presentation/providers/appointments_provider.dart';
import '../../../clientes/presentation/providers/clients_provider.dart';
import '../../../mensajes/presentation/providers/messages_provider.dart';
import '../../../operarias/presentation/providers/operarias_provider.dart';

class InicioTab extends ConsumerWidget {
  const InicioTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientes = ref.watch(clientsProvider);
    final operarias = ref.watch(operariasProvider);
    final citasHoy = ref.watch(citasHoyProvider);
    final proximas = ref.watch(proximasCitasProvider);
    final hilos = ref.watch(whatsappThreadsProvider);

    final enLinea = operarias.where((o) => o.enLinea).length;
    final mensajesPendientes = hilos.where((t) {
      if (t.mensajes.isEmpty) return false;
      return t.mensajes.last.sender.name == 'client';
    }).length;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
          children: [
            const SizedBox(height: 8),
            const Text(
              'Inicio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
            _HeroCard(citasHoy: citasHoy.length),
            const SizedBox(height: 24),
            const _SectionLabel('RESUMEN'),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.4,
              children: [
                _KpiCard(
                  icon: Icons.calendar_today_outlined,
                  iconBg: AppColors.iconBgTeal,
                  iconColor: AppColors.statusAtendido,
                  value: '${citasHoy.length}',
                  label: 'Citas hoy',
                ),
                _KpiCard(
                  icon: Icons.people_outline,
                  iconBg: AppColors.iconBgGreen,
                  iconColor: AppColors.onlineGreen,
                  value: '${clientes.length}',
                  label: 'Clientas',
                ),
                _KpiCard(
                  icon: Icons.groups_outlined,
                  iconBg: AppColors.iconBgAmber,
                  iconColor: AppColors.goldAccent,
                  value: '$enLinea',
                  label: 'En línea',
                ),
                _KpiCard(
                  icon: Icons.chat_bubble_outline,
                  iconBg: AppColors.iconBgOrange,
                  iconColor: const Color(0xFFF97316),
                  value: '$mensajesPendientes',
                  label: 'Mensajes',
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Expanded(child: _SectionLabel('PRÓXIMAS CITAS')),
                if (proximas.isNotEmpty)
                  Text(
                    '${proximas.length}',
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            if (proximas.isEmpty)
              const _EmptyCard(
                icon: Icons.calendar_today_outlined,
                message: 'No hay citas programadas.',
              )
            else
              ...proximas.take(5).map(
                    (cita) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _CitaCard(citaId: cita.id),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// ─── Hero ────────────────────────────────────────────────────────────────────

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.citasHoy});

  final int citasHoy;

  @override
  Widget build(BuildContext context) {
    final fecha =
        DateFormat("EEEE d 'de' MMMM", 'es').format(DateTime.now());
    final fechaCap = fecha[0].toUpperCase() + fecha.substring(1);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.brandPrimary, Color(0xFF0D5C3A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fechaCap,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            citasHoy == 0
                ? 'Sin citas hoy'
                : '$citasHoy ${citasHoy == 1 ? 'cita' : 'citas'} programadas',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(
                Icons.store_outlined,
                size: 13,
                color: Colors.white60,
              ),
              const SizedBox(width: 5),
              const Expanded(
                child: Text(
                  'eLashes · Todas las sucursales',
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'HOY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── KPI card ────────────────────────────────────────────────────────────────

class _KpiCard extends StatelessWidget {
  const _KpiCard({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Cita card ───────────────────────────────────────────────────────────────

class _CitaCard extends ConsumerWidget {
  const _CitaCard({required this.citaId});

  final int citaId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final citas = ref.watch(appointmentsProvider);
    final cita = citas.firstWhere((c) => c.id == citaId);
    final cliente = ref.watch(clientByIdProvider(cita.clienteId));

    final clienteNombre = cliente?.nombreCompleto ?? 'Cliente';
    final iniciales = cliente?.iniciales ?? '??';
    final hora = DateFormat('HH:mm').format(cita.fechaHora);
    final dia = DateFormat('EEE d MMM', 'es').format(cita.fechaHora);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Row(
        children: [
          InitialsAvatar(
            initials: iniciales,
            size: 46,
            backgroundColor: AppColors.avatarOlive,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clienteNombre,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  cita.servicio,
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                _StatusPill(
                  label: cita.estado.label,
                  color: cita.estado.color,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                hora,
                style: const TextStyle(
                  color: AppColors.brandAccent,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                dia,
                style: const TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 6, color: color),
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

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF4B5563), size: 36),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
