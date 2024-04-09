import 'package:flutter/material.dart';

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
    this.appThemePrimaryColor,
    this.appThemeGradient,
    Key? key,
  }) : super(key: key);

  final DayStartButtonBorderStyle dayStartButtonBorderStyle;

  final String text;
  final Color titleColor;
  final Color borderColor;
  final VoidCallback onPressed;
  final bool isDisabled;
  final bool isDarkMode;
  final Color? appThemePrimaryColor;
  final LinearGradient? appThemeGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appThemePrimaryColor != null
            ? appThemePrimaryColor
            : (dayStartButtonBorderStyle ==
                        DayStartButtonBorderStyle.fullBorder ||
                    dayStartButtonBorderStyle ==
                        DayStartButtonBorderStyle.singleBorderWhiteBg)
                ? Colors.white
                : Color(0xffE5F8FF),
        gradient: appThemeGradient,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: dayStartButtonBorderStyle ==
                    DayStartButtonBorderStyle.fullBorder
                ? BorderSide(
                    width: 1,
                    color: borderColor,
                  )
                : BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
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
}
