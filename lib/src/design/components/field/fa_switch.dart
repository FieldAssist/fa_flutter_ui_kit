import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';

/// MT 2.0's on / off toggle, brand-tinted when on.
///
/// Drawn rather than themed from Material's [Switch]: the design's 33x18 track
/// is far smaller than Material's, which sizes its own thumb and ripple.
class FaSwitch extends StatelessWidget {
  const FaSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  static const double width = 33;
  static const double height = 18;

  static const double _thumb = 16;
  static const double _inset = (height - _thumb) / 2;

  final bool value;

  /// Null leaves the toggle in place but not operable.
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final onChanged = this.onChanged;
    return Semantics(
      toggled: value,
      enabled: onChanged != null,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onChanged == null ? null : () => onChanged(!value),
        child: AnimatedContainer(
          duration: kThemeAnimationDuration,
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: _inset),
          decoration: BoxDecoration(
            color: value ? colors.brand : colors.track,
            borderRadius: BorderRadius.circular(FaRadius.pill),
          ),
          child: AnimatedAlign(
            duration: kThemeAnimationDuration,
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: SizedBox.square(
              dimension: _thumb,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.surface,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
