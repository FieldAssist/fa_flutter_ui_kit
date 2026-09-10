import 'package:fa_flutter_core/fa_flutter_core.dart' show SvgPicture;
import 'package:flutter/widgets.dart';

import '../../icons/fa_icon_asset.dart';

class FaSvgIcon extends StatelessWidget {
  const FaSvgIcon(this.icon, {this.color, this.semanticLabel, super.key});

  final FaIconAsset icon;
  final Color? color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final tint = icon.tintable ? color ?? IconTheme.of(context).color : null;
    return SvgPicture.asset(
      icon.path,
      package: icon.package,
      width: icon.width,
      height: icon.height,
      colorFilter:
          tint == null ? null : ColorFilter.mode(tint, BlendMode.srcIn),
      semanticsLabel: semanticLabel,
      excludeFromSemantics: semanticLabel == null,
    );
  }
}
