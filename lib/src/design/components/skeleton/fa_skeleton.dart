import 'package:fa_flutter_core/fa_flutter_core.dart' show Shimmer;
import 'package:flutter/widgets.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';

/// Shimmers over its child while content loads. Build the child from
/// [FaSkeletonBox]es shaped like the content that is on its way.
class FaSkeleton extends StatelessWidget {
  const FaSkeleton({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final neutral = context.faColors.status.neutral;
    return Shimmer.fromColors(
      baseColor: neutral.border,
      highlightColor: neutral.tint,
      child: child,
    );
  }
}

/// A placeholder block for [FaSkeleton].
class FaSkeletonBox extends StatelessWidget {
  const FaSkeletonBox({
    required this.height,
    this.width,
    this.radius = FaRadius.xl,
    super.key,
  });

  final double height;

  /// `null` fills the available width.
  final double? width;

  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.faColors.status.neutral.border,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
