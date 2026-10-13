import 'package:flutter/widgets.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';

/// A bar split into one segment per item, the first [done] filled in brand:
/// the "2 of 5 done" strip under a task list's summary.
class FaSegmentedProgress extends StatelessWidget {
  const FaSegmentedProgress({
    required this.total,
    required this.done,
    this.height = 4,
    super.key,
  });

  final int total;
  final int done;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return Row(
      children: [
        for (var i = 0; i < total; i++) ...[
          if (i > 0) const SizedBox(width: FaSpace.x2),
          Expanded(
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: i < done ? colors.brand : colors.track,
                borderRadius: BorderRadius.circular(FaRadius.pill),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
