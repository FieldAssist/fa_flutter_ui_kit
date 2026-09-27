import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import '../../tokens/fa_status_ramp.dart';

enum FaPillSize { sm, md }

class FaPill extends StatelessWidget {
  const FaPill({
    required this.label,
    this.tone = FaTone.neutral,
    this.size = FaPillSize.sm,
    this.outlined = false,
    this.leading,
    this.trailing,
    super.key,
  });

  final String label;
  final FaTone tone;
  final FaPillSize size;

  /// Figma's outlined, soft-corner status pill (a list row's Draft or
  /// Mandatory): a border in the tone and a smaller label, whatever [size].
  final bool outlined;

  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final ramp = context.faColors.status.of(tone);
    final iconTheme = IconThemeData(color: ramp.ink, size: 14);
    final labelStyle =
        outlined ? context.faText.s11.w500 : context.faText.pillLabel;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ramp.tint,
        borderRadius: BorderRadius.circular(
          outlined ? FaRadius.xl : FaRadius.pill,
        ),
        border: outlined ? Border.all(color: ramp.border) : null,
      ),
      child: Padding(
        padding: switch ((outlined, size)) {
          (true, _) => const EdgeInsets.symmetric(
              horizontal: FaSpace.x8,
              vertical: FaSpace.x2,
            ),
          (false, FaPillSize.sm) => const EdgeInsets.all(FaSpace.x4),
          (false, FaPillSize.md) => const EdgeInsets.symmetric(
              horizontal: FaSpace.x10,
              vertical: FaSpace.x4,
            ),
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              IconTheme.merge(data: iconTheme, child: leading!),
              const SizedBox(width: FaSpace.x4),
            ],
            Text(
              label,
              style: labelStyle.copyWith(color: ramp.ink),
            ),
            if (trailing != null) ...[
              const SizedBox(width: FaSpace.x4),
              IconTheme.merge(data: iconTheme, child: trailing!),
            ],
          ],
        ),
      ),
    );
  }
}
