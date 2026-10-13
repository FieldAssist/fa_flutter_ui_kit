import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../icons/fa_icon_asset.dart';
import '../../theme/fa_theme_context.dart';
import '../icon/fa_svg_icon.dart';
import 'fa_tap_guard.dart';

/// Taps are ignored while the Future returned by [onTap] is still running.
class FaIconCircleButton extends StatefulWidget {
  const FaIconCircleButton({
    required this.icon,
    required this.onTap,
    this.semanticLabel,
    super.key,
  });

  static const double diameter = 30;

  // Matches FaIconTile so a card's top row keeps its Figma height.
  static const double tapTarget = 40;

  final FaIconAsset icon;
  final FutureOr<void> Function()? onTap;
  final String? semanticLabel;

  @override
  State<FaIconCircleButton> createState() => _FaIconCircleButtonState();
}

class _FaIconCircleButtonState extends State<FaIconCircleButton>
    with FaTapGuard {
  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final onTap = widget.onTap;
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: widget.semanticLabel,
      child: GestureDetector(
        onTap: onTap == null ? null : () => guardTap(onTap),
        behavior: HitTestBehavior.opaque,
        child: SizedBox.square(
          dimension: FaIconCircleButton.tapTarget,
          child: Center(
            child: SizedBox.square(
              dimension: FaIconCircleButton.diameter,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.status.neutral.tint,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: FaSvgIcon(widget.icon, color: colors.icon),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
