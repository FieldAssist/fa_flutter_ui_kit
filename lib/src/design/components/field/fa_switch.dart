import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';

/// MT 2.0's on / off toggle, brand-tinted when on.
class FaSwitch extends StatelessWidget {
  const FaSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;

  /// Null leaves the toggle in place but not operable.
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return Switch(
      value: value,
      onChanged: onChanged,
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? colors.onBrand
            : colors.surface,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? colors.brand
            : colors.border,
      ),
      trackOutlineColor: WidgetStateProperty.all(colors.border),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
