import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Header del login: rectángulo verde con borde inferior curvado hacia abajo
/// (parábola que abomba hacia el centro) y una foto/avatar centrado.
///
/// Para usar una foto real cambia el `child` del `Center` por:
///
/// ```dart
/// ClipOval(
///   child: Image.asset('assets/images/login_hero.jpg', fit: BoxFit.cover),
/// )
/// ```
///
/// y añade la entrada de asset en `pubspec.yaml`.
class LoginHeroHeader extends StatelessWidget {
  const LoginHeroHeader({super.key, this.height = 360});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ClipPath(
        clipper: _BottomBulgeClipper(),
        child: Container(
          color: AppColors.brandPrimary,
          child: Center(
            child: _HeroPhoto(),
          ),
        ),
      ),
    );
  }
}

class _HeroPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 240,
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: 0.18),
            Colors.white.withValues(alpha: 0.05),
          ],
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: const Icon(
        Icons.face_retouching_natural,
        size: 110,
        color: Colors.white,
      ),
    );
  }
}

/// Recorta la parte inferior del rectángulo dejando una curva que bulle
/// hacia ABAJO en el centro (forma de paraguas invertido). El punto de
/// control de la curva queda más allá del borde inferior para acentuar
/// el arco.
class _BottomBulgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height * 0.72)
      ..quadraticBezierTo(
        size.width / 2,
        size.height + 40,
        size.width,
        size.height * 0.72,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
