/// Modern Trade 2.0 design system.
///
/// Deliberately a separate entry point from `fa_flutter_ui_kit.dart`: the
/// legacy barrel exports `AppColors`, `Fonts` and the older widget set, none
/// of which this system uses. Importing `design.dart` gets you the tokens and
/// components and nothing else.
///
/// Host apps wire the tokens once, where they build their theme:
///
/// ```dart
/// baseTheme.copyWith(
///   extensions: FaTheme.extensions(seed: companyPrimaryColour),
/// )
/// ```
///
/// Widgets then read them through `BuildContext`:
///
/// ```dart
/// Text('Verified', style: context.faText.pillLabel)
/// Container(color: context.faColors.surface)
/// ```
library fa_flutter_ui_kit.design;

// Tokens
export 'src/design/tokens/fa_color_ramp.dart';
export 'src/design/tokens/fa_color_tokens.dart';
export 'src/design/tokens/fa_gradient_tokens.dart';
export 'src/design/tokens/fa_radius.dart';
export 'src/design/tokens/fa_spacing.dart';
export 'src/design/tokens/fa_status_ramp.dart';
export 'src/design/tokens/fa_typography.dart';

// Theme
export 'src/design/theme/fa_theme.dart';
export 'src/design/theme/fa_theme_context.dart';

// Components
export 'src/design/components/pill/fa_pill.dart';
export 'src/design/components/scaffold/fa_backdrop.dart';
export 'src/design/components/scaffold/fa_scaffold.dart';
export 'src/design/components/scaffold/fa_top_nav.dart';
