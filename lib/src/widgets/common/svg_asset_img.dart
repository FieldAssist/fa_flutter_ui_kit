import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssetImage extends StatelessWidget {
  const SvgAssetImage({
    required this.path,
    this.height = 200,
    this.width = 200,
    this.labelText = "",
    this.iconColor,
  });

  final String path;
  final double height;
  final double width;
  final String labelText;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          path,
          semanticsLabel: labelText,
          color: iconColor,
        ),
      ),
    );
  }
}
