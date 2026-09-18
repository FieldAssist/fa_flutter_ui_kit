import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import 'fa_field_label.dart';

/// MT 2.0's labelled, outlined text input.
class FaTextField extends StatelessWidget {
  const FaTextField({
    required this.label,
    required this.controller,
    this.hint,
    this.isRequired = false,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.onChanged,
    this.errorText,
    super.key,
  });

  static const double minHeight = 44;

  final String label;
  final TextEditingController controller;
  final String? hint;
  final bool isRequired;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final ValueChanged<String>? onChanged;

  /// Shown under the field, which outlines in the danger colour while it is set.
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    OutlineInputBorder outline(Color color) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(FaRadius.md),
          borderSide: BorderSide(color: color),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FaFieldLabel(label, isRequired: isRequired),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          onChanged: onChanged,
          style: text.body.copyWith(color: colors.textPrimary),
          cursorColor: colors.brand,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: text.body.copyWith(color: colors.textTertiary),
            isDense: true,
            filled: true,
            fillColor: colors.surface,
            counterText: '',
            constraints: const BoxConstraints(minHeight: minHeight),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: FaSpace.x12,
              vertical: FaSpace.x12,
            ),
            errorText: errorText,
            errorStyle: text.s12.w400.copyWith(color: colors.status.danger.solid),
            border: outline(colors.border),
            enabledBorder: outline(colors.border),
            focusedBorder: outline(colors.brand),
            errorBorder: outline(colors.status.danger.solid),
            focusedErrorBorder: outline(colors.status.danger.solid),
          ),
        ),
      ],
    );
  }
}
