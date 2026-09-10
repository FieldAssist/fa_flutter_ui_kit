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
    this.leading,
    this.trailing,
    super.key,
  });

  final String label;
  final FaTone tone;
  final FaPillSize size;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final ramp = context.faColors.status.of(tone);
    final iconTheme = IconThemeData(color: ramp.ink, size: 14);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ramp.tint,
        borderRadius: BorderRadius.circular(FaRadius.pill),
      ),
      child: Padding(
        padding: switch (size) {
          FaPillSize.sm => const EdgeInsets.all(FaSpace.x4),
          FaPillSize.md => const EdgeInsets.symmetric(
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
              style: context.faText.pillLabel.copyWith(color: ramp.ink),
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
