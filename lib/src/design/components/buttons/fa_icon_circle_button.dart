import 'package:flutter/widgets.dart';

import '../../icons/fa_icon_asset.dart';
import '../../theme/fa_theme_context.dart';
import '../icon/fa_svg_icon.dart';

class FaIconCircleButton extends StatelessWidget {
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
  final VoidCallback? onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: semanticLabel,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: SizedBox.square(
          dimension: tapTarget,
          child: Center(
            child: SizedBox.square(
              dimension: diameter,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.status.neutral.tint,
                  shape: BoxShape.circle,
                ),
                child: Center(child: FaSvgIcon(icon, color: colors.icon)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
