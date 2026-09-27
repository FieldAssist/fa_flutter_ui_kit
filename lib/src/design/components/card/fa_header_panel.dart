import 'package:flutter/widgets.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_spacing.dart';

/// The surface panel hung under a flat brand header, its bottom corners
/// rounded, that holds a screen's summary (a task list's "2 of 5 done").
class FaHeaderPanel extends StatelessWidget {
  const FaHeaderPanel({required this.child, super.key});

  // Measured from the MT 2.0 task list frame.
  static const double _cornerRadius = 16;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(_cornerRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            offset: const Offset(0, -2),
            blurRadius: 14.5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(FaSpace.x24),
        child: child,
      ),
    );
  }
}
