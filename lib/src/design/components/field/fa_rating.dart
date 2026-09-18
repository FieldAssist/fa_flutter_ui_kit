import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_spacing.dart';
import 'fa_field_label.dart';

/// A labelled star rating. Tapping the current rating again clears it.
class FaRating extends StatelessWidget {
  const FaRating({
    required this.label,
    required this.onChanged,
    this.value,
    this.starCount = 5,
    this.isRequired = false,
    this.errorText,
    super.key,
  });

  final String label;

  /// 1 to [starCount], or null when nothing is rated yet.
  final int? value;
  final ValueChanged<int?> onChanged;
  final int starCount;
  final bool isRequired;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final rated = value ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FaFieldLabel(label, isRequired: isRequired),
        Row(
          children: [
            for (var star = 1; star <= starCount; star++)
              IconButton(
                onPressed: () => onChanged(star == value ? null : star),
                padding: const EdgeInsets.only(right: FaSpace.x8),
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                iconSize: 28,
                splashRadius: 20,
                icon: Icon(
                  star <= rated ? Icons.star_rounded : Icons.star_border_rounded,
                  color: star <= rated ? colors.brand : colors.border,
                ),
              ),
          ],
        ),
        if (errorText != null) ...[
          const SizedBox(height: FaSpace.x6),
          Text(
            errorText!,
            style: context.faText.s12.w400
                .copyWith(color: colors.status.danger.solid),
          ),
        ],
      ],
    );
  }
}
