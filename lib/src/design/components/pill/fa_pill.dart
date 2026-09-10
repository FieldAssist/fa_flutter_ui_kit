import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import '../../tokens/fa_status_ramp.dart';

/// A small, fully rounded status label — MT 2.0's most-used component.
///
/// It takes a [FaTone], never a colour: the tone resolves against the theme,
/// so "Completed" stays green and a brand-toned pill re-tints with the
/// company's palette without touching a call site.
class FaPill extends StatelessWidget {
  const FaPill({
    required this.label,
    this.tone = FaTone.neutral,
    this.leading,
    this.trailing,
    super.key,
  });

  final String label;
  final FaTone tone;

  /// Icon or dot before the label. Sized by the caller; MT uses 14px glyphs.
  final Widget? leading;

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final ramp = context.faColors.status.of(tone);
    return Container(
      // Uniform 4px, checked against the MT 2.0 "Verified" pill: 72pt wide =
      // 4 + 14 (icon) + 4 (gap) + 46 (label) + 4. Label-only status pills in
      // the activity cards look wider, so a denser/roomier variant may be a
      // separate size in the library — to be confirmed with those cards.
      padding: const EdgeInsets.all(FaSpace.x4),
      decoration: BoxDecoration(
        color: ramp.tint,
        borderRadius: BorderRadius.circular(FaRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            IconTheme.merge(
              data: IconThemeData(color: ramp.ink, size: 14),
              child: leading!,
            ),
            const SizedBox(width: FaSpace.x4),
          ],
          Text(
            label,
            style: context.faText.pillLabel.copyWith(color: ramp.ink),
          ),
          if (trailing != null) ...[
            const SizedBox(width: FaSpace.x4),
            IconTheme.merge(
              data: IconThemeData(color: ramp.ink, size: 14),
              child: trailing!,
            ),
          ],
        ],
      ),
    );
  }
}
