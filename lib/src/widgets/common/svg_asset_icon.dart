import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssetIcon extends StatelessWidget {
  const SvgAssetIcon(
      {required this.path,
      this.height = 14,
      this.width = 14,
      this.color,
      this.labelText = "",
      this.onTap});

  final String path;
  final double height;
  final double width;
  final Color? color;
  final String labelText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SizedBox(
          height: height,
          width: width,
          child: SvgPicture.asset(path,
              color: color ?? Theme.of(context).iconTheme.color,
              semanticsLabel: labelText,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
