import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_spacing.dart';

/// MT 2.0's screen header.
///
/// It draws no background of its own: it sits on whatever the screen's
/// [FaBackdrop] paints, which is what lets the brand gradient run behind the
/// status bar. Give it to [FaScaffold] as `header`.
///
/// It implements [PreferredSizeWidget] rather than extending [AppBar], so it
/// drops into any `Scaffold.appBar` slot while staying a plain composition —
/// no Material chrome, paddings or overflow behaviour inherited by surprise.
class FaTopNav extends StatelessWidget implements PreferredSizeWidget {
  /// A title, and optionally a second line beneath it.
  const FaTopNav({
    required this.title,
    this.subtitle,
    this.leading,
    this.actions,
    super.key,
  }) : child = null;

  /// Arbitrary content between [leading] and [actions] — a search field, a
  /// segmented control, an outlet summary.
  const FaTopNav.custom({
    required Widget this.child,
    this.leading,
    this.actions,
    super.key,
  })  : title = null,
        subtitle = null;

  /// Header height, measured from the MT 2.0 file. Excludes the status bar.
  static const double height = 65;

  final String? title;
  final String? subtitle;
  final Widget? child;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    // The status bar inset is absorbed here rather than by the caller:
    // `Scaffold` reserves `preferredSize.height + MediaQuery.padding.top` for
    // a header, and normally only `AppBar` consumes that extra strip.
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(FaSpace.x8),
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: FaSpace.x14),
              ],
              Expanded(child: child ?? _title(context)),
              ...?actions,
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    final text = context.faText;
    final onBrand = context.faColors.onBrand;
    final subtitle = this.subtitle;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: text.navTitle.copyWith(color: onBrand),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: FaSpace.x2),
          Text(
            subtitle,
            style: text.navSubtitle.copyWith(color: onBrand),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}

/// An icon button sized for [FaTopNav].
///
/// Tinted with `onBrand` so it reads against the header gradient, and given a
/// 48px minimum tap target rather than the glyph's own 24px.
class FaNavAction extends StatelessWidget {
  const FaNavAction({
    required this.icon,
    required this.onTap,
    this.semanticLabel,
    super.key,
  });

  /// Minimum tap target. Material's accessibility floor, not a Figma value —
  /// the design's 56x53 action boxes are wider but no shorter.
  static const double minTapTarget = 48;

  static const double _glyphSize = 24;

  final IconData icon;
  final VoidCallback onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: InkResponse(
        onTap: onTap,
        radius: minTapTarget / 2,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: minTapTarget,
            minHeight: minTapTarget,
          ),
          child: Icon(
            icon,
            size: _glyphSize,
            color: context.faColors.onBrand,
          ),
        ),
      ),
    );
  }
}
