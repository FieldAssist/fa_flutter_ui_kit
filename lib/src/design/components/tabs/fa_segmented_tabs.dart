import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';

/// One segment of [FaSegmentedTabs].
class FaSegmentedTab {
  const FaSegmentedTab({required this.label, required this.count});

  final String label;
  final int count;
}

/// MT 2.0's segmented tabs: a tinted track holding a raised pill for the
/// chosen segment, each segment carrying a count.
class FaSegmentedTabs extends StatelessWidget {
  const FaSegmentedTabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  });

  static const double minHeight = 41;

  /// The groove around the raised pill, thinner than the spacing scale goes.
  static const double _trackInset = 3;

  final List<FaSegmentedTab> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: minHeight),
      padding: const EdgeInsets.all(_trackInset),
      decoration: BoxDecoration(
        color: context.faColors.track,
        borderRadius: BorderRadius.circular(FaRadius.lg),
      ),
      child: Row(
        children: [
          for (final (index, tab) in tabs.indexed)
            Expanded(
              child: _Segment(
                tab: tab,
                isSelected: index == selectedIndex,
                onTap: () => onChanged(index),
              ),
            ),
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  final FaSegmentedTab tab;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    return Semantics(
      button: true,
      selected: isSelected,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isSelected ? colors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(FaRadius.lg),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: FaSpace.x8,
              vertical: FaSpace.x4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    tab.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: text.s12.w500.copyWith(
                      color: isSelected ? colors.brand : colors.textTertiary,
                    ),
                  ),
                ),
                const SizedBox(width: FaSpace.x6),
                _Count(count: tab.count, isSelected: isSelected),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Count extends StatelessWidget {
  const _Count({required this.count, required this.isSelected});

  static const double _size = 16;

  final int count;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return Container(
      constraints: const BoxConstraints(minWidth: _size, minHeight: _size),
      padding: const EdgeInsets.symmetric(horizontal: FaSpace.x4),
      decoration: BoxDecoration(
        color: isSelected ? colors.brand : colors.trackStrong,
        borderRadius: BorderRadius.circular(FaRadius.pill),
      ),
      child: Center(
        widthFactor: 1,
        child: Text(
          '$count',
          style: context.faText.s12.w600.copyWith(
            color: isSelected ? colors.onBrand : colors.textTertiary,
          ),
        ),
      ),
    );
  }
}
