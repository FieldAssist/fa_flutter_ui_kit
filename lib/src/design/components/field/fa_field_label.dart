import 'package:flutter/widgets.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_spacing.dart';

/// The label above an MT 2.0 form field, with a red asterisk when the field
/// is required.
class FaFieldLabel extends StatelessWidget {
  const FaFieldLabel(this.label, {this.isRequired = false, super.key});

  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final style = context.faText.s14.w500;
    return Padding(
      padding: const EdgeInsets.only(bottom: FaSpace.x6),
      child: Text.rich(
        TextSpan(
          text: label,
          style: style.copyWith(color: colors.textSecondary),
          children: [
            if (isRequired)
              TextSpan(
                text: '*',
                style: style.copyWith(color: colors.status.danger.solid),
              ),
          ],
        ),
      ),
    );
  }
}
