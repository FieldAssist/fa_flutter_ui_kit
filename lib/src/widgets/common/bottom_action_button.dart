import 'package:flutter/material.dart';

enum IconPosition { start, end }

class BottomActionButton extends StatelessWidget {
  final String title;
  final bool showIcon;
  final Icon icon;
  final Color color;
  final TextStyle? titleStyle;
  final bool isCustomChildren;
  final Widget? child;
  final Color titleColor;
  final double height;
  final GestureTapCallback? onPressed;
  final IconPosition iconPosition;
  final bool forceButtonColor;
  final Color? primaryColor;
  final LinearGradient? gradient;

  const BottomActionButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isCustomChildren = false,
    this.child,
    this.color = const Color(0xff0097cd),
    this.titleStyle,
    this.titleColor = Colors.white,
    this.showIcon = true,
    this.iconPosition = IconPosition.end,
    this.height = 60,
    this.forceButtonColor = false,
    this.primaryColor,
    this.gradient,
    this.icon = const Icon(
      Icons.arrow_forward,
      color: Colors.white,
      size: 18,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Text(
      title.toUpperCase(),
      style: TextStyle(color: titleColor, fontSize: 14, letterSpacing: 1)
          .merge(titleStyle),
    );
    final iconText = {
      IconPosition.start: [
        if (showIcon) ...[icon, SizedBox(width: 8)],
        FittedBox(
          child: text,
        ),
      ],
      IconPosition.end: [
        FittedBox(
          child: text,
        ),
        if (showIcon) ...[SizedBox(width: 8), icon],
      ]
    }[iconPosition];

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: GestureDetector(
        onTap: onPressed,
        onDoubleTap: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
            color: _getBackgrounColor(),
            gradient: gradient,
          ),
          child: Center(
            child: isCustomChildren
                ? child
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: iconText!,
                  ),
          ),
        ),
      ),
    );
  }

  Color? _getBackgrounColor() {
    if (forceButtonColor) {
      return color;
    }
    return onPressed != null
        ? primaryColor != null
            ? primaryColor
            : color
        : Colors.grey;
  }
}
