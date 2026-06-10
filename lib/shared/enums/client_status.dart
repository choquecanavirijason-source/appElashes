import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

enum ClientStatus {
  reserva,
  enEspera,
  enServicio,
  siendoAtendido,
  atendido,
  pagado,
  finalizado,
  cancelado,
  noSePresento,
  reagendado,
  sinEstado;

  static ClientStatus fromString(String v) => switch (v) {
        'reserva' => ClientStatus.reserva,
        'en_espera' => ClientStatus.enEspera,
        'en_servicio' => ClientStatus.enServicio,
        'siendo_atendido' => ClientStatus.siendoAtendido,
        'atendido' => ClientStatus.atendido,
        'pagado' => ClientStatus.pagado,
        'finalizado' => ClientStatus.finalizado,
        'cancelado' => ClientStatus.cancelado,
        'no_se_presento' => ClientStatus.noSePresento,
        'reagendado' => ClientStatus.reagendado,
        _ => ClientStatus.sinEstado,
      };

  String get displayName => switch (this) {
        ClientStatus.reserva => 'Reserva',
        ClientStatus.enEspera => 'En espera',
        ClientStatus.enServicio => 'En servicio',
        ClientStatus.siendoAtendido => 'Siendo atendido',
        ClientStatus.atendido => 'Atendido',
        ClientStatus.pagado => 'Pagado',
        ClientStatus.finalizado => 'Finalizado',
        ClientStatus.cancelado => 'Cancelado',
        ClientStatus.noSePresento => 'No se presentó',
        ClientStatus.reagendado => 'Reagendado',
        ClientStatus.sinEstado => 'Sin estado',
      };

  Color get color => switch (this) {
        ClientStatus.reserva => AppColors.statusReserva,
        ClientStatus.enEspera => AppColors.statusEnEspera,
        ClientStatus.enServicio => AppColors.statusEnServicio,
        ClientStatus.siendoAtendido => AppColors.statusSiendoAtendido,
        ClientStatus.atendido => AppColors.statusAtendido,
        ClientStatus.pagado => AppColors.statusPagado,
        ClientStatus.finalizado => AppColors.statusFinalizado,
        ClientStatus.cancelado => AppColors.statusCancelado,
        ClientStatus.noSePresento => AppColors.statusNoSePresento,
        ClientStatus.reagendado => AppColors.statusReagendado,
        ClientStatus.sinEstado => AppColors.statusSinEstado,
      };
}
