import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

enum AppointmentStatus {
  reserva,
  enEspera,
  enServicio,
  atendida,
  pagada,
  cancelada,
  noSePresento;

  String get label => switch (this) {
        AppointmentStatus.reserva => 'Reserva',
        AppointmentStatus.enEspera => 'En espera',
        AppointmentStatus.enServicio => 'En servicio',
        AppointmentStatus.atendida => 'Atendida',
        AppointmentStatus.pagada => 'Pagada',
        AppointmentStatus.cancelada => 'Cancelada',
        AppointmentStatus.noSePresento => 'No se presentó',
      };

  Color get color => switch (this) {
        AppointmentStatus.reserva => AppColors.statusReserva,
        AppointmentStatus.enEspera => AppColors.statusEnEspera,
        AppointmentStatus.enServicio => AppColors.statusEnServicio,
        AppointmentStatus.atendida => AppColors.statusAtendido,
        AppointmentStatus.pagada => AppColors.statusPagado,
        AppointmentStatus.cancelada => AppColors.statusCancelado,
        AppointmentStatus.noSePresento => AppColors.statusNoSePresento,
      };
}
