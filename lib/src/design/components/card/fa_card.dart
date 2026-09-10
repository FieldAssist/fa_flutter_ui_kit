import 'package:flutter/widgets.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';

class FaCard extends StatelessWidget {
  const FaCard({
    required this.child,
    this.padding = const EdgeInsets.all(FaSpace.x12),
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(FaRadius.xxl),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            offset: const Offset(0, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
