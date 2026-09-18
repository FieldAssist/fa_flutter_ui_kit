import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import 'fa_field_label.dart';

/// A labelled row of chips where one option at a time is chosen. Tapping the
/// chosen chip again clears the answer.
class FaChoiceChips extends StatelessWidget {
  const FaChoiceChips({
    required this.label,
    required this.options,
    required this.onSelected,
    this.selected,
    this.isRequired = false,
    this.errorText,
    super.key,
  });

  final String label;
  final List<String> options;
  final String? selected;
  final ValueChanged<String?> onSelected;
  final bool isRequired;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FaFieldLabel(label, isRequired: isRequired),
        Wrap(
          spacing: FaSpace.x8,
          runSpacing: FaSpace.x8,
          children: [
            for (final option in options)
              _Chip(
                label: option,
                isSelected: option == selected,
                onTap: () => onSelected(option == selected ? null : option),
              ),
          ],
        ),
        if (errorText != null) ...[
          const SizedBox(height: FaSpace.x6),
          Text(
            errorText!,
            style: text.s12.w400.copyWith(color: colors.status.danger.solid),
          ),
        ],
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(FaRadius.pill),
      child: Container(
        constraints: const BoxConstraints(minHeight: 36),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: FaSpace.x12,
          vertical: FaSpace.x8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? colors.brand : colors.surface,
          borderRadius: BorderRadius.circular(FaRadius.pill),
          border: Border.all(
            color: isSelected ? colors.brand : colors.border,
          ),
        ),
        child: Text(
          label,
          style: context.faText.s14.w500.copyWith(
            color: isSelected ? colors.onBrand : colors.textPrimary,
          ),
        ),
      ),
    );
  }
}
