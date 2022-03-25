import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/widgets/month_range_picker/selected_month_indicator.dart';
import 'package:flutter/material.dart';

class MonthView extends StatefulWidget {
  final Function(
    int startMonthNumber,
    int endMonthNumber,
    String startMonth,
    String endmonth,
    int currentYear,
  ) callback;
  final currentYear;
  final Color selectedColour;
  const MonthView({
    required this.callback,
    Key? key,
    this.currentYear,
    required this.selectedColour,
  }) : super(key: key);

  @override
  State<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  var selectedMonths = <String>[];
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
      selectedYear--;
    }
    selectedMonths.clear();
    generateMonths();
  }

  // int currentYear = 0;
  void validate() {
    if (selectedMonths.length >= 3) {
      for (var element in calendarItem) {
        element.isEnabled = false;
      }
    }
  }

  String startMonth() {
    if (selectedMonths.isNotEmpty) {
      return selectedMonths.first;
    } else
      return '';
  }

  String endMonth() {
    if (selectedMonths.isNotEmpty) {
      return selectedMonths.last;
    } else
      return '';
  }

  // int getYear() {
  //   return currentYear;
  // }
  void generateMonths() async {
    calendarItem = Constants.monthList
        .map<ItemModel>(
          (e) => ItemModel(
              month: e,
              year: selectedYear.toString(),
              canSelect: selectedYear != currentYear ||
                  DateTime.now().month > Constants.monthList.indexOf(e)),
        )
        .toList();

    // await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  @override
  void initState() {
    currentYear = DateTime.now().year;
    selectedYear = currentYear;
    generateMonths();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // Month Indicator
          LayoutBuilder(builder: (context, cons) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectedMonthIndicator(
                    month: selectedMonths.isEmpty
                        ? '--'
                        : selectedMonths[0] + '-' + selectedYear.toString(),
                    label: 'Start Month',
                    selectedColour: widget.selectedColour,
                  ),
                  SelectedMonthIndicator(
                    month: selectedMonths.isEmpty
                        ? '--'
                        : selectedMonths.last + '-' + selectedYear.toString(),
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
                  onPressed: () {
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
                      onPressed: () {
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
                              selectedMonths.clear();
                              widget.callback.call(0, 0, '', '', currentYear);
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
                                selectedMonths.add(calendarItem[index].month);
                                setState(() {});
                              }

                              // validate();

                            }
                            int sMonth = calendarItem.indexWhere(
                                (element) => element.month == startMonth());
                            int eMonth = calendarItem.indexWhere(
                                (element) => element.month == endMonth());
                            widget.callback.call(sMonth + 1, eMonth + 1,
                                startMonth(), endMonth(), selectedYear);
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
                        e.month,
                        style: Theme.of(context).textTheme.button?.copyWith(
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
        ],
      ),
    );
  }
}

class ItemModel {
  ItemModel({
    this.disabledColor,
    required this.month,
    required this.year,
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
  final String month;
  final String year;
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
