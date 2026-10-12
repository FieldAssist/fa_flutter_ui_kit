import 'package:flutter/material.dart';

import 'config/ui_common_colors.dart';

/// Can make it more configurable with color, text and other options
class FadingLineTextWidget extends StatelessWidget {
  const FadingLineTextWidget({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [UiCommonColors.kWhite, UiCommonColors.kBlack],
                ),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 0.2,
                  color: UiCommonColors.kTransparent,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.4,
              color: UiCommonColors.kBlack,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [UiCommonColors.kBlack, UiCommonColors.kWhite],
                ),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 0.2,
                  color: UiCommonColors.kTransparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
