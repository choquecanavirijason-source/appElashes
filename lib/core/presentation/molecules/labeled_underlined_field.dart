import 'package:flutter/material.dart';

import '../atoms/underlined_text_field.dart';

/// Label en negrita arriba + `UnderlinedTextField` debajo.
/// Patrón usado en el formulario de login/registro.
class LabeledUnderlinedField extends StatelessWidget {
  const LabeledUnderlinedField({
    super.key,
    required this.label,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.autocorrect = true,
  });

  final String label;
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autocorrect;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: scheme.onSurface,
          ),
        ),
        UnderlinedTextField(
          controller: controller,
          hintText: hintText,
          prefixIcon: prefixIcon,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          autocorrect: autocorrect,
        ),
      ],
    );
  }
}
