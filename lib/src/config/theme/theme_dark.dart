import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../fonts.dart';
import 'material_color.dart';

class ThemeDark {
  static final ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _primaryColor,
    hintColor: _hintColor,
    appBarTheme: _appBarTheme,
    fontFamily: Fonts.defaultFont,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    unselectedWidgetColor: _unselectedWidgetColor,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: _primarySwatch)
        .copyWith(secondary: _primaryColor),
  );

  static final MaterialColor _primarySwatch =
      hexColor2MaterialColor(0xFF246BB3);
  static final Color _primaryColor = Color(0xFF246BB3);
  static final Color _hintColor = Color(0xffaaaaaa);
  static final Color _unselectedWidgetColor = Color(0xffcccccc);
  static final Color _scaffoldBackgroundColor = Colors.black;

  static final AppBarTheme _appBarTheme = AppBarTheme(
    color: Colors.black,
    elevation: 2,
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    iconTheme: IconThemeData(color: _primarySwatch),
    actionsIconTheme: IconThemeData(color: _primarySwatch),
//    textTheme: TextTheme(
//      title: TextStyle(
//        color: Colors.white,
//        fontSize: 22,
//        fontWeight: FontWeight.w500,
//      ),
//    ),
  );

//  static final ButtonThemeData _buttonTheme = ButtonThemeData(
//    padding: const EdgeInsets.only(left: 24, right: 24),
//    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//    shape: RoundedRectangleBorder(
//      borderRadius: new BorderRadius.circular(30.0),
//      side: BorderSide(color: Colors.black54),
//    ),
//  );
}
