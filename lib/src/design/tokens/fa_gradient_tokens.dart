import 'package:flutter/material.dart';

import 'fa_color_ramp.dart';

/// Gradients used by MT 2.0 surfaces.
///
/// Reach them with `context.faGradients`. Both are seeded from the company
/// brand so a re-brand does not leave a blue header above a green app.
@immutable
class FaGradients extends ThemeExtension<FaGradients> {
  const FaGradients({
    required this.headerBackdrop,
    required this.primaryAction,
  });

  factory FaGradients.fromSeed(Color seed) {
    final ramp = FaColorRamp.fromSeed(seed);
    return FaGradients(
      // Verified on MT 2.0 "Outlet Detail": vertical, dark at the top.
      headerBackdrop: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [ramp.s900, ramp.s600],
      ),
      // The CTA sweep. Its indigo and pink stops are design accents rather
      // than brand colours, so they stay fixed while the first stop follows
      // the seed.
      primaryAction: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [ramp.s600, _ctaMid, _ctaAccent],
      ),
    );
  }

  static const Color _ctaMid = Color(0xFF3341D8);
  static const Color _ctaAccent = Color(0xFFFF559B);

  /// Used when a host app has not wired [FaTheme] into its `ThemeData`.
  static final FaGradients fallback = FaGradients.fromSeed(FaColorRamp.blue.s600);

  /// Fills the curved shape behind the header and status bar.
  final LinearGradient headerBackdrop;

  /// Primary call-to-action fill.
  final LinearGradient primaryAction;

  @override
  FaGradients copyWith({
    LinearGradient? headerBackdrop,
    LinearGradient? primaryAction,
  }) =>
      FaGradients(
        headerBackdrop: headerBackdrop ?? this.headerBackdrop,
        primaryAction: primaryAction ?? this.primaryAction,
      );

  @override
  FaGradients lerp(covariant FaGradients? other, double t) {
    if (other == null) {
      return this;
    }
    return FaGradients(
      headerBackdrop:
          LinearGradient.lerp(headerBackdrop, other.headerBackdrop, t)!,
      primaryAction:
          LinearGradient.lerp(primaryAction, other.primaryAction, t)!,
    );
  }
}
