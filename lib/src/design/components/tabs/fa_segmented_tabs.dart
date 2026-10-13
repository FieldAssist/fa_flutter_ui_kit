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
      // The raised pill fills the track's height, as the Figma pill does.
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final (index, tab) in tabs.indexed) ...[
              if (index > 0) const SizedBox(width: FaSpace.x6),
              Expanded(
                child: _Segment(
                  tab: tab,
                  isSelected: index == selectedIndex,
                  onTap: () => onChanged(index),
                ),
              ),
            ],
          ],
        ),
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
      // A fixed height, so one digit reads as a square-ish badge rather than
      // an upright oval; the text's own line box would make it taller.
      height: _size,
      constraints: const BoxConstraints(minWidth: _size),
      padding: const EdgeInsets.symmetric(horizontal: FaSpace.x4),
      decoration: BoxDecoration(
        color: isSelected ? colors.brand : colors.trackStrong,
        // Rounded, not a pill: a two-digit count must not read as an oval.
        borderRadius: BorderRadius.circular(FaRadius.lg),
      ),
      child: Center(
        widthFactor: 1,
        child: Text(
          '$count',
          strutStyle: const StrutStyle(height: 1, forceStrutHeight: true),
          style: context.faText.s12.w600.copyWith(
            color: isSelected ? colors.onBrand : colors.textTertiary,
          ),
        ),
      ),
    );
  }
}
