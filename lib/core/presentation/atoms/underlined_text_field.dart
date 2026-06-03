import 'package:flutter/material.dart';

/// Input con estilo de subrayado simple (sin fondo, sin borde lateral),
/// icono prefijo opcional. Se usa en pantallas tipo onboarding/login
/// donde el fondo es blanco y queremos un look minimalista.
class UnderlinedTextField extends StatelessWidget {
  const UnderlinedTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.autocorrect = true,
  });

  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autocorrect;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      autocorrect: autocorrect,
      style: TextStyle(fontSize: 15, color: scheme.onSurface),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: scheme.onSurfaceVariant.withValues(alpha: 0.7),
          fontSize: 15,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, size: 22, color: scheme.onSurfaceVariant),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 36,
          minHeight: 36,
        ),
        filled: false,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
      ),
    );
  }
}
