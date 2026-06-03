import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

enum PaymentMethod {
  efectivo,
  tarjeta,
  transferencia,
  qr;

  String get label => switch (this) {
        PaymentMethod.efectivo => 'Efectivo',
        PaymentMethod.tarjeta => 'Tarjeta',
        PaymentMethod.transferencia => 'Transferencia',
        PaymentMethod.qr => 'QR',
      };

  IconData get icon => switch (this) {
        PaymentMethod.efectivo => Icons.payments_outlined,
        PaymentMethod.tarjeta => Icons.credit_card,
        PaymentMethod.transferencia => Icons.account_balance,
        PaymentMethod.qr => Icons.qr_code_2,
      };

  Color get color => switch (this) {
        PaymentMethod.efectivo => AppColors.statusPagado,
        PaymentMethod.tarjeta => AppColors.statusReserva,
        PaymentMethod.transferencia => AppColors.statusEnServicio,
        PaymentMethod.qr => AppColors.brandAccent,
      };
}
