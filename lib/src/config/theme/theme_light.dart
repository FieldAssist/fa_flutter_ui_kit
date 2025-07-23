import 'package:fa_flutter_ui_kit/src/config/colors.dart' show AppColors;
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
  final String font;

  MyTheme({this.font = Fonts.defaultFont});

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
        primaryColor: _primaryColor,
        primaryColorDark: _primaryColorDark,
        hintColor: _hintColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleSpacing: 8,
          toolbarHeight: 60,
          color: Colors.white,
          backgroundColor: AppColors.kBlueColor.shade25,
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: AppColors.kBlueColor.shade25,
          ),
        ),
        fontFamily: font,
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
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleSpacing: 8,
          toolbarHeight: 60,
          color: Colors.white,
          backgroundColor: AppColors.kBlueColor.shade25,
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: AppColors.kBlueColor.shade25,
          ),
        ),
        fontFamily: font,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: _primarySwatch)
            .copyWith(secondary: _primaryColor),
      );
}
