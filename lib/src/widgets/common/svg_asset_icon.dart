import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssetIcon extends StatelessWidget {
  const SvgAssetIcon({
    required this.path,
    this.height = 14,
    this.width = 14,
    this.color,
    this.labelText = "",
  });

  final String path;
  final double height;
  final double width;
  final Color? color;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          path,
          color: color ?? Theme.of(context).iconTheme.color,
          semanticsLabel: labelText,
        ),
      ),
    );
  }
}
