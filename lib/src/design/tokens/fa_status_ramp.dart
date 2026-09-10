import 'package:flutter/material.dart';

import 'fa_color_ramp.dart';

/// The semantic tones a status-bearing component can carry.
///
/// Components take a tone, never a colour — that is what keeps hex literals
/// out of widget code and lets company branding re-tint [FaTone.brand].
enum FaTone { brand, success, warning, danger, info, neutral }

/// The three colours a toned surface needs: a background, a foreground and an
/// outline. Every tone resolves to one of these triples.
@immutable
class FaStatusRamp {
  const FaStatusRamp({
    required this.tint,
    required this.ink,
    required this.border,
  });

  /// Built from a ramp the way MT 2.0 does it: `50` behind, `600` in front.
  factory FaStatusRamp.fromRamp(FaColorRamp ramp) => FaStatusRamp(
        tint: ramp.s50,
        ink: ramp.s600,
        border: ramp.s200,
      );

  /// Background fill.
  final Color tint;

  /// Text and icon colour drawn on [tint].
  final Color ink;

  /// Outline, for the variants that show one.
  final Color border;

  static FaStatusRamp lerp(FaStatusRamp a, FaStatusRamp b, double t) =>
      FaStatusRamp(
        tint: Color.lerp(a.tint, b.tint, t)!,
        ink: Color.lerp(a.ink, b.ink, t)!,
        border: Color.lerp(a.border, b.border, t)!,
      );
}

/// The full set of tone triples, resolved once per theme.
@immutable
class FaStatusColors {
  const FaStatusColors({
    required this.brand,
    required this.success,
    required this.warning,
    required this.danger,
    required this.info,
    required this.neutral,
  });

  /// [brand] follows the company's seed; the rest are fixed so that "success"
  /// stays green and "danger" stays red whatever a company brands itself.
  factory FaStatusColors.fromBrand(FaColorRamp brandRamp) => FaStatusColors(
        brand: FaStatusRamp.fromRamp(brandRamp),
        success: FaStatusRamp.fromRamp(FaColorRamp.green),
        warning: FaStatusRamp.fromRamp(FaColorRamp.amber),
        danger: FaStatusRamp.fromRamp(FaColorRamp.red),
        info: FaStatusRamp.fromRamp(FaColorRamp.blue),
        neutral: FaStatusRamp(
          tint: FaColorRamp.grey.s100,
          ink: FaColorRamp.grey.s500,
          border: FaColorRamp.grey.s200,
        ),
      );

  final FaStatusRamp brand;
  final FaStatusRamp success;
  final FaStatusRamp warning;
  final FaStatusRamp danger;
  final FaStatusRamp info;
  final FaStatusRamp neutral;

  /// Resolves a tone. Exhaustive by construction — adding a [FaTone] is a
  /// compile error here until it is given a triple.
  FaStatusRamp of(FaTone tone) => switch (tone) {
        FaTone.brand => brand,
        FaTone.success => success,
        FaTone.warning => warning,
        FaTone.danger => danger,
        FaTone.info => info,
        FaTone.neutral => neutral,
      };

  static FaStatusColors lerp(FaStatusColors a, FaStatusColors b, double t) =>
      FaStatusColors(
        brand: FaStatusRamp.lerp(a.brand, b.brand, t),
        success: FaStatusRamp.lerp(a.success, b.success, t),
        warning: FaStatusRamp.lerp(a.warning, b.warning, t),
        danger: FaStatusRamp.lerp(a.danger, b.danger, t),
        info: FaStatusRamp.lerp(a.info, b.info, t),
        neutral: FaStatusRamp.lerp(a.neutral, b.neutral, t),
      );
}
