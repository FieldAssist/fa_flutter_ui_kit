import 'package:flutter/material.dart';

import '../tokens/fa_color_ramp.dart';
import '../tokens/fa_color_tokens.dart';
import '../tokens/fa_gradient_tokens.dart';
import '../tokens/fa_typography.dart';

/// Builds the MT 2.0 token set for a host app's `ThemeData`.
///
/// The tokens ride on `ThemeData.extensions`, which is a separate lookup path
/// from `ThemeData.textTheme` / `colorScheme`. That is deliberate: an app can
/// adopt MT 2.0 on new screens while every existing screen keeps rendering
/// from the theme it always used. Nothing here overrides Material's own slots.
///
/// Wire it once, where the app builds its theme:
///
/// ```dart
/// baseTheme.copyWith(
///   extensions: FaTheme.extensions(seed: companyPrimaryColour),
/// )
/// ```
abstract final class FaTheme {
  /// Modern Trade 2.0's brand blue. The default when an app has no branding.
  static const Color defaultSeed = Color(0xFF2563EB);

  /// The token set, derived from a single [seed].
  ///
  /// Passing [defaultSeed] yields the Figma palette verbatim; any other colour
  /// is expanded into a matching ramp, so a company-branded app stays coherent
  /// instead of mixing its primary with MT blue.
  ///
  /// [fontFamily] defaults to Inter, which this package ships. An app that
  /// must render MT surfaces in its own face passes the family here and sets
  /// [fontPackage] to `null`.
  /// [primaryAction] is the company's call-to-action gradient, which fills
  /// every primary button. Pass the one the app's theme configuration
  /// resolves; the MT 2.0 sweep stands in only when a company has no theme
  /// of its own.
  static List<ThemeExtension<dynamic>> extensions({
    Color seed = defaultSeed,
    LinearGradient? primaryAction,
    String fontFamily = 'Inter',
    String? fontPackage = 'fa_flutter_ui_kit',
  }) =>
      <ThemeExtension<dynamic>>[
        FaColors.fromSeed(seed),
        FaGradients.fromSeed(seed, primaryAction: primaryAction),
        FaText(fontFamily: fontFamily, fontPackage: fontPackage),
      ];

  /// A stand-alone theme carrying the token set. Convenience for the example
  /// gallery and widget tests; production apps use [extensions] on their own
  /// `ThemeData` instead of replacing it.
  static ThemeData light({Color seed = defaultSeed}) {
    final ramp = FaColorRamp.fromSeed(seed);
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      primaryColor: ramp.s600,
      scaffoldBackgroundColor: const Color(0xFFF5F6FA),
      extensions: extensions(seed: seed),
    );
  }
}
