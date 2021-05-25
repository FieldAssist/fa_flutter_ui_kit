import 'package:flutter/material.dart';

import 'search_list.dart';
import 'integrated_search_bar.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool enableSearch;
  final String appBarTitle;
  final String searchBarTitle;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;

  const SearchAppBar({
    required this.enableSearch,
    required this.appBarTitle,
    this.searchBarTitle = 'Search',
    this.bottom,
    this.actions,
  });

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(56);
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    return _isSearchActive
        ? IntegratedSearchBar(
            backgroundColor: Colors.white,
            leading: BackButton(
              onPressed: () => setState(
                () {
                  searchQueryController.clear();
                  _isSearchActive = !_isSearchActive;
                },
              ),
            ),
            searchFieldLabel: widget.searchBarTitle,
            queryTextController: searchQueryController,
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
                  if (searchQueryController.value.text.isEmpty) {
                    setState(() => _isSearchActive = !_isSearchActive);
                  } else {
                    searchQueryController.clear();
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
            bottom: widget.bottom,
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
              if (widget.actions != null) ...widget.actions!
            ],
          );
  }
}