import 'package:flutter/widgets.dart';

import '../../icons/fa_icon_asset.dart';
import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_status_ramp.dart';
import '../icon/fa_svg_icon.dart';

class FaIconTile extends StatelessWidget {
  const FaIconTile({required this.icon, this.tone = FaTone.brand, super.key});

  static const double size = 40;

  final FaIconAsset icon;
  final FaTone tone;

  @override
  Widget build(BuildContext context) {
    final ramp = context.faColors.status.of(tone);
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ramp.tint,
          borderRadius: BorderRadius.circular(FaRadius.chip),
        ),
        child: Center(child: FaSvgIcon(icon, color: ramp.ink)),
      ),
    );
  }
}
