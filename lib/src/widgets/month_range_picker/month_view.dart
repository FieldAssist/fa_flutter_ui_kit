import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';

class MonthView extends StatefulWidget {
  const MonthView({
    Key? key,
  }) : super(key: key);

  @override
  State<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  var selectedMonths = <String>[];
  void validate() {
    if (selectedMonths.length == 3) {
      for (var element in calendarItem) {
        element.isEnabled = false;
      }
    } else {}
  }

  bool isRounded = false;

  List<ItemModel> calendarItem = Constants.monthList
      .map<ItemModel>(
        (e) => ItemModel(month: e),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    // validate();
    return Expanded(
      child: GridView.custom(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 80, mainAxisExtent: 60),
        childrenDelegate: SliverChildListDelegate(
          List<Widget>.generate(calendarItem.length, (index) {
            final e = calendarItem[index];
            return ExcludeSemantics(
              child: GestureDetector(
                onTap: e.isEnabled || e.isTapped
                    ? () {
                        if (e.isTapped) {
                          for (int i = 0; i < selectedMonths.length; i++) {
                            selectedMonths.removeAt(i);
                          }
                          setState(() {});
                        } else {
                          for (int i = index; i < index + 3; i++) {
                            calendarItem[i].isSelected = true;
                            calendarItem[i].isTapped = true;
                            selectedMonths.add(calendarItem[i].month);
                          }
                          validate();
                          setState(() {
                            // e.isTapped = !e.isTapped;
                            // e.isSelected = !e.isSelected;
                          });
                        }
                      }
                    : null,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: e.isTapped
                          ? Colors.blue.withOpacity(0.5)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(isRounded ? 30 : 0)),
                  alignment: Alignment.center,
                  child: Text(
                    e.month,
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: e.isEnabled || e.isSelected
                              ? Colors.black
                              : Colors.grey[400],
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ),
            );
          }),
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}

class ItemModel {
  ItemModel({
    this.disabledColor,
    required this.month,
    this.ontap,
    this.selectedColor,
    this.unSelectedColor,
    this.isSelected = false,
    this.isTapped = false,
    this.isEnabled = true,
    this.isCurrentMonth = false,
  });
  final Function(String)? ontap;
  final String month;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final Color? disabledColor;
  bool isEnabled;
  bool isCurrentMonth;
  bool isTapped;
  bool isSelected;
}
