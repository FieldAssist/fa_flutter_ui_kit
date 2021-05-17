import 'dart:async';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/index.dart';
import 'package:flutter/material.dart';

import 'integrated_search_bar.dart';

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

typedef GetSelectedItem<T> = void Function(T item);

typedef OnItemSearch<T> = bool Function(T item, String query);

class SearchList<T> extends StatefulWidget {
  SearchList({
    required this.data,
    required this.selectedItem,
    required this.onBottomBarTap,
    required this.bottomBarTitle,
    required this.itemBuilder,
    this.onSearch,
    this.bottomBarColor = const Color(0xff0097cd),
    this.bottomBarTitleColor = Colors.white,
    this.enableSearch = true,
    this.displayBottomBarIcon = true,
    this.appBarTitle = 'Select Beats',
    this.searchBarTitle = 'Search for Beats',
    Key? key,
  }) : super(key: key);

  final List<T> data;
  final SearchItemBuilder<T> itemBuilder;
  final GetSelectedItem<T> selectedItem;
  final OnItemSearch<T>? onSearch;
  final VoidCallback? onBottomBarTap;
  final String bottomBarTitle;
  final bool enableSearch;
  final bool displayBottomBarIcon;
  final String appBarTitle;
  final String searchBarTitle;

  final Color bottomBarColor;
  final Color bottomBarTitleColor;

  @override
  _SearchListState<T> createState() => _SearchListState<T>();
}

class _SearchListState<T> extends State<SearchList<T>> {
  List<T> get list => widget.data;
  late SearchListBloc<T> _bloc;

  bool _isSearchActive = false;

  final _searchQueryController = TextEditingController();

  late Map<T, bool> selectedItemMap;
  int lastSelectedItemIndex = -1;

  @override
  void initState() {
    super.initState();
    _searchQueryController.addListener(_onSearchQueryChanged);
    selectedItemMap = {for (var item in list) item: false};
    _bloc = SearchListBloc<T>(
      searchItems: list,
      isItemSelectedMap: selectedItemMap,
      onSearch: widget.onSearch ?? (_, q) => true,
    );
  }

  void _onSearchQueryChanged() {
    _bloc.searchList(_searchQueryController.text);
  }

  @override
  Widget build(BuildContext context) {
    final appBar = _isSearchActive
        ? IntegratedSearchBar(
            backgroundColor: Colors.white,
            leading: BackButton(
              onPressed: () => setState(
                () {
                  _searchQueryController.clear();
                  _isSearchActive = !_isSearchActive;
                },
              ),
            ),
            searchFieldLabel: widget.searchBarTitle,
            queryTextController: _searchQueryController,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.black54,
                ),
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                onPressed: () {
                  if (_searchQueryController.value.text.isEmpty) {
                    setState(() => _isSearchActive = !_isSearchActive);
                  } else {
                    _searchQueryController.clear();
                  }
                },
              )
            ],
          )
        : AppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            title: Text(widget.appBarTitle),
            actions: <Widget>[
              if (widget.enableSearch)
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 8,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _isSearchActive = !_isSearchActive;
                        });
                      }),
                ),
            ],
          );
    return WillPopScope(
      onWillPop: () async {
        if (_isSearchActive) {
          setState(() {
            _searchQueryController.clear();
            _isSearchActive = !_isSearchActive;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: appBar as PreferredSizeWidget,
        body: checkIfListIsNotEmpty(list)
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
                          onTap: () {
                            // setState(() {
                            //   selectedItemList[i] = true;
                            //   if (lastSelectedItemIndex != -1) {
                            //     selectedItemList[lastSelectedItemIndex] = false;
                            //   }
                            //   lastSelectedItemIndex = i;
                            // });
                            _bloc.updateSelectedItem(item);
                            widget.selectedItem(item);
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
                        const Divider(
                      thickness: 1,
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
              ),
        bottomNavigationBar: BottomActionButton(
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
      ),
    );
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

  final _subjectSelectedItem = BehaviorSubject<T>();

  Stream<String> get listSearchQuery =>
      _subjectListSearchQuery.stream.debounceTime(
        const Duration(milliseconds: 300),
      );

  ValueStream<T> get selectedItemStream => _subjectSelectedItem.stream;

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

    return Rx.combineLatest2<String, T, Map<T, bool>>(
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
