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

  static AppointmentStatus fromString(String v) => switch (v) {
        'pending' || 'confirmed' || 'reserva' => AppointmentStatus.reserva,
        'waiting' || 'en_espera' => AppointmentStatus.enEspera,
        'in_service' || 'en_servicio' => AppointmentStatus.enServicio,
        'completed' || 'atendida' => AppointmentStatus.atendida,
        'paid' || 'pagada' => AppointmentStatus.pagada,
        'cancelled' || 'cancelada' => AppointmentStatus.cancelada,
        'no_show' || 'no_se_presento' => AppointmentStatus.noSePresento,
        _ => AppointmentStatus.reserva,
      };

  String get apiValue => switch (this) {
        AppointmentStatus.reserva => 'pending',
        AppointmentStatus.enEspera => 'waiting',
        AppointmentStatus.enServicio => 'in_service',
        AppointmentStatus.atendida => 'completed',
        AppointmentStatus.pagada => 'paid',
        AppointmentStatus.cancelada => 'cancelled',
        AppointmentStatus.noSePresento => 'no_show',
      };

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
