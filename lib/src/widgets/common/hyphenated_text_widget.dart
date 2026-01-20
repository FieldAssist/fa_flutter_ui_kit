/*
 * A custom Text widget that prevents automatic line breaks at hyphens.
 * It replaces normal hyphens with non-breaking hyphens internally.
 * This ensures codes/IDs don’t split prematurely and wrap only when necessary.
 */
import 'package:flutter/material.dart';

class NonBreakingHyphenText extends StatelessWidget {
  const NonBreakingHyphenText(
    this.text, {
    super.key,
    this.style,
    this.maxLines = 2,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final int maxLines;
  final TextAlign? textAlign;

  static String _preventHyphenWrap(String value) {
    return value.replaceAll('-', '\u2011');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _preventHyphenWrap(text),
      style: style,
      maxLines: maxLines,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textWidthBasis: TextWidthBasis.longestLine,
      textAlign: textAlign,
    );
  }
}
