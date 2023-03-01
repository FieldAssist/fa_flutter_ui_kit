import 'dart:developer';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit_sample_app/widget_preview.dart';

enum Position { bottom, center }

class WidgetData {
  final Position position;
  final Widget widget;
  final String name;

  WidgetData({
    this.position = Position.center,
    required this.widget,
    required this.name,
  });
}

class IndexScreen extends StatelessWidget {
  final _list = [
    WidgetData(
      widget: ShowMonthRangePicker(),
      name: "Month Range Picker",
    ),
    WidgetData(
      widget: ShowCalendarDatePicker(),
      name: "Date Picker",
    ),
    WidgetData(
      widget: ShowRangeCalendarDatePicker(),
      name: "Date Range Picker",
    ),
    WidgetData(
      widget: InternetNotAvailable(() {}),
      name: "Internet Not Available",
    ),
    WidgetData(
      position: Position.bottom,
      widget: BottomActionButton(
        title: "Press Me",
        onPressed: () {},
      ),
      name: "Bottom Action Button",
    ),
    WidgetData(
      widget: MyCircularProgress(),
      name: "My Circular Progress",
    ),
    WidgetData(
      widget: MyLinearProgressIndicator(),
      name: "My Linear Progress Indicator",
    ),
    WidgetData(
      widget: const NoItemsFound(),
      name: "No Items Found",
    ),
    WidgetData(
      widget: OutlinedIconButton(
        endAction: () {},
        endText: const Text(
          'Add',
        ),
        endIcon: const Icon(
          Icons.add,
        ),
      ),
      name: "Outlined Icon Button",
    ),
    WidgetData(
      widget: const ResponsiveContainer(
        child: Text(
          'This is a Responsive Container and currently its width is 100.0',
        ),
        width: 100.0,
      ),
      name: "Responsive Container",
    ),
    WidgetData(
      widget: const StreamLoadingWidget(
        message: 'We can display custom message here',
      ),
      name: "Stream Loading Widget",
    ),
    WidgetData(
      widget: SearchTextField(
        TextEditingController(),
      ),
      name: "Search Text Field",
    ),
    WidgetData(
      widget: const LaunchingGrowthImage(
        height: 100.0,
        width: 100.0,
      ),
      name: "Launching Growth Image",
    ),
    WidgetData(
      widget: const GenericDialog(
        title: 'Dialog Box',
        subtitle: 'SubTitle of the Box',
        buttonTextBgColor: Colors.teal,
      ),
      name: "Generic Dialog",
    ),
    WidgetData(
      widget: const ShowDialogBox(),
      name: "Progress Dialog",
    ),
    WidgetData(
      widget: const ShowSearchableDropDown(),
      name: "Searchable DropDown",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('UI Widgets'),
        ),
        body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (_, index) {
            return Card(
              child: SizedBox(
                height: 80.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return WidgetPreview(
                          widgetData: _list[index],
                        );
                      }),
                    );
                  },
                  child: Text(_list[index].name),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShowDialogBox extends StatefulWidget {
  const ShowDialogBox({Key? key}) : super(key: key);

  @override
  _ShowDialogBoxState createState() => _ShowDialogBoxState();
}

class _ShowDialogBoxState extends State<ShowDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomActionButton(
        title: "Press to Open Dialog Box",
        onPressed: () {
          setState(() {
            FAProgressDialog.show(context);
            FAProgressDialog.doneAndHide();
          });
        },
      ),
    );
  }
}

class ShowMonthRangePicker extends StatefulWidget {
  // final GlobalKey<NavigatorState>? navKeyMonthPicker =
  //     GlobalKey<NavigatorState>();
  ShowMonthRangePicker({Key? key}) : super(key: key);

  @override
  State<ShowMonthRangePicker> createState() => _ShowMonthRangePickerState();
}

class _ShowMonthRangePickerState extends State<ShowMonthRangePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomActionButton(
        title: "Press to Open Dialog Box",
        onPressed: () {
          DialogUtils.showMonthRangePicker(
            pickedRange: (startMonth, endMonth, sMonthName, eMonthName, year) {
              log('$startMonth($sMonthName)-$year -- $endMonth($eMonthName)-$year');
              Navigator.pop(context);
            },
            context: context,
          );
        },
      ),
    );
  }
}

class ShowCalendarDatePicker extends StatefulWidget {
  const ShowCalendarDatePicker({Key? key}) : super(key: key);

  @override
  State<ShowCalendarDatePicker> createState() => _ShowCalendarDatePickerState();
}

class _ShowCalendarDatePickerState extends State<ShowCalendarDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomActionButton(
        title: "Press to Open Dialog Box",
        onPressed: () {
          DialogUtils.showCalendarDatePicker(
              context: context,
              onDateSelected: (date) {
                Navigator.pop(context);
                print(date);
              },
              startDate: DateTime.now(),
              selectedDate: DateTime.now(),
              dayDiff: 37);
        },
      ),
    );
  }
}

class ShowRangeCalendarDatePicker extends StatefulWidget {
  const ShowRangeCalendarDatePicker({Key? key}) : super(key: key);

  @override
  State<ShowRangeCalendarDatePicker> createState() =>
      _ShowRangeCalendarDatePickerState();
}

class _ShowRangeCalendarDatePickerState
    extends State<ShowRangeCalendarDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomActionButton(
        title: "Press to Open Dialog Box",
        onPressed: () {
          DialogUtils.showRangeCalendarDatePicker(
              context: context,
              startDate: DateTime.now(),
              endDate: DateTime.now(),
              dayDiff: 365,
              shiftEndDate: 90,
              dateRangeSelected: (startDate, endDate) {
                print('$startDate  $endDate');
                Navigator.pop(context);
              });
        },
      ),
    );
  }
}

class ShowSearchableDropDown extends StatefulWidget {
  const ShowSearchableDropDown({Key? key}) : super(key: key);

  @override
  State<ShowSearchableDropDown> createState() => _ShowSearchableDropDownState();
}

class _ShowSearchableDropDownState extends State<ShowSearchableDropDown> {
  final List<int> items = List.generate(1000, (index) => index + 1);
  int? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchableDropDownWidget<int>(
          items: items,
          itemBuilder: (item) => ListTile(title: Text("$item")),
          onSearch: (item, query) => item.toString().contains(query),
          onSelect: (value) {
            selectedItem = value;
            setState(() {});
          },
          selectedItem: ListTile(
            title: Text("${selectedItem ?? "Select"}"),
          ),
        ),
      ],
    );
  }
}
