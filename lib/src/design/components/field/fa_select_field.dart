import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import '../buttons/fa_button.dart';
import '../sheet/fa_bottom_sheet.dart';
import 'fa_field_label.dart';
import 'fa_text_field.dart';

/// MT 2.0's labelled dropdown: the chosen value, marked with a filled radio,
/// and a chevron. [onTap] opens the choices — usually [FaOptionsSheet].
class FaSelectField extends StatelessWidget {
  const FaSelectField({
    required this.label,
    required this.onTap,
    this.value,
    this.hint,
    this.isRequired = false,
    this.errorText,
    super.key,
  });

  final String label;

  /// What is chosen; null shows [hint].
  final String? value;
  final String? hint;
  final bool isRequired;
  final String? errorText;

  /// Null shows the value without letting it change.
  final VoidCallback? onTap;

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
          button: onTap != null,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(
              constraints:
                  const BoxConstraints(minHeight: FaTextField.minHeight),
              padding: const EdgeInsets.symmetric(
                horizontal: FaSpace.x12,
                vertical: FaSpace.x8,
              ),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(FaRadius.md),
                border: Border.all(
                  color: errorText == null ? colors.borderStrong : danger,
                ),
              ),
              child: Row(
                children: [
                  if (value != null) ...[
                    Icon(
                      Icons.radio_button_checked,
                      size: 18,
                      color: colors.brand,
                    ),
                    const SizedBox(width: FaSpace.x8),
                  ],
                  Expanded(
                    child: Text(
                      value ?? hint ?? '',
                      style: value == null
                          ? text.body.copyWith(color: colors.textTertiary)
                          : text.bodyStrong.copyWith(color: colors.textStrong),
                    ),
                  ),
                  if (onTap != null)
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
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
}

/// A bottom sheet of [options] to pick from: one ([FaOptionsSheet.single])
/// or several ([FaOptionsSheet.multiple], confirmed with [doneLabel]).
class FaOptionsSheet extends StatefulWidget {
  const FaOptionsSheet._({
    required this.title,
    required this.options,
    required this.selected,
    required this.isMultiple,
    this.doneLabel,
  });

  /// The picked option, or null when the sheet is dismissed.
  static Future<String?> single(
    BuildContext context, {
    required String title,
    required List<String> options,
    String? selected,
  }) async {
    final picked = await FaBottomSheet.show<Set<String>>(
      context,
      builder: (_) => FaOptionsSheet._(
        title: title,
        options: options,
        selected: {if (selected != null) selected},
        isMultiple: false,
      ),
    );
    return picked?.firstOrNull;
  }

  /// The picked options in [options] order, or null when dismissed.
  static Future<List<String>?> multiple(
    BuildContext context, {
    required String title,
    required List<String> options,
    required String doneLabel,
    List<String> selected = const [],
  }) async {
    final picked = await FaBottomSheet.show<Set<String>>(
      context,
      builder: (_) => FaOptionsSheet._(
        title: title,
        options: options,
        selected: selected.toSet(),
        isMultiple: true,
        doneLabel: doneLabel,
      ),
    );
    return picked == null
        ? null
        : [
            for (final option in options)
              if (picked.contains(option)) option
          ];
  }

  final String title;
  final List<String> options;
  final Set<String> selected;
  final bool isMultiple;
  final String? doneLabel;

  @override
  State<FaOptionsSheet> createState() => _FaOptionsSheetState();
}

class _FaOptionsSheetState extends State<FaOptionsSheet> {
  late final Set<String> _selected = {...widget.selected};

  void _toggle(String option) {
    if (!widget.isMultiple) {
      Navigator.of(context).pop({option});
      return;
    }
    setState(() {
      if (!_selected.remove(option)) {
        _selected.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    final doneLabel = widget.doneLabel;
    return FaBottomSheet(
      title: widget.title,
      action: doneLabel == null
          ? null
          : SizedBox(
              width: double.infinity,
              child: FaButton(
                label: doneLabel,
                onTap: () => Navigator.of(context).pop(_selected),
              ),
            ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final option in widget.options)
            InkWell(
              onTap: () => _toggle(option),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: FaSpace.x8,
                  vertical: FaSpace.x12,
                ),
                child: Row(
                  children: [
                    Icon(
                      _iconFor(isOn: _selected.contains(option)),
                      size: 20,
                      color: _selected.contains(option)
                          ? colors.brand
                          : colors.icon,
                    ),
                    const SizedBox(width: FaSpace.x12),
                    Expanded(
                      child: Text(
                        option,
                        style: text.body.copyWith(color: colors.textPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  IconData _iconFor({required bool isOn}) =>
      switch ((widget.isMultiple, isOn)) {
        (true, true) => Icons.check_box,
        (true, false) => Icons.check_box_outline_blank,
        (false, true) => Icons.radio_button_checked,
        (false, false) => Icons.radio_button_unchecked,
      };
}
