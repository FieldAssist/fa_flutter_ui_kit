/// This file defines the themes to be used in rest of the app.
/// Any user defined theme must always return the type [ThemeData]
import 'package:flutter/material.dart' show ChangeNotifier, ThemeData;

import 'theme_dark.dart';
import 'theme_light.dart';

enum ThemeType { light, dark }

/// Theme Provider
class ThemeModel extends ChangeNotifier {
  ThemeData _currentTheme = MyTheme().lightTheme;
  ThemeType _themeType = ThemeType.light;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    switch (_themeType) {
      case ThemeType.light:
        {
          _currentTheme = ThemeDark.themeData;
          _themeType = ThemeType.dark;
          notifyListeners();
          break;
        }
      case ThemeType.dark:
        {
          _currentTheme = MyTheme().lightTheme;
          _themeType = ThemeType.light;
          notifyListeners();
          break;
        }
    }
  }
}
