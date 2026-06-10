import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class LoginHeroHeader extends StatelessWidget {
  const LoginHeroHeader({super.key, this.height = 330});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ClipPath(
        clipper: _BottomBulgeClipper(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF031910),
                Color(0xFF094732),
                Color(0xFF0D5A40),
              ],
            ),
          ),
          child: Stack(
            children: [
              // Círculo grande — esquina superior derecha
              const Positioned(
                top: -70,
                right: -70,
                child: _DecorCircle(size: 240, opacity: 0.07),
              ),
              // Círculo medio — izquierda baja
              const Positioned(
                bottom: 30,
                left: -50,
                child: _DecorCircle(size: 180, opacity: 0.06),
              ),
              // Círculo pequeño — superior izquierda
              const Positioned(
                top: 44,
                left: 24,
                child: _DecorCircle(size: 56, opacity: 0.1),
              ),
              // Anillo dorado — superior derecha
              Positioned(
                top: 72,
                right: 36,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.goldAccent.withValues(alpha: 0.45),
                      width: 2,
                    ),
                  ),
                ),
              ),
              // Punto dorado pequeño
              Positioned(
                top: 58,
                right: 88,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.goldAccent.withValues(alpha: 0.5),
                  ),
                ),
              ),
              // Línea horizontal decorativa sutil
              Positioned(
                bottom: 90,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.06,
                  child: Container(height: 1, color: Colors.white),
                ),
              ),
              // Contenido central
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Avatar con glow
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppColors.brandAccent.withValues(alpha: 0.28),
                              Colors.transparent,
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.18),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.brandAccent.withValues(alpha: 0.22),
                              blurRadius: 36,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.face_retouching_natural,
                          size: 54,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Nombre de marca
                      const Text(
                        'eLashes',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 1.8,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Badge admin
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.goldAccent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(
                            color: AppColors.goldAccent.withValues(alpha: 0.45),
                          ),
                        ),
                        child: const Text(
                          'PANEL DE ADMINISTRACIÓN',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.goldAccent,
                            letterSpacing: 2.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DecorCircle extends StatelessWidget {
  const _DecorCircle({required this.size, required this.opacity});

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: opacity),
      ),
    );
  }
}

class _BottomBulgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height * 0.76)
      ..quadraticBezierTo(
        size.width / 2,
        size.height + 50,
        size.width,
        size.height * 0.76,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
