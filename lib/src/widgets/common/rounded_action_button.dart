import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  const RoundedRectangleButton({
    required this.color,
    required this.gradient,
    required this.text,
    required this.ontap,
    this.height = 52,
    this.radius = 10,
    this.showIcon,
    this.icon,
    this.hasBorder = false,
    this.borderColor,
    this.textStyle,
    this.iconColor,
    super.key,
  });

  final Gradient? gradient;
  final Color color;
  final String text;
  final void Function()? ontap;
  final double height;
  final bool? showIcon;
  final Icon? icon;
  final TextStyle? textStyle;
  final Color? iconColor;
  final Color? borderColor;
  final double radius;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        decoration: ShapeDecoration(
          color: gradient == null ? color : null,
          gradient: gradient,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: hasBorder ? 1 : 0,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: borderColor ?? Color(0xFFCBDEFF),
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle ??
                  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
            ),
            if (showIcon ?? false) ...[
              SizedBox(
                width: 5,
              ),
              icon ??
                  Icon(
                    Icons.arrow_forward,
                    color: iconColor ?? Colors.white,
                  ),
            ],
          ],
        ),
      ),
    );
  }
}
