import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/modules/common/search_list/search_app_bar.dart';
import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/index.dart';
import 'package:flutter/material.dart';

class SearchListItem {
  SearchListItem({
    required this.title,
    this.subtitle,
    this.isSelected = false,
  });

  final String title;
  final String? subtitle;
  final bool isSelected;
}

typedef SearchItemBuilder<T> = Widget Function(T item, bool isSelected);

typedef GetSelectedItem<T> = void Function(T? item);

typedef OnItemSearch<T> = bool Function(T item, String query);

typedef BottomActionBuilder = Widget Function();

class SearchList<T> extends StatefulWidget {
  SearchList({
    required this.data,
    required this.selectedItem,
    required this.itemBuilder,
    this.onBottomBarTap,
    this.bottomBarTitle = 'NEXT',
    this.onSearch,
    this.bottomBarColor = const Color(0xff0097cd),
    this.bottomBarTitleColor = Colors.white,
    this.displayBottomBarIcon = true,
    this.bottomActionBuilder,
    this.showBottomActionBar = true,
    this.showDefaultAppBar = true,
    this.appBarTitle,
    this.searchBarTitle,
    this.enableSearch,
    this.textEditingController,
    this.appBarSubTitle,
    this.showDivider = true,
    this.defaultAppBarColor,
    this.defaultAppBarTextColor,
    Key? key,
  })  : assert(!showDefaultAppBar ? textEditingController != null : true),
        super(key: key);

  final List<T> data;
  final SearchItemBuilder<T> itemBuilder;
  final GetSelectedItem<T> selectedItem;
  final OnItemSearch<T>? onSearch;
  final VoidCallback? onBottomBarTap;
  final String bottomBarTitle;
  final bool displayBottomBarIcon;
  final BottomActionBuilder? bottomActionBuilder;
  final bool showBottomActionBar;
  final bool showDefaultAppBar;
  final bool? enableSearch;
  final String? appBarTitle;
  final String? searchBarTitle;
  final TextEditingController? textEditingController;
  final String? appBarSubTitle;
  final bool showDivider;
  final Color? defaultAppBarColor;
  final Color? defaultAppBarTextColor;
  final Color bottomBarColor;
  final Color bottomBarTitleColor;

  @override
  _SearchListState<T> createState() => _SearchListState<T>();
}

class _SearchListState<T> extends State<SearchList<T>> {
  List<T> get list => widget.data;
  late SearchListBloc<T> _bloc;
  late Map<T, bool> selectedItemMap;
  int lastSelectedItemIndex = -1;
  TextEditingController? searchQueryController;

  @override
  void initState() {
    super.initState();

    searchQueryController = !widget.showDefaultAppBar
        ? widget.textEditingController!
        : TextEditingController();

    searchQueryController!.addListener(_onSearchQueryChanged);

    selectedItemMap = {for (var item in list) item: false};
    _bloc = SearchListBloc<T>(
      searchItems: list,
      isItemSelectedMap: selectedItemMap,
      onSearch: widget.onSearch ?? (_, q) => true,
    );
  }

  void _onSearchQueryChanged() {
    _bloc.searchList(searchQueryController!.text);
  }

  @override
  Widget build(BuildContext context) {
    Widget _child = checkIfListIsNotEmpty(list)
        ? StreamBuilder<Map<T, bool>>(
            stream: _bloc.filteredList,
            initialData: selectedItemMap,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text('Nothing Found'),
                );
              }
              final itemMap = snapshot.data!;
              final list = itemMap.keys.toList();
              if (!checkIfListIsNotEmpty(list)) {
                return Center(
                  child: Text(
                    'No Data Found',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                );
              }
              return ListView.separated(
                itemCount: list.length,
                itemBuilder: (c, i) {
                  final item = list[i];
                  final isSelected = itemMap[item]!;
                  return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        // setState(() {
                        //   selectedItemList[i] = true;
                        //   if (lastSelectedItemIndex != -1) {
                        //     selectedItemList[lastSelectedItemIndex] = false;
                        //   }
                        //   lastSelectedItemIndex = i;
                        // });
                        _bloc.updateSelectedItem(item);
                        widget.selectedItem(!isSelected ? item : null);
                      },
                      child: widget.itemBuilder(
                        item,
                        isSelected,
                      ));
                },
                separatorBuilder: (
                  context,
                  index,
                ) =>
                    widget.showDivider
                        ? const Divider(
                            thickness: 0,
                          )
                        : Container(
                            height: 4,
                          ),
              );
            },
          )
        : Center(
            child: Text(
              'No Data Found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          );

    return widget.showDefaultAppBar
        ? Scaffold(
            appBar: SearchAppBar(
              textColor: widget.defaultAppBarTextColor ?? Colors.black,
              appBarColor: widget.defaultAppBarColor,
              textEditingController: searchQueryController!,
              enableSearch: widget.enableSearch ?? true,
              appBarTitle: widget.appBarTitle ?? 'Select',
              searchBarTitle: widget.searchBarTitle ?? 'Search',
              appBarSubTitle: widget.appBarSubTitle,
            ),
            body: _child,
            bottomNavigationBar: !widget.showBottomActionBar
                ? null
                : widget.bottomActionBuilder != null
                    ? widget.bottomActionBuilder!.call()
                    : BottomActionButton(
                        title: widget.bottomBarTitle,
                        showIcon: widget.displayBottomBarIcon,
                        onPressed: widget.onBottomBarTap,
                        color: widget.bottomBarColor,
                        titleColor: widget.bottomBarTitleColor,
                        icon: Icon(
                          Icons.arrow_forward,
                          color: widget.bottomBarTitleColor,
                          size: 18,
                        ),
                      ),
          )
        : _child;
  }
}

class SearchListBloc<T> {
  SearchListBloc(
      {required this.searchItems,
      required this.isItemSelectedMap,
      required this.onSearch});

  final List<T> searchItems;
  final isItemSelectedMap;

  T? lastSelectedItem;

  final OnItemSearch<T> onSearch;

  final _subjectListSearchQuery = BehaviorSubject.seeded('');

  final _subjectSelectedItem = BehaviorSubject<T?>.seeded(null);

  Stream<String> get listSearchQuery =>
      _subjectListSearchQuery.stream.debounceTime(
        const Duration(milliseconds: 300),
      );

  Stream<T?> get selectedItemStream => _subjectSelectedItem.stream;

  Stream<Map<T, bool>> get filteredList {
    // return listSearchQuery.transform(
    //   StreamTransformer.fromHandlers(
    //     handleData: (query, sink) {
    //       var list = searchItems;
    //       if (query.isNotEmpty) {
    //         list = searchItems
    //             .where(
    //               (item) => onSearch(item, query),
    //             )
    //             .toList();
    //       }
    //       sink.add(list);
    //     },
    //   ),
    // );

    return Rx.combineLatest2<String, T?, Map<T, bool>>(
        listSearchQuery, selectedItemStream, (query, item) {
      var itemList = searchItems;
      var searchItemMap = <T, bool>{};
      if (query.isNotEmpty) {
        itemList = searchItems
            .where(
              (item) => onSearch(item, query),
            )
            .toList();
      }

      searchItemMap.addEntries(
        itemList.map(
          (e) => MapEntry(e, isItemSelectedMap[e]!),
        ),
      );

      return searchItemMap;
    });
  }

  void searchList(String query) {
    _subjectListSearchQuery.add(query);
  }

  void updateSelectedItem(T selectedItem) {
    if (isItemSelectedMap[selectedItem]) {
      isItemSelectedMap[selectedItem] = false;
      lastSelectedItem = null;
      _subjectSelectedItem.add(null);
      return;
    }

    isItemSelectedMap[selectedItem] = true;

    if (lastSelectedItem != null) {
      isItemSelectedMap[lastSelectedItem!] = false;
    }

    lastSelectedItem = selectedItem;

    _subjectSelectedItem.add(selectedItem);
  }

  void dispose() {
    _subjectListSearchQuery.close();
    _subjectSelectedItem.close();
  }
}
