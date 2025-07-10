import 'package:fa_flutter_ui_kit/src/constants/constants.dart';
import 'package:flutter/material.dart';
import '../../config/typedef.dart';
import 'models.dart';
import 'widgets.dart';

class RangeCalendar extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final int dayDiff;
  final DateRangeSelected dateRangeSelected;
  final bool showMtdL3m;
  final int shiftEndDate;
  final double? rowCellHeight;
  final double? cellWidth;

  const RangeCalendar({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.dayDiff,
    required this.dateRangeSelected,
    this.showMtdL3m = false,
    this.shiftEndDate = 0,
    this.cellWidth,
    this.rowCellHeight,
  }) : super(key: key);

  @override
  State<RangeCalendar> createState() => _WidgetStateRC();
}

class _WidgetStateRC extends State<RangeCalendar> {
  late bool _start;
  DateTime? _date1;
  DateTime? _date2;
  int? _dayDiff;
  DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    updateCalendarConstraints();
    _start = true;
    _date1 = widget.startDate;
    _date2 = widget.endDate;
    _dayDiff = widget.dayDiff;
  }

  DateTime? _startDate() {
    if (ModelMonth.dateCompare(_date1!, _date2!) == 1) {
      return _date1;
    }
    return _date2;
  }

  DateTime? _endDate() {
    if (ModelMonth.dateCompare(_date1!, _date2!) == 1) {
      return _date2;
    }
    return _date1;
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
        children: <Widget>[
          if (widget.showMtdL3m)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    final endDate = DateTime.now().subtract(Duration(days: 1));
                    widget.dateRangeSelected(
                      DateTime(endDate.year, endDate.month, 1),
                      endDate,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: DateChip1(
                      text: Constants.text_mtd,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _date1 = DateTime.now();
                      _date2 = DateTime.now().subtract(Duration(days: 90));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: DateChip1(
                      text: Constants.text_last_three_month,
                    ),
                  ),
                )
              ],
            ),
          Expanded(
            flex: 1,
            child: Year.forRange(
                _currentDate, _startDate(), _endDate(), _dayDiff ?? 365,
                (date) {
              setState(() {
                if (_start) {
                  if (_date1 != null) {
                    _date1 = _date2 = null;
                  }
                  _date1 = _date2 = date;
                } else {
                  _date2 = date;
                  if (widget.shiftEndDate != 0) {
                    if (dateUtility.daysBetween(
                            _date1 ?? DateTime.now(), date) >
                        widget.shiftEndDate) {
                      _date2 = _date1;
                      _start = !_start;
                      displaySnackbar(
                        context: context,
                        message:
                            "Please select within ${widget.shiftEndDate} days from start date.",
                        color: Colors.red,
                      );
                    }
                  }
                }
                _start = !_start;
              });
            }),
          ),
          Container(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  widget.dateRangeSelected(_startDate()!, _endDate()!);
                },
                child: Text(
                  Constants.text_done,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
