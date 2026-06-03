import 'package:flutter/material.dart';

/// Botón principal con forma de píldora (border-radius muy alto).
/// Más alto y más redondeado que el `FilledButton` por defecto del tema.
class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height = 56,
    this.color,
    this.foregroundColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final double height;
  final Color? color;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: height,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: color ?? scheme.primary,
          foregroundColor: foregroundColor ?? scheme.onPrimary,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 28),
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
