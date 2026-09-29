import 'package:flutter/widgets.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_spacing.dart';

/// The fox with a magnifier over a title and message, centred in the space
/// a list would fill when it has nothing to show.
class FaEmptyState extends StatelessWidget {
  const FaEmptyState({required this.title, this.message, super.key});

  // Measured from the MT 2.0 "No Past Inwards" frame; the width is what
  // breaks its title and message onto two lines each.
  static const double _illustrationWidth = 121;
  static const double _illustrationHeight = 117;
  static const double _textWidth = 247;

  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    final message = this.message;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/fox_searching.png',
              package: 'fa_flutter_ui_kit',
              width: _illustrationWidth,
              height: _illustrationHeight,
              excludeFromSemantics: true,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _textWidth),
              child: Padding(
                padding: const EdgeInsets.all(FaSpace.x12),
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style:
                          text.sectionTitle.copyWith(color: colors.textPrimary),
                    ),
                    if (message != null) ...[
                      const SizedBox(height: FaSpace.x4),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: text.s14.w500.copyWith(color: colors.textStrong),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
