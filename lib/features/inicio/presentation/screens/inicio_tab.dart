import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/atoms/status_badge.dart';
import '../../../../core/presentation/molecules/stat_card.dart';
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

    final operariasActivas = operarias.where((o) => o.activa).length;
    final mensajesPendientes = hilos.where((t) {
      if (t.mensajes.isEmpty) return false;
      return t.mensajes.last.sender.name == 'client';
    }).length;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        _Hero(citasHoy: citasHoy.length),
        const SizedBox(height: 20),
        Text(
          'Resumen',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.45,
          children: [
            StatCard(
              label: 'Citas hoy',
              value: '${citasHoy.length}',
              icon: Icons.calendar_today_outlined,
              accentColor: AppColors.brandPrimary,
            ),
            StatCard(
              label: 'Clientes',
              value: '${clientes.length}',
              icon: Icons.people_outline,
              accentColor: AppColors.statusReserva,
            ),
            StatCard(
              label: 'Operarias activas',
              value: '$operariasActivas',
              icon: Icons.face_retouching_natural,
              accentColor: AppColors.brandAccent,
            ),
            StatCard(
              label: 'Mensajes nuevos',
              value: '$mensajesPendientes',
              icon: Icons.chat_bubble_outline,
              accentColor: AppColors.statusEnEspera,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: Text(
                'Próximas citas',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Text(
              '${proximas.length}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (proximas.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'No hay citas programadas.',
              textAlign: TextAlign.center,
            ),
          )
        else
          ...proximas.take(5).map(
                (cita) => _ProximaCitaTile(citaId: cita.id),
              ),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.citasHoy});

  final int citasHoy;

  @override
  Widget build(BuildContext context) {
    final fecha = DateFormat("EEEE d 'de' MMMM", 'es').format(DateTime.now());
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.brandPrimary, AppColors.brandAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fecha[0].toUpperCase() + fecha.substring(1),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            citasHoy == 0
                ? 'Sin citas hoy ✨'
                : 'Tienes $citasHoy ${citasHoy == 1 ? 'cita' : 'citas'} hoy',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Salón Elashes · Sucursal Centro',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _ProximaCitaTile extends ConsumerWidget {
  const _ProximaCitaTile({required this.citaId});

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

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withValues(
                alpha: 0.5,
              ),
        ),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        leading: InitialsAvatar(initials: iniciales),
        title: Text(
          clienteNombre,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(cita.servicio),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              hora,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.brandPrimary,
              ),
            ),
            const SizedBox(height: 2),
            StatusBadge(
              label: cita.estado.label,
              color: cita.estado.color,
            ),
            const SizedBox(height: 2),
            Text(
              dia,
              style: const TextStyle(fontSize: 11, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
