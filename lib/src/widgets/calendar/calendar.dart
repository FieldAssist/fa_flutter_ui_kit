import 'package:fa_flutter_ui_kit/src/constants/constants.dart';
import 'package:flutter/material.dart';
import '../../config/typedef.dart';
import 'widgets.dart';

class Calendar extends StatelessWidget {
  final DateTime startDate;
  final DateTime? selectedDate;
  final int? dayDiff;
  final DateSelected onDateSelected;

  const Calendar({
    Key? key,
    required this.startDate,
    this.dayDiff,
    required this.onDateSelected,
    this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.dialogHeight,
      width: Constants.dialogWidth,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  onDateSelected(startDate.subtract(Duration(days: 1)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: DateChip(
                    text: Constants.text_yesterday,
                    date: startDate.subtract(Duration(days: 1)),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  onDateSelected(startDate);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: DateChip(
                    text: Constants.text_today,
                    date: startDate,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Year.fromRange(
              startDate,
              dayDiff ?? 365,
              onDateSelected,
              selectedDate,
            ),
          )
        ],
      ),
    );
  }
}
