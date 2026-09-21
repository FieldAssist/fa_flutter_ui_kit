/// The MT 2.0 corner-radius scale, in logical pixels.
///
/// Not a `ThemeExtension` — see [FaSpace] for why.
abstract final class FaRadius {
  static const double sm = 4;

  /// Small tinted controls: icon tiles, chips, inline info boxes.
  static const double chip = 6;

  static const double md = 8;

  /// Icon tiles and inline chips.
  static const double lg = 10;
  static const double xl = 12;

  /// Cards.
  static const double xxl = 14;

  /// The top corners of a modal sheet.
  static const double sheet = 24;

  /// Fully rounded: pills, avatars, the primary action button.
  static const double pill = 999;
}
