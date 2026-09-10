/// The MT 2.0 spacing scale, in logical pixels.
///
/// Not a `ThemeExtension`: spacing does not change with branding, so a plain
/// const class keeps call sites cheap and const-friendly. Every value here was
/// observed in the Figma file — `x6`, `x10` and `x14` are common in MT and are
/// the reason a 4-point-only scale does not fit.
abstract final class FaSpace {
  static const double x2 = 2;
  static const double x4 = 4;
  static const double x6 = 6;
  static const double x8 = 8;
  static const double x10 = 10;
  static const double x12 = 12;
  static const double x14 = 14;
  static const double x16 = 16;
  static const double x20 = 20;
  static const double x24 = 24;
  static const double x32 = 32;
}
