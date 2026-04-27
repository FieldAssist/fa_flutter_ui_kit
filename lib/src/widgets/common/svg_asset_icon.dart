import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/constants/constants.dart';
import 'package:flutter/material.dart';

class SvgAssetIcon extends StatelessWidget {
  const SvgAssetIcon({
    required this.path,
    this.height = 14,
    this.width = 14,
    this.color,
    this.labelText = "",
    this.padding,
    this.package = Constants.appName,
  });

  final String path;
  final double height;
  final double width;
  final Color? color;
  final String labelText;
  final double? padding;
  final String package;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 6),
      child: SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          path,
          color: color ?? Theme.of(context).iconTheme.color,
          semanticsLabel: labelText,
          package: package,
        ),
      ),
    );
  }
}
