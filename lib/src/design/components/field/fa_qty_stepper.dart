import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';

/// A minus / value / plus counter with an optional caption under it, as the
/// MT 2.0 review rows use for each unit.
class FaQtyStepper extends StatelessWidget {
  const FaQtyStepper({
    required this.value,
    required this.onChanged,
    this.caption,
    this.min = 0,
    this.max,
    super.key,
  });

  final int value;

  /// Null leaves the counter visible but not operable.
  final ValueChanged<int>? onChanged;
  final String? caption;
  final int min;

  /// The highest value the user can step up to; null leaves it open.
  final int? max;

  bool get _canDecrease => onChanged != null && value > min;

  bool get _canIncrease => onChanged != null && (max == null || value < max!);

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 36),
          decoration: BoxDecoration(
            color: colors.surfaceAlt,
            borderRadius: BorderRadius.circular(FaRadius.md),
            border: Border.all(color: colors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _StepButton(
                icon: Icons.remove_rounded,
                isEnabled: _canDecrease,
                onTap: () => onChanged!(value - 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: FaSpace.x8),
                child: Text(
                  '$value',
                  style: context.faText.bodyStrong
                      .copyWith(color: colors.textPrimary),
                ),
              ),
              _StepButton(
                icon: Icons.add_rounded,
                isEnabled: _canIncrease,
                onTap: () => onChanged!(value + 1),
              ),
            ],
          ),
        ),
        if (caption != null) ...[
          const SizedBox(height: FaSpace.x4),
          Text(
            caption!,
            style: context.faText.caption.copyWith(color: colors.textSecondary),
          ),
        ],
      ],
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({
    required this.icon,
    required this.isEnabled,
    required this.onTap,
  });

  final IconData icon;
  final bool isEnabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return InkWell(
      onTap: isEnabled ? onTap : null,
      borderRadius: BorderRadius.circular(FaRadius.md),
      child: SizedBox(
        width: 36,
        height: 36,
        child: Icon(
          icon,
          size: 18,
          color: isEnabled ? colors.textPrimary : colors.textTertiary,
        ),
      ),
    );
  }
}
