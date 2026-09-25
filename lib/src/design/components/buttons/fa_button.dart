import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../icons/fa_icon_asset.dart';
import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import '../../tokens/fa_status_ramp.dart';
import '../icon/fa_svg_icon.dart';
import 'fa_tap_guard.dart';

enum FaButtonVariant {
  filled,
  outlined,

  /// Grey fill, light border, dark label; [FaButton.tone] is ignored. A
  /// low-emphasis action beside a filled one, e.g. Save Draft.
  secondary,
}

enum FaButtonSize {
  /// Dialogs and bottom bars.
  regular(height: 44, padding: FaSpace.x16),

  /// Actions inside a card.
  compact(height: 30, padding: FaSpace.x14);

  const FaButtonSize({required this.height, required this.padding});

  final double height;
  final double padding;
}

/// MT 2.0's fully rounded button.
///
/// It sizes to its label; give it a tight width, e.g.
/// `SizedBox(width: double.infinity)`, to stretch it. Taps are ignored while
/// the Future returned by [onTap] is still running.
class FaButton extends StatefulWidget {
  const FaButton({
    required this.label,
    required this.onTap,
    this.variant = FaButtonVariant.filled,
    this.size = FaButtonSize.regular,
    this.tone = FaTone.brand,
    this.leadingIcon,
    this.trailingIcon,
    super.key,
  });

  final String label;
  final FutureOr<void> Function() onTap;
  final FaButtonVariant variant;
  final FaButtonSize size;
  final FaTone tone;
  final FaIconAsset? leadingIcon;
  final FaIconAsset? trailingIcon;

  @override
  State<FaButton> createState() => _FaButtonState();
}

class _FaButtonState extends State<FaButton> with FaTapGuard {
  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    final ramp = colors.status.of(widget.tone);
    // Brand keeps the company primary, one step deeper than its status ramp.
    final isBrand = widget.tone == FaTone.brand;
    final solid = isBrand ? colors.brand : ramp.solid;
    final filled = widget.variant == FaButtonVariant.filled;
    final secondary = widget.variant == FaButtonVariant.secondary;
    final ink = filled
        ? colors.onBrand
        : secondary
            ? colors.textStrong
            : solid;
    // Every primary call to action carries the CTA sweep; the status tones
    // stay flat so a destructive action still reads as one.
    final gradient =
        filled && isBrand ? context.faGradients.primaryAction : null;
    final leading = widget.leadingIcon;
    final trailing = widget.trailingIcon;
    final size = widget.size;
    final labelStyle = switch (size) {
      FaButtonSize.regular => text.s14.w500,
      FaButtonSize.compact => text.s12.w500,
    };
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: () => guardTap(widget.onTap),
        behavior: HitTestBehavior.opaque,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: gradient != null
                ? null
                : filled
                    ? solid
                    : secondary
                        ? colors.track
                        : ramp.tint,
            gradient: gradient,
            borderRadius: BorderRadius.circular(FaRadius.pill),
            border: filled
                ? null
                : Border.all(color: secondary ? colors.border : solid),
          ),
          child: SizedBox(
            height: size.height,
            child: Padding(
              // The design trims the trailing edge when an icon closes the
              // label.
              padding: EdgeInsetsDirectional.only(
                start: size.padding,
                end: trailing == null ? size.padding : FaSpace.x10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leading != null) ...[
                    FaSvgIcon(leading, color: ink),
                    const SizedBox(width: FaSpace.x6),
                  ],
                  Flexible(
                    child: Text(
                      widget.label,
                      style: labelStyle.copyWith(color: ink),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: FaSpace.x6),
                    FaSvgIcon(trailing, color: ink),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
