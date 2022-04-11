import 'package:fa_flutter_ui_kit/src/constants/text_style.dart';
import 'package:flutter/material.dart';

class SelectedMonthIndicator extends StatelessWidget {
  final String label;
  final String month;
  final Color selectedColour;

  const SelectedMonthIndicator({
    required this.month,
    required this.label,
    Key? key,
    required this.selectedColour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 0.4,
            color: selectedColour,
          )),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: KTextStyle.dateTextStyle),
          SizedBox(
            width: 5,
          ),
          Text(month,
              style: KTextStyle.dateTextStyle.copyWith(color: selectedColour))
        ],
      ),
    );
  }
}
