import 'package:flutter/material.dart';

class TopWidgetContainer extends StatelessWidget {
  const TopWidgetContainer({
    required this.onTap,
    required this.text,
    required this.topWidget,
    this.height,
    this.bgColor,
    this.textColor,
    this.textSize,
    this.iconColor,
    this.iconSize,
  });

  final double? height;
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final double? textSize;
  final Widget topWidget;
  final Color? iconColor;
  final double? iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bgColor ?? Theme.of(context).primaryColor,
        height: MediaQuery.of(context).size.height * 0.08,
        padding: const EdgeInsets.only(bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(onTap: onTap, child: topWidget),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: textSize ??
                      Theme.of(context).primaryTextTheme.subtitle2!.fontSize,
                  color: textColor ??
                      Theme.of(context).primaryTextTheme.subtitle2!.color),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
