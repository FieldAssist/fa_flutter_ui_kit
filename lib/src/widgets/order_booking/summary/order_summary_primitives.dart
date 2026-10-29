import 'package:fa_flutter_core/fa_flutter_core.dart' show SvgPicture;
import 'package:flutter/material.dart';

import '../../../config/colors.dart';

/// Text styles shared by the summary building blocks.
///
/// No font family: the card inherits the host screen's face, so a summary
/// never looks different from the page it sits on.
abstract final class OrderSummaryTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle value = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.black87,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.kLightGrey,
  );

  static const TextStyle rowLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.kLightGrey,
  );

  static const TextStyle rowValue = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static const TextStyle pill = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}

/// The rounded card every summary section sits in.
class OrderSummaryFrame extends StatelessWidget {
  const OrderSummaryFrame({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      // Same outer margin as the neighbouring cards on summary screens, so the
      // card edges line up.
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}

/// A rounded square holding a section's glyph.
///
/// [tint] recolours a single-colour glyph; leave it null for a multi-colour
/// one, which tinting would flatten.
class OrderSummaryIconTile extends StatelessWidget {
  const OrderSummaryIconTile({
    required this.assetPath,
    required this.background,
    this.tint,
    super.key,
  });

  static const double size = 40;
  static const double _glyphSize = 22;

  final String assetPath;
  final Color background;
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    final tint = this.tint;
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: _glyphSize,
            height: _glyphSize,
            colorFilter:
                tint == null ? null : ColorFilter.mode(tint, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}

/// A section of the summary card: icon tile, title, optional badge and value
/// on one header line, with [children] that expand under it.
///
/// Give it a [PageStorageKey] to keep the expanded state when the section is
/// rebuilt out of view, the way [ExpansionTile] does.
class OrderSummarySection extends StatefulWidget {
  const OrderSummarySection({
    required this.leading,
    required this.title,
    this.badge,
    this.value,
    this.secondaryValue,
    this.children = const [],
    this.initiallyExpanded = true,
    this.chevronColor,
    super.key,
  });

  /// Where rows under a section start, so they line up with its title.
  static const double contentInset = OrderSummaryIconTile.size + _gap;
  static const double _gap = 12;
  static const double _minHeaderHeight = 48;

  final Widget leading;
  final String title;
  final Widget? badge;
  final String? value;

  /// A smaller line under [value], such as the amount in a second currency.
  final String? secondaryValue;
  final List<Widget> children;
  final bool initiallyExpanded;

  /// Defaults to the theme's primary colour, as [ExpansionTile] does.
  final Color? chevronColor;

  @override
  State<OrderSummarySection> createState() => _OrderSummarySectionState();
}

class _OrderSummarySectionState extends State<OrderSummarySection> {
  late bool _isExpanded;

  bool get _canExpand => widget.children.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _isExpanded = PageStorage.maybeOf(context)?.readState(context) as bool? ??
        widget.initiallyExpanded;
  }

  void _toggle() {
    setState(() => _isExpanded = !_isExpanded);
    PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final header = ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: OrderSummarySection._minHeaderHeight,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            widget.leading,
            const SizedBox(width: OrderSummarySection._gap),
            Expanded(
              child: _LabelValueLayout(
                label: widget.title,
                labelStyle: OrderSummaryTextStyles.title,
                badge: widget.badge,
                value: widget.value,
                valueStyle: OrderSummaryTextStyles.value,
                secondaryValue: widget.secondaryValue,
                secondaryValueStyle: OrderSummaryTextStyles.rowValue,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            if (_canExpand) ...[
              const SizedBox(width: 4),
              AnimatedRotation(
                turns: _isExpanded ? 0 : 0.5,
                duration: kThemeAnimationDuration,
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: widget.chevronColor ??
                      Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ],
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          expanded: _canExpand ? _isExpanded : null,
          child: InkWell(
            onTap: _canExpand ? _toggle : null,
            borderRadius: BorderRadius.circular(8),
            child: header,
          ),
        ),
        AnimatedSize(
          duration: kThemeAnimationDuration,
          alignment: AlignmentDirectional.topStart,
          child: _canExpand && _isExpanded
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: OrderSummarySection.contentInset,
                    bottom: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widget.children,
                  ),
                )
              : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}

/// One label/value line under a [OrderSummarySection].
class OrderSummaryRow extends StatelessWidget {
  const OrderSummaryRow({
    required this.label,
    required this.value,
    this.labelColor,
    this.valueColor,
    this.identifier,
    super.key,
  });

  final String label;
  final String value;
  final Color? labelColor;
  final Color? valueColor;

  /// Optional `Semantics(identifier:)` for E2E tests. Pass a stable kind,
  /// never the label: labels are company-config driven.
  final String? identifier;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: identifier ?? '',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: _LabelValueLayout(
          label: label,
          labelStyle: OrderSummaryTextStyles.rowLabel.copyWith(
            color: labelColor,
          ),
          value: value,
          valueStyle: OrderSummaryTextStyles.rowValue.copyWith(
            color: valueColor,
          ),
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}

/// Puts [label] and [value] side by side when the whole value fits beside a
/// label of at most [_maxInlineLabelLines] lines, and otherwise moves the
/// value to its own end-aligned line under the label.
///
/// So neither text breaks mid-word or mid-number, and a narrow screen or a
/// large text scale never squeezes the label into a word-per-line column.
class _LabelValueLayout extends StatelessWidget {
  const _LabelValueLayout({
    required this.label,
    required this.labelStyle,
    required this.crossAxisAlignment,
    this.badge,
    this.value,
    this.valueStyle,
    this.secondaryValue,
    this.secondaryValueStyle,
  });

  static const double _gap = 8;
  static const int _maxInlineLabelLines = 2;

  final String label;
  final TextStyle labelStyle;
  final Widget? badge;
  final String? value;
  final TextStyle? valueStyle;
  final String? secondaryValue;
  final TextStyle? secondaryValueStyle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final badge = this.badge;
    final value = this.value;
    final secondaryValue = this.secondaryValue;
    final labelWidget = badge == null
        ? Text(label, style: labelStyle)
        : Wrap(
            spacing: _gap,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [Text(label, style: labelStyle), badge],
          );
    if (value == null) {
      return labelWidget;
    }
    final valueWidget = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(value, style: valueStyle, textAlign: TextAlign.end),
        if (secondaryValue != null)
          Text(
            secondaryValue,
            style: secondaryValueStyle,
            textAlign: TextAlign.end,
          ),
      ],
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        final measure = _TextMeasure(context);
        final valueWidth = [
          measure.width(value, valueStyle),
          if (secondaryValue != null)
            measure.width(secondaryValue, secondaryValueStyle),
        ].reduce((a, b) => a > b ? a : b);
        final labelWidth = constraints.maxWidth - _gap - valueWidth;
        final fitsInline =
            measure.longestWordWidth(label, labelStyle) <= labelWidth &&
                measure.lineCount(label, labelStyle, labelWidth) <=
                    _maxInlineLabelLines;
        if (fitsInline) {
          return Row(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Expanded(child: labelWidget),
              const SizedBox(width: _gap),
              valueWidget,
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            labelWidget,
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: valueWidget,
            ),
          ],
        );
      },
    );
  }
}

/// Measures text the way a [Text] in [context] would lay it out: same
/// inherited style, text scale and direction.
class _TextMeasure {
  _TextMeasure(BuildContext context)
      : _baseStyle = DefaultTextStyle.of(context).style,
        _textScaler = MediaQuery.textScalerOf(context),
        _textDirection = Directionality.of(context);

  final TextStyle _baseStyle;
  final TextScaler _textScaler;
  final TextDirection _textDirection;

  double width(String text, TextStyle? style) =>
      _measure(text, style, (painter) => painter.maxIntrinsicWidth);

  double longestWordWidth(String text, TextStyle? style) =>
      _measure(text, style, (painter) => painter.minIntrinsicWidth);

  int lineCount(String text, TextStyle? style, double maxWidth) {
    final painter = _painter(text, style)..layout(maxWidth: maxWidth);
    final lines = painter.computeLineMetrics().length;
    painter.dispose();
    return lines;
  }

  double _measure(
    String text,
    TextStyle? style,
    double Function(TextPainter painter) read,
  ) {
    final painter = _painter(text, style)..layout();
    // Round up so a sub-pixel shortfall never wraps the last glyph.
    final width = read(painter).ceilToDouble();
    painter.dispose();
    return width;
  }

  TextPainter _painter(String text, TextStyle? style) => TextPainter(
        text: TextSpan(text: text, style: _baseStyle.merge(style)),
        textDirection: _textDirection,
        textScaler: _textScaler,
      );
}

/// A small tinted label beside a section title, such as a discount rate.
class OrderSummaryPill extends StatelessWidget {
  const OrderSummaryPill({required this.label, required this.color, super.key});

  static const double _tintAlpha = 0.12;

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: _tintAlpha),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(label,
            style: OrderSummaryTextStyles.pill.copyWith(color: color)),
      ),
    );
  }
}

/// A read-only, tappable box showing a chosen value with a dropdown chevron.
/// [onTap] opens whatever picks the value; null shows it without a chevron.
class OrderSummarySelectBox extends StatelessWidget {
  const OrderSummarySelectBox({required this.value, this.onTap, super.key});

  static const double _minWidth = 120;
  static const double _minHeight = 40;

  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).dividerColor;
    return Semantics(
      button: onTap != null,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: _minWidth,
              minHeight: _minHeight,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(value, style: OrderSummaryTextStyles.rowValue),
                ),
                if (onTap != null) ...[
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                    color: AppColors.kLightGrey,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
