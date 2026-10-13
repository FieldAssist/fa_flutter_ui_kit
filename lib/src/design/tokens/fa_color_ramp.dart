import 'package:flutter/material.dart';

@immutable
class FaColorRamp {
  const FaColorRamp({
    required this.s50,
    required this.s100,
    required this.s200,
    required this.s300,
    required this.s400,
    required this.s500,
    required this.s600,
    required this.s700,
    required this.s800,
    required this.s900,
    required this.s950,
  });

  final Color s50;
  final Color s100;
  final Color s200;
  final Color s300;
  final Color s400;
  final Color s500;
  final Color s600;
  final Color s700;
  final Color s800;
  final Color s900;
  final Color s950;

  // Tailwind ramps; stops marked "Figma" are measured from the MT 2.0 file
  // where it deviates from Tailwind.
  static const blue = FaColorRamp(
    s50: Color(0xFFECF2FF), // Figma
    s100: Color(0xFFDBEAFE),
    s200: Color(0xFFBFDBFE),
    s300: Color(0xFF93C5FD),
    s400: Color(0xFF60A5FA),
    s500: Color(0xFF3B82F6),
    s600: Color(0xFF2563EB),
    s700: Color(0xFF1D4ED8),
    s800: Color(0xFF1E40AF),
    s900: Color(0xFF153885), // Figma
    s950: Color(0xFF172554),
  );

  static const grey = FaColorRamp(
    s50: Color(0xFFF9FAFB),
    s100: Color(0xFFF3F4F6),
    s200: Color(0xFFE5E7EB),
    s300: Color(0xFFD1D5DB),
    s400: Color(0xFF9CA3AF),
    s500: Color(0xFF6B7280),
    s600: Color(0xFF4B5563),
    s700: Color(0xFF374151),
    s800: Color(0xFF1F2937),
    s900: Color(0xFF111827),
    s950: Color(0xFF030712),
  );

  static const green = FaColorRamp(
    s50: Color(0xFFE9FFE8), // Figma
    s100: Color(0xFFDCFCE7),
    s200: Color(0xFFBBF7D0),
    s300: Color(0xFF86EFAC),
    s400: Color(0xFF4ADE80),
    s500: Color(0xFF48C054), // Figma
    s600: Color(0xFF008400), // Figma
    s700: Color(0xFF15803D),
    s800: Color(0xFF166534),
    s900: Color(0xFF14532D),
    s950: Color(0xFF052E16),
  );

  static const violet = FaColorRamp(
    s50: Color(0xFFF5F3FF),
    s100: Color(0xFFEDE9FE),
    s200: Color(0xFFDDD6FE),
    s300: Color(0xFFC4B5FD),
    s400: Color(0xFFA78BFA),
    s500: Color(0xFF8B5CF6),
    s600: Color(0xFF7C3AED),
    s700: Color(0xFF6D28D9),
    s800: Color(0xFF5B21B6),
    s900: Color(0xFF4C1D95),
    s950: Color(0xFF2E1065),
  );

  static const amber = FaColorRamp(
    s50: Color(0xFFFFFBEB),
    s100: Color(0xFFFEF3C7),
    s200: Color(0xFFFDE68A),
    s300: Color(0xFFFCD34D),
    s400: Color(0xFFFBBF24),
    s500: Color(0xFFF59E0B),
    s600: Color(0xFFD97706),
    s700: Color(0xFFB45309),
    s800: Color(0xFF92400E),
    s900: Color(0xFF78350F),
    s950: Color(0xFF451A03),
  );

  static const red = FaColorRamp(
    s50: Color(0xFFFEF2F2),
    s100: Color(0xFFFEE2E2),
    s200: Color(0xFFFECACA),
    s300: Color(0xFFFCA5A5),
    s400: Color(0xFFF87171),
    s500: Color(0xFFEF4444),
    s600: Color(0xFFDC2626),
    s700: Color(0xFFB91C1C),
    s800: Color(0xFF991B1B),
    s900: Color(0xFF7F1D1D),
    s950: Color(0xFF450A0A),
  );

  static const List<double> _lightness = [
    0.97, 0.93, 0.87, 0.78, 0.68, 0.60, -1, 0.44, 0.36, 0.28, 0.20,
  ];

  factory FaColorRamp.fromSeed(Color seed) {
    // The default seed keeps the Figma-tuned ramp instead of a derived one.
    if (seed == blue.s600) {
      return blue;
    }
    final hsl = HSLColor.fromColor(seed);
    Color at(int i) => i == 6
        ? seed
        : hsl.withLightness(_lightness[i].clamp(0.0, 1.0)).toColor();
    return FaColorRamp(
      s50: at(0),
      s100: at(1),
      s200: at(2),
      s300: at(3),
      s400: at(4),
      s500: at(5),
      s600: at(6),
      s700: at(7),
      s800: at(8),
      s900: at(9),
      s950: at(10),
    );
  }

  static FaColorRamp lerp(FaColorRamp a, FaColorRamp b, double t) {
    Color c(Color x, Color y) => Color.lerp(x, y, t)!;
    return FaColorRamp(
      s50: c(a.s50, b.s50),
      s100: c(a.s100, b.s100),
      s200: c(a.s200, b.s200),
      s300: c(a.s300, b.s300),
      s400: c(a.s400, b.s400),
      s500: c(a.s500, b.s500),
      s600: c(a.s600, b.s600),
      s700: c(a.s700, b.s700),
      s800: c(a.s800, b.s800),
      s900: c(a.s900, b.s900),
      s950: c(a.s950, b.s950),
    );
  }
}
