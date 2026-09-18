import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import '../../tokens/fa_status_ramp.dart';

/// MT 2.0's inline month calendar for choosing a range of days.
///
/// The first tap starts a new range on that day; the second closes it, in
/// whichever order the two days were tapped. Days outside [firstDate] and
/// [lastDate], and days of the neighbouring months, are shown but not
/// tappable.
///
/// The kit has no date formatting of its own, so the month heading arrives
/// through [formatMonth].
class FaCalendarRange extends StatefulWidget {
  const FaCalendarRange({
    required this.range,
    required this.firstDate,
    required this.lastDate,
    required this.onChanged,
    required this.formatMonth,
    super.key,
  });

  static const double dayHeight = 40;

  final DateTimeRange range;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTimeRange> onChanged;
  final String Function(DateTime month) formatMonth;

  @override
  State<FaCalendarRange> createState() => _FaCalendarRangeState();
}

class _FaCalendarRangeState extends State<FaCalendarRange> {
  late DateTime _month = DateUtils.dateOnly(widget.range.start);

  /// The day the range is being counted from, while its second day is still
  /// to be tapped.
  DateTime? _pendingStart;

  bool get _canGoBack =>
      DateUtils.monthDelta(widget.firstDate, _month) > 0;

  bool get _canGoForward =>
      DateUtils.monthDelta(_month, widget.lastDate) > 0;

  void _shiftMonth(int months) => setState(
        () => _month = DateUtils.addMonthsToMonthDate(_month, months),
      );

  void _select(DateTime day) {
    final pending = _pendingStart;
    if (pending == null) {
      setState(() => _pendingStart = day);
      widget.onChanged(DateTimeRange(start: day, end: day));
      return;
    }
    setState(() => _pendingStart = null);
    widget.onChanged(
      day.isBefore(pending)
          ? DateTimeRange(start: day, end: pending)
          : DateTimeRange(start: pending, end: day),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _MonthHeader(
          label: widget.formatMonth(_month),
          onPrevious: _canGoBack ? () => _shiftMonth(-1) : null,
          onNext: _canGoForward ? () => _shiftMonth(1) : null,
        ),
        const SizedBox(height: FaSpace.x12),
        const _WeekdayHeader(),
        const SizedBox(height: FaSpace.x4),
        for (final week in _weeksOf(context, _month))
          Row(
            children: [
              for (final day in week)
                Expanded(
                  child: _Day(
                    day: day,
                    isThisMonth: day.month == _month.month,
                    range: widget.range,
                    onTap: _isSelectable(day) ? () => _select(day) : null,
                  ),
                ),
            ],
          ),
      ],
    );
  }

  bool _isSelectable(DateTime day) =>
      day.month == _month.month &&
      !day.isBefore(DateUtils.dateOnly(widget.firstDate)) &&
      !day.isAfter(DateUtils.dateOnly(widget.lastDate));

  /// The grid of the month, padded with the neighbouring months' days so
  /// every week is a full row.
  static List<List<DateTime>> _weeksOf(BuildContext context, DateTime month) {
    final firstWeekday = MaterialLocalizations.of(context).firstDayOfWeekIndex;
    final first = DateTime(month.year, month.month);
    // DateTime counts Monday as 1 and Sunday as 7; the locale counts Sunday
    // as 0, so the first weekday wraps before the two can be subtracted.
    final offset = (first.weekday % DateTime.daysPerWeek) - firstWeekday;
    final leading = offset < 0 ? offset + DateTime.daysPerWeek : offset;
    final start = DateUtils.addDaysToDate(first, -leading);
    final cells = leading + DateUtils.getDaysInMonth(month.year, month.month);
    final weeks = (cells + DateTime.daysPerWeek - 1) ~/ DateTime.daysPerWeek;
    return [
      for (var week = 0; week < weeks; week++)
        [
          for (var day = 0; day < DateTime.daysPerWeek; day++)
            DateUtils.addDaysToDate(start, week * DateTime.daysPerWeek + day),
        ],
    ];
  }
}

class _MonthHeader extends StatelessWidget {
  const _MonthHeader({
    required this.label,
    required this.onPrevious,
    required this.onNext,
  });

  final String label;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final text = context.faText;
    final colors = context.faColors;
    return Row(
      children: [
        _Arrow(icon: Icons.chevron_left, onTap: onPrevious),
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: text.sectionTitle.copyWith(color: colors.textPrimary),
          ),
        ),
        _Arrow(icon: Icons.chevron_right, onTap: onNext),
      ],
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow({required this.icon, required this.onTap});

  static const double _size = 36;

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return Semantics(
      button: true,
      enabled: onTap != null,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minWidth: _size, minHeight: _size),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(FaRadius.lg),
            border: Border.all(color: colors.border),
          ),
          child: Icon(
            icon,
            size: 18,
            color: onTap == null ? colors.textTertiary : colors.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _WeekdayHeader extends StatelessWidget {
  const _WeekdayHeader();

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    final text = context.faText;
    final colors = context.faColors;
    return Row(
      children: [
        for (var day = 0; day < DateTime.daysPerWeek; day++)
          Expanded(
            child: Text(
              localizations.narrowWeekdays[
                  (localizations.firstDayOfWeekIndex + day) %
                      DateTime.daysPerWeek],
              textAlign: TextAlign.center,
              style: text.s12.w400.copyWith(color: colors.textSecondary),
            ),
          ),
      ],
    );
  }
}

class _Day extends StatelessWidget {
  const _Day({
    required this.day,
    required this.isThisMonth,
    required this.range,
    required this.onTap,
  });

  final DateTime day;
  final bool isThisMonth;
  final DateTimeRange range;
  final VoidCallback? onTap;

  bool get _isEdge =>
      DateUtils.isSameDay(day, range.start) ||
      DateUtils.isSameDay(day, range.end);

  bool get _isInside =>
      day.isAfter(DateUtils.dateOnly(range.start)) &&
      day.isBefore(DateUtils.dateOnly(range.end));

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final brand = colors.status.of(FaTone.brand);
    final isSelected = isThisMonth && _isEdge;
    final isInside = isThisMonth && _isInside;
    return Semantics(
      button: onTap != null,
      selected: isSelected,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: FaCalendarRange.dayHeight,
          ),
          margin: const EdgeInsets.symmetric(vertical: FaSpace.x2),
          decoration: BoxDecoration(
            color: isSelected
                ? brand.solid
                : isInside
                    ? brand.tint
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(FaRadius.md),
          ),
          child: Center(
            child: Text(
              '${day.day}',
              style: context.faText.cardTitle.copyWith(
                color: isSelected
                    ? colors.onBrand
                    : onTap == null
                        ? colors.textTertiary
                        : colors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
