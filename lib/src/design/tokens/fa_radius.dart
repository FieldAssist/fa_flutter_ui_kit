/// The MT 2.0 corner-radius scale, in logical pixels.
///
/// Not a `ThemeExtension` — see [FaSpace] for why.
abstract final class FaRadius {
  static const double sm = 4;
  static const double md = 8;

  /// Icon tiles and inline chips.
  static const double lg = 10;
  static const double xl = 12;

  /// Cards.
  static const double xxl = 14;

  /// Fully rounded: pills, avatars, the primary action button.
  static const double pill = 999;
}
