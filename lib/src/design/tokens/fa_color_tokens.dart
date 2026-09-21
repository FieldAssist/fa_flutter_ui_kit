import 'package:flutter/material.dart';

import 'fa_color_ramp.dart';
import 'fa_status_ramp.dart';

@immutable
class FaColors extends ThemeExtension<FaColors> {
  const FaColors({
    required this.canvas,
    required this.surface,
    required this.surfaceAlt,
    required this.surfaceMuted,
    required this.border,
    required this.borderStrong,
    required this.track,
    required this.trackStrong,
    required this.shadow,
    required this.icon,
    required this.textPrimary,
    required this.textStrong,
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
      surfaceMuted: const Color(0xFFF4F4F4),
      border: const Color(0xFFE0E7EF),
      borderStrong: const Color(0xFFCBD5E1),
      track: grey.s200,
      trackStrong: grey.s300,
      shadow: const Color(0x0D000000),
      icon: grey.s600,
      textPrimary: grey.s950,
      textStrong: grey.s700,
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

  /// A surface set back from [surface] — the date sheet's header band.
  final Color surfaceMuted;

  final Color border;

  /// The heavier outline a form input carries, so a field reads as editable
  /// next to a card drawn with [border].
  final Color borderStrong;

  /// The groove a control sits in: the segmented tabs' track, a sheet's grab
  /// handle, a switch that is off.
  final Color track;

  /// A chip resting on [track], such as an unselected tab's count.
  final Color trackStrong;

  final Color shadow;
  final Color icon;
  final Color textPrimary;

  /// Body text that carries weight without being a heading — an amount, a
  /// field label's value, a form question.
  final Color textStrong;

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
    Color? surfaceMuted,
    Color? border,
    Color? borderStrong,
    Color? track,
    Color? trackStrong,
    Color? shadow,
    Color? icon,
    Color? textPrimary,
    Color? textStrong,
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
        surfaceMuted: surfaceMuted ?? this.surfaceMuted,
        border: border ?? this.border,
        borderStrong: borderStrong ?? this.borderStrong,
        track: track ?? this.track,
        trackStrong: trackStrong ?? this.trackStrong,
        shadow: shadow ?? this.shadow,
        icon: icon ?? this.icon,
        textPrimary: textPrimary ?? this.textPrimary,
        textStrong: textStrong ?? this.textStrong,
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
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      track: Color.lerp(track, other.track, t)!,
      trackStrong: Color.lerp(trackStrong, other.trackStrong, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textStrong: Color.lerp(textStrong, other.textStrong, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      brand: Color.lerp(brand, other.brand, t)!,
      brandDeep: Color.lerp(brandDeep, other.brandDeep, t)!,
      onBrand: Color.lerp(onBrand, other.onBrand, t)!,
      status: FaStatusColors.lerp(status, other.status, t),
    );
  }
}
