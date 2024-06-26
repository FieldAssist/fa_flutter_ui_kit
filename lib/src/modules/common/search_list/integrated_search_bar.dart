import 'package:fa_flutter_ui_kit/src/modules/common/search_list/integrated_search_textfield.dart';
import 'package:flutter/material.dart';

class IntegratedSearchBar extends StatefulWidget
    implements PreferredSizeWidget {
  IntegratedSearchBar({
    this.leading,
    required this.queryTextController,
    required this.actions,
    this.elevation = 4,
    this.searchFieldLabel = 'Enter your search query',
    this.onSubmitted,
    this.keyboardType,
    this.bottom,
    this.textInputAction = TextInputAction.search,
    this.onTap,
    this.backgroundColor,
    this.autoFocus,
    this.useIntegratedSearchTextField = false,
    this.searchBarColor,
    Key? key,
  })  : preferredSize = Size.fromHeight(
          kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
        ),
        super(key: key);

  final Widget? leading;
  final String searchFieldLabel;
  final double elevation;
  final List<Widget> actions;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final PreferredSizeWidget? bottom;
  final void Function(String query)? onSubmitted;
  final TextEditingController queryTextController;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool? autoFocus;
  final bool useIntegratedSearchTextField;
  final Color? searchBarColor;

  @override
  _IntegratedSearchBarState createState() => _IntegratedSearchBarState();

  @override
  final Size preferredSize;
}

class _IntegratedSearchBarState extends State<IntegratedSearchBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: widget.backgroundColor,
      //iconTheme: theme.primaryIconTheme,
      leading: widget.leading,
      elevation: widget.elevation,
      title: Container(
        child: Card(
          elevation: 2,
          margin: const EdgeInsets.only(right: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          clipBehavior: Clip.antiAlias,
          color: widget.searchBarColor ?? Color(0xFFE5F8FF),
          child: Row(
            children: <Widget>[
              Expanded(
                child: (widget.useIntegratedSearchTextField)
                    ? IntegratedSearchTextField(
                        searchFieldLabel: widget.searchFieldLabel,
                        autoFocus: widget.autoFocus ?? true,
                        textInputAction: widget.textInputAction,
                        queryTextController: widget.queryTextController,
                        keyboardType: widget.keyboardType,
                        onSubmitted: widget.onSubmitted,
                        onTap: widget.onTap,
                      )
                    : TextField(
                        onTap: widget.onTap,
                        controller: widget.queryTextController,
                        style: TextStyle(color: Colors.black),
                        autofocus: true,
                        textInputAction: widget.textInputAction,
                        keyboardType: widget.keyboardType,
                        onSubmitted: widget.onSubmitted,
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          hintText: widget.searchFieldLabel,
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                      ),
              ),
              ...widget.actions,
            ],
          ),
        ),
      ),
      bottom: widget.bottom,
    );
  }
}
