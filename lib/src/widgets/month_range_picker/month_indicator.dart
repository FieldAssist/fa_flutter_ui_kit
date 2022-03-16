import 'package:fa_flutter_ui_kit/src/widgets/month_range_picker/month_calendar.dart';
import 'package:flutter/material.dart';

import 'selected_month_indicator.dart';

class MonthIndicator extends StatelessWidget {
  final List<String> selectedMonths;
  final int? currentYear;
  const MonthIndicator({
    required this.selectedMonths,
    required this.currentYear,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SelectedMonthIndicator(
            width: cons.maxWidth * 0.45,
            month: selectedMonths.isEmpty
                ? '--'
                : selectedMonths[0] + '-' + currentYear.toString(),
            label: 'Start Month',
          ),
          SelectedMonthIndicator(
            width: cons.maxWidth * 0.45,
            month: selectedMonths.isEmpty
                ? '--'
                : selectedMonths[1] + '-' + currentYear.toString(),
            label: 'End Month',
          ),
        ],
      );
    });
  }
}
