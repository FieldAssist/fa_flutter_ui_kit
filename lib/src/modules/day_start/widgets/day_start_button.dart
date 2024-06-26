import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum DayStartButtonBorderStyle { singleBorder, fullBorder, singleBorderWhiteBg }

class DayStartButton extends StatelessWidget {
  const DayStartButton({
    required this.text,
    required this.onPressed,
    this.titleColor = Colors.black,
    required this.isDisabled,
    this.dayStartButtonBorderStyle = DayStartButtonBorderStyle.singleBorder,
    this.isDarkMode = false,
    this.borderColor = Colors.transparent,
    this.primaryColor,
    this.gradient,
    Key? key,
  }) : super(key: key);

  final DayStartButtonBorderStyle dayStartButtonBorderStyle;

  final String text;
  final Color titleColor;
  final Color borderColor;
  final VoidCallback onPressed;
  final bool isDisabled;
  final bool isDarkMode;
  final Color? primaryColor;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getBackgrounColor(),
        gradient: gradient,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: _getBorderSide(),
          ),
          padding: EdgeInsets.zero,
          minimumSize: Size.fromHeight(48),
          backgroundColor: Colors.transparent,
        ),
        onPressed: isDisabled ? null : onPressed,
        child: Row(
          children: [
            SizedBox(
              width: 10,
              height: 56,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: titleColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 20,
              color: Colors.grey,
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }

  BorderSide _getBorderSide() {
    return dayStartButtonBorderStyle == DayStartButtonBorderStyle.fullBorder
        ? BorderSide(
            width: 1,
            color: borderColor,
          )
        : BorderSide(
            width: 0,
            color: Colors.transparent,
          );
  }

  Color? _getBackgrounColor() {
    return primaryColor != null
        ? primaryColor
        : (dayStartButtonBorderStyle == DayStartButtonBorderStyle.fullBorder ||
                dayStartButtonBorderStyle ==
                    DayStartButtonBorderStyle.singleBorderWhiteBg)
            ? Colors.white
            : Color(0xffE5F8FF);
  }
}
