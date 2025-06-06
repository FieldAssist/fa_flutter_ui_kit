import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';

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
  final double? bottomHeight;
  final double? elevation;
  final Widget? searchIcon;
  final Color? searchBarColor;
  final bool showBackButton;
  final Widget? actionWidget;

  const SearchAppBar({
    required this.enableSearch,
    required this.appBarTitle,
    required this.textEditingController,
    this.searchBarTitle = 'Search',
    this.bottom,
    this.actions,
    this.appBarSubTitle,
    this.appBarColor,
    this.textColor = Colors.black,
    this.leading,
    this.bottomHeight,
    this.elevation,
    this.searchIcon,
    this.searchBarColor,
    this.showBackButton = true,
    this.actionWidget,
  });

  final _appbarHeight = 66.0;

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => this.bottom == null
      ? Size.fromHeight(_appbarHeight)
      : Size.fromHeight(
          bottomHeight != null ? (_appbarHeight + bottomHeight!) : 100);
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    return _isSearchActive
        ? IntegratedSearchBar(
            searchBarColor: widget.searchBarColor,
            elevation: widget.elevation ?? 4,
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
              if (widget.actions != null)
                ...widget.actions!
              else
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
            elevation: widget.elevation,
            automaticallyImplyLeading: widget.showBackButton,
            leading: getLeadingWidget(context),
            backgroundColor: widget.appBarColor ??
                Theme.of(context).appBarTheme.backgroundColor,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            title: (widget.appBarSubTitle == null ||
                    widget.appBarSubTitle!.isEmpty)
                ? Padding(
                    padding:
                        EdgeInsets.only(left: !widget.showBackButton ? 16 : 0),
                    child: Text(
                      widget.appBarTitle,
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListTile(
                    contentPadding:
                        EdgeInsets.only(left: !widget.showBackButton ? 16 : 0),
                    title: Text(
                      widget.appBarTitle,
                      style: TextStyle(
                        color: widget.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      widget.appBarSubTitle ?? '--',
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
            bottom: widget.bottom,
            actions: <Widget>[
              if (widget.enableSearch)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSearchActive = !_isSearchActive;
                    });
                  },
                  child: widget.searchIcon ??
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: widget.searchIcon ??
                            SvgAssetIcon(
                              path: SvgIcons.search,
                              height: 18,
                              width: 18,
                              color: Color(0xff0097cd),
                            ),
                      ),
                ),
              if (widget.actions != null) ...widget.actions!
            ],
          );
  }

  Widget? getLeadingWidget(BuildContext context) {
    if (!widget.showBackButton) {
      return null;
    }

    if (widget.leading == null) {
      return BackButton(
          color: widget.textColor, onPressed: () => Navigator.pop(context));
    }

    return widget.leading;
  }
}
