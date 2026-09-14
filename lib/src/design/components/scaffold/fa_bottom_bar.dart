import 'package:flutter/widgets.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_spacing.dart';

/// The bar pinned under a screen's content that holds its main action, such
/// as Checkout. Pass it as `FaScaffold.bottomBar`; it keeps its child clear of
/// the system gesture area itself.
class FaBottomBar extends StatelessWidget {
  const FaBottomBar({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: colors.border)),
        boxShadow: [
          // Cast upwards, onto the content the bar covers.
          BoxShadow(
            color: colors.shadow,
            offset: const Offset(0, -2),
            blurRadius: 14.5,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: FaSpace.x16),
        child: Padding(
          padding: const EdgeInsets.only(
            left: FaSpace.x16,
            top: FaSpace.x16,
            right: FaSpace.x16,
          ),
          child: child,
        ),
      ),
    );
  }
}
