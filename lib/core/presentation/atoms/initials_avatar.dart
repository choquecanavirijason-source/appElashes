import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({
    super.key,
    required this.initials,
    this.size = 44,
    this.colors,
    this.backgroundColor,
    this.statusColor,
  });

  final String initials;
  final double size;
  final List<Color>? colors;
  final Color? backgroundColor;

  /// If non-null, shows a small status dot (online/offline indicator) at the
  /// bottom-right of the avatar.
  final Color? statusColor;

  @override
  Widget build(BuildContext context) {
    final avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        gradient: backgroundColor != null
            ? null
            : LinearGradient(
                colors: colors ??
                    const [AppColors.brandPrimary, AppColors.brandAccent],
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

    if (statusColor == null) return avatar;

    final dotSize = size * 0.28;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.darkBg, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
