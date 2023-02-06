import 'package:fa_flutter_ui_kit/src/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../config/typedef.dart';
import 'widgets.dart';

class Calendar extends StatefulWidget {
  final DateTime startDate;
  final DateTime? selectedDate;
  final int? dayDiff;
  final DateSelected onDateSelected;
  final double? rowCellHeight;
  final double? cellWidth;

  const Calendar({
    Key? key,
    required this.startDate,
    this.dayDiff,
    required this.onDateSelected,
    this.selectedDate,
    this.cellWidth,
    this.rowCellHeight,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  void initState() {
    super.initState();
    updateCalendarConstraints();
  }

  void updateCalendarConstraints() {
    if (widget.cellWidth != null) {
      dayCellWidth = widget.cellWidth ?? 28;
    }

    if (widget.rowCellHeight != null) {
      weekRowHeight = widget.rowCellHeight ?? 32;
    }
  }

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
                  widget.onDateSelected(
                      widget.startDate.subtract(Duration(days: 1)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: DateChip(
                    text: Constants.text_yesterday,
                    date: widget.startDate.subtract(Duration(days: 1)),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  widget.onDateSelected(widget.startDate);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: DateChip(
                    text: Constants.text_today,
                    date: widget.startDate,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Year.fromRange(
              widget.startDate,
              widget.dayDiff ?? 365,
              widget.onDateSelected,
              widget.selectedDate,
            ),
          )
        ],
      ),
    );
  }
}
