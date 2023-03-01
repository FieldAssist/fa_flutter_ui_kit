import 'package:fa_flutter_ui_kit/src/widgets/searchable_drop_down/searchable_bottom_sheet/bloc/searchable_bottom_sheet_bloc.dart';
import 'package:flutter/material.dart';

class SearchableBottomSheet<T> extends StatefulWidget {
  /// Here only mention type [T] not the [List<T>].
  ///
  /// for example
  /// in case of List<String>
  /// only mention String as generic type not List<String>
  const SearchableBottomSheet({
    required this.items,
    required this.onSelect,
    required this.itemBuilder,
    required this.onSearch,
    this.controller,
    this.title,
    this.titleText = "Search",
    this.inputDecoration,
    this.shouldAlwaysShowSearchField = false,
    this.showSearchAfterN = 10,
    this.constraints,
    Key? key,
  }) : super(key: key);

  /// List of items that you want to display
  final List<T> items;

  /// Callback which will be called when item is selected
  final void Function(T value)? onSelect;

  /// Provide widget that you want to display
  final Widget Function(T item) itemBuilder;

  /// TextEditingController that will be used for search Field
  final TextEditingController? controller;

  /// Widget that will be displayed on the top of bottomSheet.
  final Widget? title;

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

  final BoxConstraints? constraints;

  @override
  State<SearchableBottomSheet<T>> createState() =>
      _SearchableBottomSheetState<T>();
}

class _SearchableBottomSheetState<T> extends State<SearchableBottomSheet<T>> {
  late final SearchableBottomSheetBloc<T> _bloc;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _bloc = SearchableBottomSheetBloc<T>(
      onSearch: widget.onSearch,
      items: widget.items,
    )..init();

    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(onQueryChange);
  }

  void onQueryChange() => _bloc.searchList(_controller.text);

  @override
  void dispose() {
    _controller.removeListener(onQueryChange);
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: widget.constraints,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.title ??
              Text(
                widget.titleText,
                style: Theme.of(context).textTheme.titleLarge,
              ),
          if (_shouldShowSearchField())
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextFormField(
                controller: _controller,
                decoration: widget.inputDecoration,
              ),
            ),
          Flexible(
            child: StreamBuilder<List<T>?>(
              stream: _bloc.filteredStream,
              initialData: widget.items,
              builder: (context, snapshot) {
                final searchableItems = snapshot.data ?? [];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchableItems.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: widget.onSelect == null
                          ? null
                          : () => widget.onSelect!(searchableItems[index]),
                      child: widget.itemBuilder(searchableItems[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool _shouldShowSearchField() =>
      (widget.shouldAlwaysShowSearchField) ||
      (widget.items.length > widget.showSearchAfterN);
}
