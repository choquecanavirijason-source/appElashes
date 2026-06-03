import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Avatar circular con iniciales sobre un degradado verde/morado.
/// Pieza usada en clientes, operarias y threads de chat.
class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({
    super.key,
    required this.initials,
    this.size = 44,
    this.colors,
  });

  final String initials;
  final double size;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: colors ??
              const [
                AppColors.brandPrimary,
                AppColors.brandAccent,
              ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          initials.isEmpty ? '?' : initials,
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.4,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
