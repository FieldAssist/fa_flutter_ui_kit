import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import 'fa_field_label.dart';
import 'fa_text_field.dart';

/// MT 2.0's labelled date input. A tap opens the date picker between
/// [firstDate] and [lastDate]; the chosen day comes back through [onChanged].
class FaDateField extends StatelessWidget {
  const FaDateField({
    required this.label,
    required this.value,
    required this.format,
    required this.firstDate,
    required this.lastDate,
    required this.onChanged,
    this.hint,
    this.isRequired = false,
    this.errorText,
    super.key,
  });

  final String label;
  final DateTime? value;

  /// Renders [value]; the kit has no date formatting of its own.
  final String Function(DateTime date) format;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onChanged;
  final String? hint;
  final bool isRequired;

  /// Shown under the field, which outlines in the danger colour while it is
  /// set, as [FaTextField] does.
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    final value = this.value;
    final errorText = this.errorText;
    final danger = colors.status.danger.solid;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FaFieldLabel(label, isRequired: isRequired),
        Semantics(
          button: true,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _pick(context),
            child: Container(
              constraints:
                  const BoxConstraints(minHeight: FaTextField.minHeight),
              padding: const EdgeInsets.symmetric(
                horizontal: FaSpace.x12,
                vertical: FaSpace.x10,
              ),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(FaRadius.md),
                border: Border.all(
                  color: errorText == null ? colors.border : danger,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value == null ? hint ?? '' : format(value),
                      style: text.body.copyWith(
                        color: value == null
                            ? colors.textTertiary
                            : colors.textPrimary,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                    color: colors.icon,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(
              left: FaSpace.x12,
              top: FaSpace.x6,
            ),
            child: Text(
              errorText,
              style: text.s12.w400.copyWith(color: danger),
            ),
          ),
      ],
    );
  }

  Future<void> _pick(BuildContext context) async {
    final current = value;
    final initial = current == null || current.isAfter(lastDate)
        ? lastDate
        : current.isBefore(firstDate)
            ? firstDate
            : current;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null) {
      onChanged(picked);
    }
  }
}
