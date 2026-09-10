import 'package:flutter/material.dart';

/// Typography tokens for MT 2.0 surfaces.
///
/// MT 2.0's type is a **size x weight grid**, not a fixed set of roles: the
/// same 14px size appears at w400, w500, w600 and w700 across the file. A
/// role-only API therefore forces `copyWith(fontWeight: ...)` at call sites,
/// which is how a design system quietly turns back into ad-hoc `TextStyle`s.
///
/// So this exposes both:
///
/// * the grid — `context.faText.s14.w600` — when you are matching Figma; and
/// * semantic aliases — `context.faText.cardTitle` — which components use, so
///   a decision like "card titles are 16/w600" lives in one place.
///
/// Either way the result is a finished [TextStyle]. Reach for `copyWith` only
/// for colour.
@immutable
class FaText extends ThemeExtension<FaText> {
  const FaText({
    this.fontFamily = 'Inter',
    this.fontPackage = _kitPackage,
  });

  /// The package that ships [fontFamily]. `null` means the host app declares
  /// the family itself.
  static const String _kitPackage = 'fa_flutter_ui_kit';

  /// Used when a host app has not wired [FaTheme] into its `ThemeData`.
  static const FaText fallback = FaText();

  final String fontFamily;
  final String? fontPackage;

  // ── The grid ──────────────────────────────────────────────────────────────
  // Size / line-height pairs are taken from the MT 2.0 file.

  FaTextSize get s11 => FaTextSize._(this, 11, 18);
  FaTextSize get s12 => FaTextSize._(this, 12, 16);
  FaTextSize get s14 => FaTextSize._(this, 14, 21);
  FaTextSize get s16 => FaTextSize._(this, 16, 24);
  FaTextSize get s18 => FaTextSize._(this, 18, 26);
  FaTextSize get s20 => FaTextSize._(this, 20, 28);

  // ── Semantic aliases ──────────────────────────────────────────────────────
  // Components address these, never the grid, so that restyling a role is a
  // one-line change here.

  /// Title in [FaTopNav].
  TextStyle get navTitle => s16.w500;

  /// Optional second line under [navTitle].
  TextStyle get navSubtitle => s12.w400;

  /// Label inside a [FaPill].
  TextStyle get pillLabel => s12.w500;

  /// Screen-level heading, e.g. an outlet name.
  TextStyle get screenTitle => s18.w700;

  /// Heading above a group of cards.
  TextStyle get sectionTitle => s16.w600;

  /// Card heading.
  TextStyle get cardTitle => s16.w600;

  /// Supporting line under a card heading.
  TextStyle get cardSubtitle => s14.w400;

  /// Default body copy.
  TextStyle get body => s14.w400;

  /// Body copy that carries emphasis, e.g. an inline action.
  TextStyle get bodyStrong => s14.w600;

  /// Smallest supporting text.
  TextStyle get caption => s11.w400;

  @override
  FaText copyWith({String? fontFamily, String? fontPackage}) => FaText(
        fontFamily: fontFamily ?? this.fontFamily,
        fontPackage: fontPackage ?? this.fontPackage,
      );

  /// A font family cannot be interpolated, so this steps at the midpoint.
  @override
  FaText lerp(covariant FaText? other, double t) =>
      (other == null || t < 0.5) ? this : other;
}

/// One row of the type grid: a fixed size, selectable weight.
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
        // Flutter's `height` is a multiple of the font size; Figma gives pixels.
        height: _lineHeight / _size,
        fontWeight: weight,
      );
}
