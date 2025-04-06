import 'package:fa_flutter_ui_kit/src/widgets/searchable_drop_down/searchable_bottom_sheet/searchable_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SearchableDropDownWidget<T> extends StatefulWidget {
  const SearchableDropDownWidget({
    required this.items,
    required this.itemBuilder,
    required this.onSearch,
    required this.selectedItem,
    this.shouldAlwaysShowSearchField = false,
    this.showSearchAfterN = 10,
    this.onSelect,
    this.controller,
    this.title,
    this.titleText = "Search",
    this.inputDecoration,
    this.fieldDecoration,
    this.contentPadding,
    this.header,
    this.bottomSheetConstraints,
    this.fieldColor,
    Key? key,
  }) : super(key: key);

  /// List of items that you want to display
  final List<T> items;

  final Decoration? fieldDecoration;

  final EdgeInsetsGeometry? contentPadding;

  /// Callback which will be called when item is selected
  final void Function(T value)? onSelect;

  /// Provide widget that you want to display
  final Widget Function(T item) itemBuilder;

  /// TextEditingController that will be used for search Field
  final TextEditingController? controller;

  /// Widget that will be displayed on the top of bottomSheet.
  final Widget? title;

  /// Widget shown as header at the top of dropdown
  final Widget? header;

  /// Text that will be shown at the top of bottomSheet
  /// when [title] is null then titleText will be used
  final String titleText;

  /// All items those condition is true will be visible
  ///
  /// here item is [String] type and
  /// it will return all the items that matches with query.
  /// ```dart
  /// return item.toLowerCase().contains(query.toLowerCase())
  /// ```
  final bool Function(T item, String query) onSearch;

  /// Decoration for the search field.
  final InputDecoration? inputDecoration;

  /// when `false` then it will only show search field
  /// when there are less then [showSearchAfterN] items.
  ///
  /// when `true` then it will always show search field.
  final bool shouldAlwaysShowSearchField;

  /// Search field will be shown
  /// when list has more then [showSearchAfterN] items
  final int showSearchAfterN;

  final Widget selectedItem;

  final BoxConstraints? bottomSheetConstraints;

  final Color? fieldColor;

  @override
  State<SearchableDropDownWidget<T>> createState() =>
      _SearchableDropDownWidgetState<T>();
}

class _SearchableDropDownWidgetState<T>
    extends State<SearchableDropDownWidget<T>> {
  late T selectedValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
          context: context,
          builder: (context) {
            return SearchableBottomSheet<T>(
              constraints: widget.bottomSheetConstraints ??
                  BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 1.4,
                  ),
              items: widget.items,
              titleText: widget.titleText,
              title: widget.title,
              inputDecoration: widget.inputDecoration,
              onSearch: widget.onSearch,
              onSelect: (value) {
                selectedValue = value;
                setState(() {});
                Navigator.of(context).pop();
                widget.onSelect?.call(value);
              },
              itemBuilder: widget.itemBuilder,
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.header != null) widget.header ?? SizedBox(),
          Container(
            padding: widget.contentPadding ?? EdgeInsets.all(12),
            decoration: widget.fieldDecoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  color: widget.fieldColor,
                  border: Border.all(width: 0.4),
                ),
            child: widget.selectedItem,
          ),
        ],
      ),
    );
  }
}
