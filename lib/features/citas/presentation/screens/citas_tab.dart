import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/atoms/status_badge.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/appointment.dart';
import '../providers/appointments_provider.dart';
import '../widgets/appointment_form_sheet.dart';

class CitasTab extends ConsumerWidget {
  const CitasTab({super.key, this.mostrarAppBar = false});

  final bool mostrarAppBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appointmentsListProvider);

    return Scaffold(
      appBar: mostrarAppBar
          ? AppBar(
              title: const Text('Citas'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () => ref.invalidate(appointmentsListProvider),
                ),
              ],
            )
          : null,
      body: AsyncValueView<List<Appointment>>(
        value: state,
        onRetry: () => ref.invalidate(appointmentsListProvider),
        builder: (citas) => citas.isEmpty
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 48,
                      color: AppColors.brandPrimary,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Sin citas',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Agenda la primera cita con +',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              )
            : _GroupedAppointmentsList(citas: citas),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.brandPrimary,
        foregroundColor: Colors.white,
        onPressed: () => AppointmentFormSheet.show(context),
        icon: const Icon(Icons.add),
        label: const Text('Nueva cita'),
      ),
    );
  }
}

class _GroupedAppointmentsList extends StatelessWidget {
  const _GroupedAppointmentsList({required this.citas});

  final List<Appointment> citas;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hoy = DateTime(now.year, now.month, now.day);
    final manana = hoy.add(const Duration(days: 1));

    final hoyList = <Appointment>[];
    final mananaList = <Appointment>[];
    final futurasList = <Appointment>[];
    final pasadasList = <Appointment>[];

    for (final c in citas) {
      final d =
          DateTime(c.startTime.year, c.startTime.month, c.startTime.day);
      if (d == hoy) {
        hoyList.add(c);
      } else if (d == manana) {
        mananaList.add(c);
      } else if (d.isAfter(manana)) {
        futurasList.add(c);
      } else {
        pasadasList.add(c);
      }
    }

    final items = <_Item>[];
    void addGroup(String title, List<Appointment> data) {
      if (data.isEmpty) return;
      items.add(_Item.header(title));
      for (final c in data) {
        items.add(_Item.appointment(c));
      }
    }

    addGroup('Hoy', hoyList);
    addGroup('Mañana', mananaList);
    addGroup('Próximas', futurasList);
    addGroup('Pasadas', pasadasList);

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 88),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final item = items[i];
        if (item.isHeader) {
          return Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 4),
            child: Text(
              item.headerTitle!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.brandPrimary,
              ),
            ),
          );
        }
        return _AppointmentCard(cita: item.appointment!);
      },
    );
  }
}

class _Item {
  _Item.header(this.headerTitle)
      : appointment = null,
        isHeader = true;
  _Item.appointment(this.appointment)
      : headerTitle = null,
        isHeader = false;

  final String? headerTitle;
  final Appointment? appointment;
  final bool isHeader;
}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard({required this.cita});

  final Appointment cita;

  @override
  Widget build(BuildContext context) {
    final hora = DateFormat('HH:mm').format(cita.startTime);
    final precio = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 0,
    ).format(cita.servicePrice ?? 0);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  hora,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.brandPrimary,
                  ),
                ),
                Text(
                  '${cita.duracionMinutos}min',
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Container(
              width: 3,
              height: 56,
              decoration: BoxDecoration(
                color: cita.status.color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cita.clientName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    cita.serviceName ?? 'Sin servicio',
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      InitialsAvatar(
                        initials: cita.professionalInitials,
                        size: 22,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          cita.professionalName ?? '—',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Text(
                        precio,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            StatusBadge(
              label: cita.status.label,
              color: cita.status.color,
            ),
          ],
        ),
      ),
    );
  }
}
