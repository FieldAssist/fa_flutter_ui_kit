import 'package:flutter/material.dart';

import 'fa_color_ramp.dart';
import 'fa_status_ramp.dart';

@immutable
class FaColors extends ThemeExtension<FaColors> {
  const FaColors({
    required this.canvas,
    required this.surface,
    required this.surfaceAlt,
    required this.border,
    required this.shadow,
    required this.icon,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.brand,
    required this.brandDeep,
    required this.onBrand,
    required this.status,
  });

  factory FaColors.fromSeed(Color seed) {
    final brandRamp = FaColorRamp.fromSeed(seed);
    const grey = FaColorRamp.grey;
    return FaColors(
      canvas: const Color(0xFFF5F6FA),
      surface: Colors.white,
      surfaceAlt: const Color(0xFFF8F9FB),
      border: const Color(0xFFE2E8F0),
      shadow: const Color(0x14000000),
      icon: grey.s700,
      textPrimary: grey.s900,
      textSecondary: grey.s500,
      textTertiary: grey.s400,
      brand: brandRamp.s600,
      brandDeep: brandRamp.s900,
      onBrand: Colors.white,
      status: FaStatusColors.fromBrand(brandRamp),
    );
  }

  // Lets kit widgets render when the host theme carries no tokens
  // (widget tests, the example gallery).
  static final FaColors fallback = FaColors.fromSeed(FaColorRamp.blue.s600);

  final Color canvas;
  final Color surface;
  final Color surfaceAlt;
  final Color border;
  final Color shadow;
  final Color icon;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color brand;
  final Color brandDeep;
  final Color onBrand;
  final FaStatusColors status;

  @override
  FaColors copyWith({
    Color? canvas,
    Color? surface,
    Color? surfaceAlt,
    Color? border,
    Color? shadow,
    Color? icon,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? brand,
    Color? brandDeep,
    Color? onBrand,
    FaStatusColors? status,
  }) =>
      FaColors(
        canvas: canvas ?? this.canvas,
        surface: surface ?? this.surface,
        surfaceAlt: surfaceAlt ?? this.surfaceAlt,
        border: border ?? this.border,
        shadow: shadow ?? this.shadow,
        icon: icon ?? this.icon,
        textPrimary: textPrimary ?? this.textPrimary,
        textSecondary: textSecondary ?? this.textSecondary,
        textTertiary: textTertiary ?? this.textTertiary,
        brand: brand ?? this.brand,
        brandDeep: brandDeep ?? this.brandDeep,
        onBrand: onBrand ?? this.onBrand,
        status: status ?? this.status,
      );

  @override
  FaColors lerp(covariant FaColors? other, double t) {
    if (other == null) {
      return this;
    }
    return FaColors(
      canvas: Color.lerp(canvas, other.canvas, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t)!,
      border: Color.lerp(border, other.border, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      brand: Color.lerp(brand, other.brand, t)!,
      brandDeep: Color.lerp(brandDeep, other.brandDeep, t)!,
      onBrand: Color.lerp(onBrand, other.onBrand, t)!,
      status: FaStatusColors.lerp(status, other.status, t),
    );
  }
}
