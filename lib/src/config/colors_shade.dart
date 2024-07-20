import 'package:flutter/cupertino.dart';

class AppMaterialColor extends ColorSwatch<int> {
  const AppMaterialColor(super.primary, super.swatch);

  /// The lightest shade.
  Color get shade25 => _getShade(25);

  /// The  first lightest shade
  Color get shade50 => _getShade(50);

  /// The  second lightest shade
  Color get shade75 => _getShade(75);

  /// The third lightest shade.
  Color get shade100 => _getShade(100);

  /// The fourth lightest shade.
  Color get shade200 => _getShade(200);

  /// The fifth lightest shade.
  Color get shade300 => _getShade(300);

  /// The sixth lightest shade.
  Color get shade400 => _getShade(400);

  /// The default shade.
  Color get shade500 => _getShade(500);

  /// The fourth darkest shade.
  Color get shade600 => _getShade(600);

  /// The third darkest shade.
  Color get shade700 => _getShade(700);

  /// The second darkest shade.
  Color get shade800 => _getShade(800);

  /// The darkest shade.
  Color get shade900 => _getShade(900);

  /// if shade not defined default value of shade assigned
  Color _getShade(int shadeValue) => this[shadeValue] ?? this;
}
