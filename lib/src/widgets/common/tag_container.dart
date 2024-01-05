import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  const TagContainer({
    required this.text,
    this.textColor,
    this.bgColor,
    this.icon,
    this.iconColor,
    this.borderColor,
    this.padding,
  });

  final String text;
  final Color? textColor;
  final Color? bgColor;
  final IconData? icon;
  final Color? iconColor;
  final Color? borderColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: borderColor != null
            ? Border.all(
                color: Colors.grey,
                width: 2,
              )
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon == null)
            Container()
          else
            Icon(
              icon,
              size: 10,
              color: iconColor ?? Theme.of(context).iconTheme.color,
            ),
          if (icon == null)
            Container()
          else
            SizedBox(
              width: 2,
            ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: textColor, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
