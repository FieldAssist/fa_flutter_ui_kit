import 'package:flutter/material.dart';

@immutable
class FaText extends ThemeExtension<FaText> {
  const FaText({
    this.fontFamily = 'Inter',
    this.fontPackage = 'fa_flutter_ui_kit',
  });

  static const FaText fallback = FaText();

  final String fontFamily;
  final String? fontPackage;

  FaTextSize get s11 => FaTextSize._(this, 11, 18);
  FaTextSize get s12 => FaTextSize._(this, 12, 16);
  FaTextSize get s14 => FaTextSize._(this, 14, 21);
  FaTextSize get s16 => FaTextSize._(this, 16, 24);
  FaTextSize get s18 => FaTextSize._(this, 18, 26);
  FaTextSize get s20 => FaTextSize._(this, 20, 28);

  TextStyle get navTitle => s16.w500;
  TextStyle get navSubtitle => s12.w400;
  TextStyle get pillLabel => s12.w500;
  TextStyle get screenTitle => s18.w700;
  TextStyle get sectionTitle => s16.w600;
  TextStyle get cardTitle => s14.w600;
  TextStyle get cardSubtitle => s14.w400;
  TextStyle get body => s14.w400;
  TextStyle get bodyStrong => s14.w600;
  TextStyle get caption => s11.w400;

  @override
  FaText copyWith({String? fontFamily, String? fontPackage}) => FaText(
        fontFamily: fontFamily ?? this.fontFamily,
        fontPackage: fontPackage ?? this.fontPackage,
      );

  @override
  FaText lerp(covariant FaText? other, double t) =>
      (other == null || t < 0.5) ? this : other;
}

@immutable
class FaTextSize {
  const FaTextSize._(this._tokens, this._size, this._lineHeight);

  final FaText _tokens;
  final double _size;
  final double _lineHeight;

  TextStyle get w400 => _style(FontWeight.w400);
  TextStyle get w500 => _style(FontWeight.w500);
  TextStyle get w600 => _style(FontWeight.w600);
  TextStyle get w700 => _style(FontWeight.w700);

  TextStyle _style(FontWeight weight) => TextStyle(
        fontFamily: _tokens.fontFamily,
        package: _tokens.fontPackage,
        fontSize: _size,
        // Figma gives line height in pixels; Flutter wants a multiplier.
        height: _lineHeight / _size,
        fontWeight: weight,
      );
}
