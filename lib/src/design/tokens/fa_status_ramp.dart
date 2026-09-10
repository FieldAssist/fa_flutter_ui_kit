import 'package:flutter/material.dart';

import 'fa_color_ramp.dart';

enum FaTone { brand, accent, success, warning, danger, info, neutral }

@immutable
class FaStatusRamp {
  const FaStatusRamp({
    required this.tint,
    required this.ink,
    required this.border,
    required this.solid,
  });

  factory FaStatusRamp.fromRamp(FaColorRamp ramp) => FaStatusRamp(
        tint: ramp.s50,
        ink: ramp.s600,
        border: ramp.s200,
        solid: ramp.s500,
      );

  final Color tint;
  final Color ink;
  final Color border;
  final Color solid;

  static FaStatusRamp lerp(FaStatusRamp a, FaStatusRamp b, double t) =>
      FaStatusRamp(
        tint: Color.lerp(a.tint, b.tint, t)!,
        ink: Color.lerp(a.ink, b.ink, t)!,
        border: Color.lerp(a.border, b.border, t)!,
        solid: Color.lerp(a.solid, b.solid, t)!,
      );
}

@immutable
class FaStatusColors {
  const FaStatusColors({
    required this.brand,
    required this.accent,
    required this.success,
    required this.warning,
    required this.danger,
    required this.info,
    required this.neutral,
  });

  // Only brand follows the company seed, so a re-brand never recolours
  // success or danger.
  factory FaStatusColors.fromBrand(FaColorRamp brandRamp) => FaStatusColors(
        brand: FaStatusRamp.fromRamp(brandRamp),
        accent: FaStatusRamp.fromRamp(FaColorRamp.violet),
        success: FaStatusRamp.fromRamp(FaColorRamp.green),
        warning: FaStatusRamp.fromRamp(FaColorRamp.amber),
        danger: FaStatusRamp.fromRamp(FaColorRamp.red),
        info: FaStatusRamp.fromRamp(FaColorRamp.blue),
        neutral: FaStatusRamp(
          tint: FaColorRamp.grey.s100,
          ink: FaColorRamp.grey.s500,
          border: FaColorRamp.grey.s200,
          solid: FaColorRamp.grey.s400,
        ),
      );

  final FaStatusRamp brand;
  final FaStatusRamp accent;
  final FaStatusRamp success;
  final FaStatusRamp warning;
  final FaStatusRamp danger;
  final FaStatusRamp info;
  final FaStatusRamp neutral;

  FaStatusRamp of(FaTone tone) => switch (tone) {
        FaTone.brand => brand,
        FaTone.accent => accent,
        FaTone.success => success,
        FaTone.warning => warning,
        FaTone.danger => danger,
        FaTone.info => info,
        FaTone.neutral => neutral,
      };

  static FaStatusColors lerp(FaStatusColors a, FaStatusColors b, double t) =>
      FaStatusColors(
        brand: FaStatusRamp.lerp(a.brand, b.brand, t),
        accent: FaStatusRamp.lerp(a.accent, b.accent, t),
        success: FaStatusRamp.lerp(a.success, b.success, t),
        warning: FaStatusRamp.lerp(a.warning, b.warning, t),
        danger: FaStatusRamp.lerp(a.danger, b.danger, t),
        info: FaStatusRamp.lerp(a.info, b.info, t),
        neutral: FaStatusRamp.lerp(a.neutral, b.neutral, t),
      );
}
