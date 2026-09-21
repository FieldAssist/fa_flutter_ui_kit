import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';

/// How a sheet's header band is filled.
enum FaSheetHeaderTone {
  /// Continues the sheet's own surface.
  plain,

  /// Set back from the content, as the date-range sheet is drawn.
  muted,
}

/// MT 2.0's modal bottom sheet: a drag handle, a title with an optional
/// subtitle and a close button, scrollable content and an optional action
/// pinned below it.
///
/// Open it with [FaBottomSheet.show]. The sheet lifts above the keyboard, so
/// forms inside it stay visible while typing.
class FaBottomSheet extends StatelessWidget {
  const FaBottomSheet({
    required this.title,
    required this.child,
    this.subtitle,
    this.leading,
    this.action,
    this.headerTone = FaSheetHeaderTone.plain,
    super.key,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required WidgetBuilder builder,
  }) =>
      showModalBottomSheet<T>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: Colors.transparent,
        builder: builder,
      );

  static const double _handleWidth = 80;
  static const double _handleHeight = 3;

  final String title;
  final String? subtitle;

  /// Sits before the title — an [FaIconTile] or a bare [FaSvgIcon].
  final Widget? leading;

  final Widget child;

  /// Usually a full-width [FaButton].
  final Widget? action;

  final FaSheetHeaderTone headerTone;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    final subtitle = this.subtitle;
    final leading = this.leading;
    final action = this.action;
    final headerColor = switch (headerTone) {
      FaSheetHeaderTone.plain => colors.surface,
      FaSheetHeaderTone.muted => colors.surfaceMuted,
    };
    const topCorners = BorderRadius.vertical(
      top: Radius.circular(FaRadius.sheet),
    );
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: topCorners,
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: headerColor,
                  borderRadius: topCorners,
                  border: Border(
                    bottom: BorderSide(color: colors.border),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: FaSpace.x4),
                    Center(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: colors.track,
                          borderRadius: BorderRadius.circular(FaRadius.pill),
                        ),
                        child: const SizedBox(
                          width: _handleWidth,
                          height: _handleHeight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(FaSpace.x8),
                      child: Row(
                        children: [
                          if (leading != null) ...[
                            leading,
                            const SizedBox(width: FaSpace.x12),
                          ],
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  title,
                                  style: text.sectionTitle
                                      .copyWith(color: colors.textPrimary),
                                ),
                                if (subtitle != null) ...[
                                  const SizedBox(height: FaSpace.x4),
                                  Text(
                                    subtitle,
                                    style: text.s12.w400
                                        .copyWith(color: colors.textSecondary),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).maybePop(),
                            icon: Icon(Icons.close, color: colors.icon),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(FaSpace.x8),
                  child: child,
                ),
              ),
              if (action != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    FaSpace.x12,
                    0,
                    FaSpace.x12,
                    FaSpace.x12,
                  ),
                  child: action,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
