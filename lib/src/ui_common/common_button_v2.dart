import 'package:flutter/material.dart';

import 'config/ui_common_colors.dart';
import 'fa_state.dart';

class CommonButtonV2 extends StatefulWidget {
  const CommonButtonV2({
    required this.onPressed,
    this.text,
    this.icon,
    this.color,
    this.gradient,
    this.width = 156,
    this.height = 50,
    this.borderRadius = 14,
    this.iconLeading = false,
    this.showborder = false,
    this.style,
    this.textColor,
    this.margin,
    this.child,
    this.enabled = true,
    super.key,
  }) : _borderColor = enabled ? color : UiCommonColors.kWhite;

  final Color? color;
  final Color? _borderColor;
  final Color? textColor;
  final Gradient? gradient;
  final String? text;
  final Future<void> Function() onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final bool iconLeading;
  final Icon? icon;
  final TextStyle? style;
  final bool showborder;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final bool enabled;

  @override
  FaState<CommonButtonV2> createState() => _CommonButtonV2State();
}

class _CommonButtonV2State extends FaState<CommonButtonV2> {
  @override
  Widget build(BuildContext context) {
    //TODO: this needs to be removed
    return GestureDetector(
      onTap: () => widget.enabled ? asyncDebounce(widget.onPressed) : null,
      child: widget.child ??
          Container(
            height: widget.height,
            width: widget.width,
            margin: widget.margin,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: widget.enabled
                  ? (widget.showborder ? UiCommonColors.kWhite : widget.color)
                  : (widget.showborder
                      ? null
                      : Theme.of(context).disabledColor),
              gradient: widget.enabled ? widget.gradient : null,
              border: widget.showborder
                  ? Border.all(
                      color: widget.enabled
                          ? widget._borderColor ?? UiCommonColors.kBlack
                          : Theme.of(context).disabledColor,
                    )
                  : null,
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.iconLeading)
                    widget.icon ?? const SizedBox.shrink()
                  else
                    Flexible(
                      child: Text(
                        widget.text ?? '',
                        style: widget.style ?? textStyle(),
                      ),
                    ),
                  // add space between text and icon only when required
                  if (widget.icon != null)
                    const SizedBox(
                      width: 8,
                    ),
                  if (widget.iconLeading)
                    Flexible(
                      child: Text(
                        widget.text ?? '',
                        style: widget.style ?? textStyle(),
                      ),
                    )
                  else
                    widget.icon ?? const SizedBox.shrink(),
                ],
              ),
            ),
          ),
    );
  }

  TextStyle textStyle() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: widget.showborder
          ? (widget.enabled
              ? widget._borderColor
              : Theme.of(context).disabledColor)
          : widget.textColor ?? UiCommonColors.kWhite,
    );
  }
}
