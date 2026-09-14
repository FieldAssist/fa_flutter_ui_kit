import 'package:flutter/widgets.dart';

import '../../icons/fa_icon_asset.dart';
import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import '../icon/fa_svg_icon.dart';

enum FaButtonVariant { filled, outlined }

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
/// `SizedBox(width: double.infinity)`, to stretch it.
class FaButton extends StatelessWidget {
  const FaButton({
    required this.label,
    required this.onTap,
    this.variant = FaButtonVariant.filled,
    this.size = FaButtonSize.regular,
    this.trailingIcon,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final FaButtonVariant variant;
  final FaButtonSize size;
  final FaIconAsset? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    final filled = variant == FaButtonVariant.filled;
    final ink = filled ? colors.onBrand : colors.brand;
    final icon = trailingIcon;
    final labelStyle = switch (size) {
      FaButtonSize.regular => text.s14.w500,
      FaButtonSize.compact => text.s12.w500,
    };
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: filled ? colors.brand : colors.status.brand.tint,
            borderRadius: BorderRadius.circular(FaRadius.pill),
            border: filled ? null : Border.all(color: colors.brand),
          ),
          child: SizedBox(
            height: size.height,
            child: Padding(
              // The design trims the trailing edge when an icon closes the
              // label.
              padding: EdgeInsetsDirectional.only(
                start: size.padding,
                end: icon == null ? size.padding : FaSpace.x10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      label,
                      style: labelStyle.copyWith(color: ink),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (icon != null) ...[
                    const SizedBox(width: FaSpace.x6),
                    FaSvgIcon(icon, color: ink),
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
