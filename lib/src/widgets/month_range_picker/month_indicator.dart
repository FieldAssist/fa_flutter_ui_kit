import 'package:fa_flutter_ui_kit/src/widgets/month_range_picker/month_calendar.dart';
import 'package:flutter/material.dart';

import 'selected_month_indicator.dart';

class MonthIdicator extends StatelessWidget {
  const MonthIdicator({
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
                ? 'Jan-2021'
                : selectedMonths[0] + '-' + currentYear.toString(),
            label: 'Start Month',
          ),
          SelectedMonthIndicator(
            width: cons.maxWidth * 0.45,
            month: selectedMonths.isEmpty
                ? 'Jan-2021'
                : selectedMonths[2] + '-' + currentYear.toString(),
            label: 'End Month',
          ),
        ],
      );
    });
  }
}
