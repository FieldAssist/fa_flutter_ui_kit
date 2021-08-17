import 'package:flutter/material.dart';

enum DayStartButtonBorderStyle { singleBorder, fullBorder }

class DayStartButton extends StatelessWidget {
  const DayStartButton({
    required this.text,
    required this.borderColor,
    required this.onPressed,
    required this.isDisabled,
    this.dayStartButtonBorderStyle = DayStartButtonBorderStyle.singleBorder,
    this.isDarkMode = false,
    Key? key,
  }) : super(key: key);

  final DayStartButtonBorderStyle dayStartButtonBorderStyle;

  final String text;
  final Color borderColor;
  final VoidCallback onPressed;
  final bool isDisabled;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side:
              dayStartButtonBorderStyle == DayStartButtonBorderStyle.fullBorder
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
        minimumSize: Size.fromHeight(64),
        backgroundColor:
            dayStartButtonBorderStyle == DayStartButtonBorderStyle.fullBorder
                ? Colors.white
                : Color(0xffE5F8FF),
      ),
      onPressed: isDisabled ? null : onPressed,
      child: Row(
        children: [
          SizedBox(
            width: 10,
            height: 70,
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
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward,
            size: 24,
            color: Colors.grey,
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
