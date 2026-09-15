import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';

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
    this.action,
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

  static const double _handleWidth = 40;
  static const double _handleHeight = 4;

  final String title;
  final String? subtitle;
  final Widget child;

  /// Usually a full-width [FaButton].
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    final subtitle = this.subtitle;
    final action = this.action;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(FaRadius.xxl),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: FaSpace.x8),
              Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.border,
                    borderRadius: BorderRadius.circular(FaRadius.pill),
                  ),
                  child: const SizedBox(
                    width: _handleWidth,
                    height: _handleHeight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  FaSpace.x16,
                  FaSpace.x12,
                  FaSpace.x4,
                  FaSpace.x12,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: text.sectionTitle
                                .copyWith(color: colors.textPrimary),
                          ),
                          if (subtitle != null)
                            Text(
                              subtitle,
                              style: text.s12.w400
                                  .copyWith(color: colors.textSecondary),
                            ),
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
              Divider(height: 1, thickness: 1, color: colors.border),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(FaSpace.x16),
                  child: child,
                ),
              ),
              if (action != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    FaSpace.x16,
                    0,
                    FaSpace.x16,
                    FaSpace.x16,
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
