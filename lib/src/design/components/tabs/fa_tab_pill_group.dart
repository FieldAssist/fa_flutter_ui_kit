import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';

/// MT 2.0's Tab Pill Group: a light track whose chosen segment is a filled
/// brand pill. Switches between views of one page, 2 to 5 labels.
class FaTabPillGroup extends StatelessWidget {
  const FaTabPillGroup({
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  }) : assert(labels.length >= 2 && labels.length <= 5);

  static const double _trackInset = FaSpace.x4;

  /// The group's laid-out height at the ambient text scale, for hosts that
  /// must reserve it up front, such as a pinned sliver header.
  static double heightOf(BuildContext context) {
    final style = _TabPill.labelStyle(context);
    final lineHeight =
        MediaQuery.textScalerOf(context).scale(style.fontSize!) * style.height!;
    return 2 * _trackInset + math.max(_TabPill._minHeight, lineHeight);
  }

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_trackInset),
      decoration: BoxDecoration(
        color: context.faColors.surface,
        borderRadius: BorderRadius.circular(FaRadius.xl),
      ),
      child: Row(
        children: [
          for (final (index, label) in labels.indexed)
            Expanded(
              child: _TabPill(
                label: label,
                isSelected: index == selectedIndex,
                onTap: () => onChanged(index),
              ),
            ),
        ],
      ),
    );
  }
}

class _TabPill extends StatelessWidget {
  const _TabPill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  static const double _minHeight = 32;

  static TextStyle labelStyle(BuildContext context) => context.faText.s14.w500;

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return Semantics(
      button: true,
      selected: isSelected,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: _minHeight),
          padding: const EdgeInsets.symmetric(horizontal: FaSpace.x10),
          decoration: BoxDecoration(
            color: isSelected ? colors.brand : Colors.transparent,
            borderRadius: BorderRadius.circular(FaRadius.lg),
            // MT 2.0's small shadow: two soft layers lifting the pill.
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colors.shadow,
                      offset: const Offset(0, 1),
                      blurRadius: 1.5,
                    ),
                    BoxShadow(
                      color: colors.shadow,
                      offset: const Offset(0, 1),
                      blurRadius: 1,
                    ),
                  ]
                : null,
          ),
          // Centres the label in the minimum height without growing past it.
          child: Center(
            heightFactor: 1,
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: labelStyle(context).copyWith(
                color: isSelected ? colors.onBrand : colors.textTertiary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
