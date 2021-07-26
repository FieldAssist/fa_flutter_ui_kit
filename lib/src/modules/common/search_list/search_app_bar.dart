import 'package:flutter/material.dart';

import 'integrated_search_bar.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool enableSearch;
  final String appBarTitle;
  final String searchBarTitle;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final TextEditingController textEditingController;
  final String? appBarSubTitle;
  final Color? appBarColor;
  final Color textColor;
  final Widget? leading;

  const SearchAppBar(
      {required this.enableSearch,
      required this.appBarTitle,
      required this.textEditingController,
      this.searchBarTitle = 'Search',
      this.bottom,
      this.actions,
      this.appBarSubTitle,
      this.appBarColor,
      this.textColor = Colors.black,
      this.leading});

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize =>
      this.bottom == null ? Size.fromHeight(56) : Size.fromHeight(112);
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    return _isSearchActive
        ? IntegratedSearchBar(
            backgroundColor: widget.appBarColor ?? Colors.white,
            leading: BackButton(
              color: widget.textColor,
              onPressed: () => setState(
                () {
                  widget.textEditingController.clear();
                  _isSearchActive = !_isSearchActive;
                },
              ),
            ),
            searchFieldLabel: widget.searchBarTitle,
            queryTextController: widget.textEditingController,
            bottom: widget.bottom,
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
                  if (widget.textEditingController.value.text.isEmpty) {
                    setState(() => _isSearchActive = !_isSearchActive);
                  } else {
                    widget.textEditingController.clear();
                  }
                },
              )
            ],
          )
        : AppBar(
            leading: widget.leading == null
                ? IconButton(
                    color: widget.textColor,
                    icon: Icon(Icons.clear),
                    onPressed: () => Navigator.pop(context))
                : widget.leading,
            backgroundColor:
                widget.appBarColor ?? Theme.of(context).appBarTheme.color,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            title: widget.appBarSubTitle == null
                ? Text(
                    widget.appBarTitle,
                    style: TextStyle(color: widget.textColor),
                  )
                : ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      widget.appBarTitle,
                      style: TextStyle(color: widget.textColor),
                    ),
                    subtitle: Text(
                      widget.appBarSubTitle ?? '--',
                      style: TextStyle(color: widget.textColor),
                    ),
                  ),
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
