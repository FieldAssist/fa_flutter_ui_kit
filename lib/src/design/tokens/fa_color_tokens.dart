import 'package:flutter/material.dart';

import 'fa_color_ramp.dart';
import 'fa_status_ramp.dart';

/// Semantic colour roles for MT 2.0 surfaces.
///
/// This is the only colour API widgets are allowed to touch — reach it with
/// `context.faColors`, never by constructing a [Color] in widget code.
/// Roles are named for the job they do, so a company re-brand changes one seed
/// instead of every call site.
@immutable
class FaColors extends ThemeExtension<FaColors> {
  const FaColors({
    required this.canvas,
    required this.surface,
    required this.surfaceAlt,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.brand,
    required this.brandDeep,
    required this.onBrand,
    required this.status,
  });

  /// Derives every role from a company-branding colour.
  factory FaColors.fromSeed(Color seed) {
    final brandRamp = FaColorRamp.fromSeed(seed);
    const grey = FaColorRamp.grey;
    return FaColors(
      canvas: const Color(0xFFF5F6FA),
      surface: Colors.white,
      surfaceAlt: const Color(0xFFF8F9FB),
      border: grey.s200,
      textPrimary: grey.s900,
      textSecondary: grey.s500,
      textTertiary: grey.s400,
      brand: brandRamp.s600,
      brandDeep: brandRamp.s900,
      onBrand: Colors.white,
      status: FaStatusColors.fromBrand(brandRamp),
    );
  }

  /// Used when a host app has not wired [FaTheme] into its `ThemeData`.
  /// Keeps the kit renderable in isolation (example gallery, widget tests)
  /// instead of throwing deep inside a build.
  static final FaColors fallback = FaColors.fromSeed(FaColorRamp.blue.s600);

  /// Screen background behind all content. `#F5F6FA` in MT 2.0.
  final Color canvas;

  /// Raised content: cards, sheets, the bottom bar.
  final Color surface;

  /// Recessed strip inside a surface — e.g. an activity card's "Start" footer.
  final Color surfaceAlt;

  final Color border;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  /// The company's primary. Actions, links, selected states.
  final Color brand;

  /// Dark end of the brand ramp. Top stop of the header gradient.
  final Color brandDeep;

  /// Content drawn on [brand] or on the header gradient.
  final Color onBrand;

  final FaStatusColors status;

  @override
  FaColors copyWith({
    Color? canvas,
    Color? surface,
    Color? surfaceAlt,
    Color? border,
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
