import 'package:flutter/material.dart';

abstract class AppThemeConfigProvider {
  LinearGradient? get appThemeGradient;

  Color get appThemePrimaryColor;
  Color? get appThemeSecondaryColor;

}
