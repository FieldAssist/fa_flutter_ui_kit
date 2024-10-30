import 'dart:developer';

import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/widgets/month_range_picker/selected_month_indicator.dart';
import 'package:flutter/material.dart';

class MonthView extends StatefulWidget {
  final Function(
    DateTime start,
    DateTime end,
  ) callback;
  final currentYear;
  final Color selectedColour;
  final int maxMonthSelectable;
  const MonthView({
    required this.callback,
    Key? key,
    this.currentYear,
    required this.maxMonthSelectable,
    required this.selectedColour,
  }) : super(key: key);

  @override
  State<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  var selectedMonths = <DateTime>[];
  late int currentYear;
  late int selectedYear;
  static const double iconSize = 12;
  List<ItemModel> calendarItem = [];
  bool isRounded = false;

  void valueCounter(YearCounter counterType) {
    if (counterType == YearCounter.increment) {
      if (selectedYear != DateTime.now().year) {
        selectedYear++;
      }
    } else {
      selectedYear = DateTime.now().year - 1;
    }
    // selectedMonths.clear();
    generateMonths();
  }

  // int currentYear = 0;
  // void validate() {
  //   if (selectedMonths.length >= 3) {
  //     for (var element in calendarItem) {
  //       element.isEnabled = false;
  //     }
  //   }
  // }

  DateTime get startMonth {
    if (selectedMonths.isNotEmpty) {
      return selectedMonths.first;
    } else
      return DateTime.now();
  }

  DateTime get endMonth {
    if (selectedMonths.isNotEmpty) {
      return selectedMonths.last;
    } else
      return DateTime.now();
  }

  // int getYear() {
  //   return currentYear;
  // }
  void generateMonths() async {
    calendarItem = List.generate(
      Constants.monthList.length,
      (index) {
        final item = Constants.monthList[index];
        final model = ItemModel(monthYear: DateTime(selectedYear, index + 1));
        if (selectedYear < currentYear) {
          final allowedMonth =
              (DateTime.now().month - widget.maxMonthSelectable).abs();
          model.canSelect = index + allowedMonth >= 12;
        } else {
          model.canSelect =
              (DateTime.now().month > Constants.monthList.indexOf(item));
        }
        return model;
      },
    );

    setState(() {});
  }

  bool get showYearSelector =>
      (DateTime.now().month - widget.maxMonthSelectable).isNegative;

  @override
  void initState() {
    currentYear = DateTime.now().year;
    selectedYear = currentYear;
    generateMonths();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(selectedMonths.toString());
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Month Indicator
          LayoutBuilder(builder: (context, cons) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectedMonthIndicator(
                    month: selectedMonths.isEmpty
                        ? '--'
                        : Constants.monthList[selectedMonths[0].month - 1] +
                            '-' +
                            selectedMonths[0].year.toString(),
                    label: 'Start Month',
                    selectedColour: widget.selectedColour,
                  ),
                  SelectedMonthIndicator(
                    month: selectedMonths.isEmpty
                        ? '--'
                        : Constants.monthList[selectedMonths.last.month - 1] +
                            '-' +
                            selectedMonths.last.year.toString(),
                    label: 'End Month',
                    selectedColour: widget.selectedColour,
                  ),
                ],
              ),
            );
          }),
          // Year Selector

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  splashRadius: 12,
                  onPressed: !showYearSelector
                      ? null
                      : () {
                          valueCounter(YearCounter.decrement);
                        },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: iconSize,
                  )),
              Text(
                '$selectedYear',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              (selectedYear != DateTime.now().year)
                  ? IconButton(
                      splashRadius: 12,
                      onPressed: !showYearSelector
                          ? null
                          : () {
                              valueCounter(YearCounter.increment);
                            },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: iconSize,
                      ))
                  : const Padding(
                      padding: EdgeInsets.all(15),
                    ),
            ],
          ),

          // Month View
          GridView.custom(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 80,
              mainAxisExtent: 60,
            ),
            childrenDelegate: SliverChildListDelegate(
              [
                ...List<Widget>.generate(calendarItem.length, (index) {
                  final e = calendarItem[index];

                  return GestureDetector(
                    onTap: (e.isEnabled || e.isTapped) && e.canSelect
                        ? () {
                            if (e.isTapped) {
                              // selectedMonths.clear();
                              widget.callback.call(
                                  DateTime.now().copyWith(
                                      month: DateTime.now().month - 1),
                                  DateTime.now());
                              for (var data in calendarItem) {
                                data.isEnabled = true;
                                data.isTapped = false;
                                data.isSelected = false;
                              }

                              setState(() {});
                            } else {
                              if (selectedMonths.length < 3) {
                                if (selectedMonths.length == 0) {
                                  for (var data in calendarItem) {
                                    data.isEnabled = false;
                                    data.isTapped = false;
                                    data.isSelected = false;
                                  }
                                  for (int i = index;
                                      i < 12 && i < index + 3;
                                      i++) {
                                    if (calendarItem[i].canSelect) {
                                      calendarItem[i].isEnabled = true;
                                    }
                                  }
                                }
                                calendarItem[index].isSelected = true;
                                calendarItem[index].isTapped = true;
                                selectedMonths
                                    .add(calendarItem[index].monthYear);
                                setState(() {});
                              }

                              // validate();
                            }
                          }
                        : null,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: e.isTapped
                              ? widget.selectedColour
                              : Colors.transparent,
                          borderRadius:
                              BorderRadius.circular(isRounded ? 30 : 0)),
                      alignment: Alignment.center,
                      child: Text(
                        Constants.monthList[e.monthYear.month - 1],
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color:
                                  (e.isEnabled || e.isSelected) && e.canSelect
                                      ? Colors.black
                                      : Colors.grey[400],
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                  );
                })
              ],
              addRepaintBoundaries: false,
            ),
          ),
          //Done Button
          Container(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  widget.callback.call(startMonth, endMonth);
                },
                child: Text(Constants.done,
                    style: TextStyle(color: widget.selectedColour)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemModel {
  ItemModel({
    this.disabledColor,
    required this.monthYear,
    // required this.year,
    this.ontap,
    this.selectedColor,
    this.unSelectedColor,
    this.isSelected = false,
    this.isTapped = false,
    this.canSelect = true,
    this.isEnabled = true,
    this.isCurrentMonth = false,
  });
  final Function(String)? ontap;
  final DateTime monthYear;
  // final String month;
  // final String year;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final Color? disabledColor;
  bool isEnabled;
  bool isCurrentMonth;
  bool isTapped;
  bool canSelect;
  bool isSelected;
}

enum YearCounter { increment, decrement }
