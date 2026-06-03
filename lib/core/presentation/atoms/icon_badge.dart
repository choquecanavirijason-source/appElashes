import 'package:flutter/material.dart';

/// Cuadrado pequeño coloreado con un icono encima. Pieza base usada por
/// `StatCard`, listas de navegación, badges de estado, etc.
class IconBadge extends StatelessWidget {
  const IconBadge({
    super.key,
    required this.icon,
    required this.color,
    this.size = 20,
    this.padding = 8,
    this.radius = 10,
  });

  final IconData icon;
  final Color color;
  final double size;
  final double padding;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Icon(icon, color: color, size: size),
    );
  }
}
