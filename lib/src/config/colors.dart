import 'package:flutter/material.dart';

import 'colors_shade.dart';

class AppColors {
  AppColors._();

  static const Color kEditFieldPink = Color(0xFFFBF4F9);
  static const Color kEditFieldPinkBorder = Color(0xFFB651B4);

  static const Color kEditFieldBlueBorder = Color(0xFF0097CD);

  static const Color kRetailerStockAppBar = Color(0xFFB651B4);
  static const Color kAllProductAppBar = Color(0xff0097cd);

  static const Color kFastMovingBackground = Color(0xFFF5F5F5);

  static const Color kAllProductsCurrencyColor = Color(0xFFf9c446);

  static Color kTagColor = Color(0xFFf9c446).withAlpha(200);

  static Color kCustomDarkBlue = Color(0xFF005486);

  static Color kDarkBlue = Color(0xFF072A72);

  static Color kOutlinedIconButtonBackgroundColor = Color(0xffFAFAFA);

  static Color kOutlinedIconButtonBorderColor = Color(0xffDCDCDC);

  static Color colorGreenLight = Color(0xFF4BA42A);

  static const Color kGreen = Color(0xFF0A9455);

  static const Color kHomeYellow = Color(0xffF8C350);

  /// Blue Color
  static const AppMaterialColor kBlueColor = AppMaterialColor(
    0xFF118AB2,
    <int, Color>{
      25: Color(0xFFEFF7FF),
    },
  );
  static const Color kLightGrey = Color(0xFF666666);

  static const Color kWhite = Colors.white;

  static const Color kRedAlpha = Color(0xFFE13021);

  static const Color kRed = Color(0xFFE13021);

  static const Color kGreyBackground = Color(0xFFEEEEEE);
  static const Color kLightBlue = Color(0xFFEDF6FF);
  static const Color kSmokyBlack = Color(0xFF0D0D0D);
  static const Color kKeepGreen = Color(0xFF57CC99);
}

extension ColorExtensions on Color {
  // Fixed withAlpha usage instead of withValues (which doesn't exist in Flutter)
  Color withOpacityFactor(double opacity) {
    return withAlpha((opacity * 255).round());
  }
}
