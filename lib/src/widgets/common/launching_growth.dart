import 'package:fa_flutter_ui_kit/src/constants/images.dart';
import 'package:flutter/material.dart';

class LaunchingGrowthImage extends StatelessWidget {
  const LaunchingGrowthImage(
      {Key? key, this.foregroundColor, this.width, this.height})
      : super(key: key);

  final Color? foregroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Images.launchingGrowth,
      color: foregroundColor,
      width: width,
      height: height,
    );
  }
}
