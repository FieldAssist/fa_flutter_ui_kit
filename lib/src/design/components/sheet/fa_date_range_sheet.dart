import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import '../buttons/fa_button.dart';
import '../field/fa_calendar_range.dart';
import '../field/fa_field_label.dart';
import '../field/fa_text_field.dart';
import 'fa_bottom_sheet.dart';

/// MT 2.0's date-range sheet: the chosen days shown as a start and an end,
/// with the month calendar that sets them.
///
/// Pops the chosen range, or nothing when the sheet is dismissed. Every
/// string and both formatters are passed in — the kit carries no copy and no
/// date formatting of its own.
class FaDateRangeSheet extends StatefulWidget {
  const FaDateRangeSheet({
    required this.title,
    required this.sectionLabel,
    required this.startLabel,
    required this.endLabel,
    required this.actionLabel,
    required this.initialRange,
    required this.firstDate,
    required this.lastDate,
    required this.formatDate,
    required this.formatMonth,
    super.key,
  });

  final String title;
  final String sectionLabel;
  final String startLabel;
  final String endLabel;
  final String actionLabel;
  final DateTimeRange initialRange;
  final DateTime firstDate;
  final DateTime lastDate;
  final String Function(DateTime date) formatDate;
  final String Function(DateTime month) formatMonth;

  @override
  State<FaDateRangeSheet> createState() => _FaDateRangeSheetState();
}

class _FaDateRangeSheetState extends State<FaDateRangeSheet> {
  late DateTimeRange _range = widget.initialRange;

  @override
  Widget build(BuildContext context) {
    final text = context.faText;
    final colors = context.faColors;
    return FaBottomSheet(
      title: widget.title,
      action: SizedBox(
        width: double.infinity,
        child: FaButton(
          label: widget.actionLabel,
          onTap: () => Navigator.of(context).pop(_range),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.sectionLabel,
            style: text.sectionTitle.copyWith(color: colors.textPrimary),
          ),
          const SizedBox(height: FaSpace.x12),
          Row(
            children: [
              Expanded(
                child: _DateDisplay(
                  label: widget.startLabel,
                  value: widget.formatDate(_range.start),
                ),
              ),
              const SizedBox(width: FaSpace.x12),
              Expanded(
                child: _DateDisplay(
                  label: widget.endLabel,
                  value: widget.formatDate(_range.end),
                ),
              ),
            ],
          ),
          const SizedBox(height: FaSpace.x16),
          FaCalendarRange(
            range: _range,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            formatMonth: widget.formatMonth,
            onChanged: (range) => setState(() => _range = range),
          ),
        ],
      ),
    );
  }
}

/// A day of the chosen range. Read-only: the calendar below sets it.
class _DateDisplay extends StatelessWidget {
  const _DateDisplay({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FaFieldLabel(label),
        Container(
          constraints: const BoxConstraints(minHeight: FaTextField.minHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: FaSpace.x12,
            vertical: FaSpace.x10,
          ),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(FaRadius.md),
            border: Border.all(color: colors.border),
          ),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: colors.icon,
              ),
              const SizedBox(width: FaSpace.x8),
              Flexible(
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: text.body.copyWith(color: colors.textPrimary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
