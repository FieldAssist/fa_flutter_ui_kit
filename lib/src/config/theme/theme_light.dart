import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../fonts.dart';
import 'material_color.dart';

class MyTheme {
  static final MaterialColor _primarySwatch =
      hexColor2MaterialColor(0xFF31B2DF);
  static final Color _primaryColor = Color(0xFF31B2DF);
  static final Color _primaryColorDark = Color(0xFF005486);
  static final Color _hintColor = Color(0xffaaaaaa);
  static final Color _unselectedWidgetColor = Color(0xffcccccc);
  static final Color _scaffoldBackgroundColor = Colors.grey[50]!;

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: _primaryColor,
        primaryColorDark: _primaryColorDark,
        hintColor: _hintColor,
        appBarTheme: AppBarTheme(
          titleSpacing: 0,
          color: Colors.white,
          elevation: 2,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        ),
        fontFamily: Fonts.defaultFont,
        fontFamilyFallback: ['Roboto', 'SanFrancisco', 'Halvetica'],
        scaffoldBackgroundColor: _scaffoldBackgroundColor,
        unselectedWidgetColor: _unselectedWidgetColor,
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          actionTextColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: _primarySwatch)
            .copyWith(secondary: _primaryColor),
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          elevation: 2,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        fontFamily: Fonts.defaultFont,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: _primarySwatch)
            .copyWith(secondary: _primaryColor),
      );
}
