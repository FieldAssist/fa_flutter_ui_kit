import 'package:flutter/material.dart';

class IntegratedSearchTextField extends StatefulWidget {
  const IntegratedSearchTextField(
      {required this.searchFieldLabel,
      this.keyboardType,
      this.textInputAction,
      this.onSubmitted,
      this.prefixIcon,
      this.bgColor,
      this.onTap,
      this.elevation,
      this.autoFocus,
      required this.queryTextController,
      this.showCrossbutton = false,
      Key? key})
      : super(key: key);

  final double? elevation;
  final Color? bgColor;
  final Icon? prefixIcon;
  final String searchFieldLabel;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String query)? onSubmitted;
  final TextEditingController queryTextController;
  final VoidCallback? onTap;
  final bool? autoFocus;
  final bool showCrossbutton;

  // final SearchListBloc _searchListBloc=SearchListBloc();

  @override
  _IntegratedSearchTextFieldState createState() =>
      _IntegratedSearchTextFieldState();
}

class _IntegratedSearchTextFieldState extends State<IntegratedSearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: widget.elevation ?? 0,
        child: TextField(
          onTap: widget.onTap,
          controller: widget.queryTextController,
          style: TextStyle(color: Colors.black),
          autofocus: widget.autoFocus ?? true,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.bgColor,
            prefixIcon: widget.prefixIcon,
            isDense: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            hintText: widget.searchFieldLabel,
            suffixIcon: widget.showCrossbutton
                ? Container(
                    width: 18,
                    height: 18,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: InkWell(
                      onTap: widget.queryTextController.clear,
                      child: Icon(
                        Icons.close,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
            suffixIconConstraints: BoxConstraints(
              maxHeight: 38,
              maxWidth: 38,
            ),
            hintStyle: TextStyle(
              color: Colors.black26,
            ),
          ),
        ),
      ),
    );
  }
}
