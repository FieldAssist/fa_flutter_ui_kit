import 'package:flutter/material.dart';

import '../fonts.dart';
import 'material_color.dart';

class MyTheme {
  static final MaterialColor _primarySwatch =
      hexColor2MaterialColor(0xFF31B2DF);
  static final Color _primaryColor = Color(0xFF31B2DF);
  static final Color _primaryColorDark = Color(0xFF005486);
  static final Color _hintColor = Color(0xffaaaaaa);
  static final Color _unselectedWidgetColor = Color(0xffcccccc);
  static final Color _scaffoldBackgroundColor = Colors.white;

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primarySwatch: _primarySwatch,
        primaryColor: _primaryColor,
        primaryColorDark: _primaryColorDark,
        hintColor: _hintColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 2,
          brightness: Brightness.light,
        ),
        fontFamily: Fonts.defaultFont,
        scaffoldBackgroundColor: _scaffoldBackgroundColor,
        unselectedWidgetColor: _unselectedWidgetColor,
        accentColor: _primaryColor,
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          actionTextColor: Colors.white,
        ),
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: _primarySwatch,
        appBarTheme: AppBarTheme(
          elevation: 2,
          brightness: Brightness.dark,
        ),
        fontFamily: Fonts.defaultFont,
        accentColor: _primaryColor,
      );
}
