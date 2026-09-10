import 'package:flutter/material.dart';

import '../tokens/fa_color_tokens.dart';
import '../tokens/fa_gradient_tokens.dart';
import '../tokens/fa_typography.dart';

/// The single entry point widgets use to read design tokens.
///
/// Every accessor falls back to the MT 2.0 defaults when the host app has not
/// wired [FaTheme] into its `ThemeData`, so a component renders correctly in
/// isolation — an example gallery, a widget test — instead of throwing from
/// deep inside `build`.
extension FaThemeContext on BuildContext {
  /// Semantic colours: `context.faColors.brand`, `.status.of(tone).tint`, ...
  FaColors get faColors =>
      Theme.of(this).extension<FaColors>() ?? FaColors.fallback;

  /// Typography: `context.faText.cardTitle`, `context.faText.s14.w600`.
  FaText get faText => Theme.of(this).extension<FaText>() ?? FaText.fallback;

  /// Gradients: `context.faGradients.headerBackdrop`.
  FaGradients get faGradients =>
      Theme.of(this).extension<FaGradients>() ?? FaGradients.fallback;
}
