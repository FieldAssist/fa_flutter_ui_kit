import 'package:fa_flutter_ui_kit/src/constants/images.dart';
import 'package:flutter/material.dart';

class FieldAssistLogo extends StatelessWidget {
  const FieldAssistLogo({
    Key key,
    this.foregroundColor,
    this.width,
    this.height,
  }) : super(key: key);

  final Color foregroundColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Images.instance.launchingGrowth,
      color: foregroundColor,
      width: width,
      height: height,
    );
  }
}
