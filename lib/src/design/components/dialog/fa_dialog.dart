import 'package:flutter/material.dart';

import '../../icons/fa_icon_asset.dart';
import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_spacing.dart';
import '../../tokens/fa_status_ramp.dart';
import '../buttons/fa_button.dart';
import '../icon/fa_svg_icon.dart';

enum FaDialogAction { primary, secondary }

/// MT 2.0's alert dialog: an icon badge sitting in a notch above the card, a
/// title, a message, one primary action and an optional text action.
///
/// Open it with [FaDialog.show]. The future completes with the action the
/// user tapped, or `null` when they dismiss the dialog.
class FaDialog extends StatelessWidget {
  const FaDialog({
    required this.icon,
    required this.title,
    required this.message,
    required this.primaryLabel,
    this.secondaryLabel,
    this.tone = FaTone.warning,
    super.key,
  });

  static Future<FaDialogAction?> show(
    BuildContext context, {
    required FaIconAsset icon,
    required String title,
    required String message,
    required String primaryLabel,
    String? secondaryLabel,
    FaTone tone = FaTone.warning,
  }) =>
      showDialog<FaDialogAction>(
        context: context,
        builder: (_) => FaDialog(
          icon: icon,
          title: title,
          message: message,
          primaryLabel: primaryLabel,
          secondaryLabel: secondaryLabel,
          tone: tone,
        ),
      );

  static const double _badgeSize = 72;

  final FaIconAsset icon;
  final String title;
  final String message;
  final String primaryLabel;
  final String? secondaryLabel;

  /// Tints the badge behind [icon].
  final FaTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    final badge = colors.status.of(tone);
    final secondary = secondaryLabel;
    return Dialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.all(FaSpace.x24),
      child: DecoratedBox(
        decoration: ShapeDecoration(
          color: colors.surface,
          shape: const _NotchedCardBorder(),
          shadows: [
            BoxShadow(
              color: colors.shadow,
              offset: const Offset(0, 2),
              blurRadius: 18,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            FaSpace.x16,
            FaSpace.x12,
            FaSpace.x16,
            FaSpace.x16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                dimension: _badgeSize,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: badge.tint,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: FaSvgIcon(icon, color: badge.ink)),
                ),
              ),
              const SizedBox(height: FaSpace.x22),
              Text(
                title,
                style: text.s24.w600.copyWith(color: colors.textPrimary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: FaSpace.x22),
              Text(
                message,
                style: text.body.copyWith(color: colors.textPrimary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: FaSpace.x22),
              SizedBox(
                width: double.infinity,
                child: FaButton(
                  label: primaryLabel,
                  onTap: () =>
                      Navigator.of(context).pop(FaDialogAction.primary),
                ),
              ),
              if (secondary != null) ...[
                const SizedBox(height: FaSpace.x12),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(FaDialogAction.secondary),
                  style: TextButton.styleFrom(
                    foregroundColor: colors.textSecondary,
                    textStyle: text.s13.w400,
                  ),
                  child: Text(secondary),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// A rounded card with a circular notch rising from the middle of its top
/// edge, joined to it by small fillets. Traced from the MT 2.0 dialog shape.
class _NotchedCardBorder extends ShapeBorder {
  const _NotchedCardBorder();

  static const double _notchRadius = 50;

  /// Distance from the top of the notch to the top edge of the card.
  static const double _bodyTop = 65;

  static const double _cornerRadius = 12;

  /// Control-point distance that makes a cubic curve a quarter circle.
  static const double _kappa = 0.5522847;

  // Fillet between the notch and the card edge, relative to the notch's
  // widest point.
  static const double _filletDrop = 7.5505;
  static const double _filletControl = 5.392;
  static const double _filletEnd = 12.943;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      getOuterPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    const r = _notchRadius;
    const k = _kappa * _notchRadius;
    const corner = Radius.circular(_cornerRadius);
    final cx = rect.center.dx;
    final top = rect.top;
    final body = top + _bodyTop;
    return Path()
      ..moveTo(cx, top)
      ..cubicTo(cx + k, top, cx + r, top + r - k, cx + r, top + r)
      ..cubicTo(
        cx + r,
        top + r + _filletDrop,
        cx + r + _filletControl,
        body,
        cx + r + _filletEnd,
        body,
      )
      ..lineTo(rect.right - _cornerRadius, body)
      ..arcToPoint(Offset(rect.right, body + _cornerRadius), radius: corner)
      ..lineTo(rect.right, rect.bottom - _cornerRadius)
      ..arcToPoint(
        Offset(rect.right - _cornerRadius, rect.bottom),
        radius: corner,
      )
      ..lineTo(rect.left + _cornerRadius, rect.bottom)
      ..arcToPoint(
        Offset(rect.left, rect.bottom - _cornerRadius),
        radius: corner,
      )
      ..lineTo(rect.left, body + _cornerRadius)
      ..arcToPoint(Offset(rect.left + _cornerRadius, body), radius: corner)
      ..lineTo(cx - r - _filletEnd, body)
      ..cubicTo(
        cx - r - _filletControl,
        body,
        cx - r,
        top + r + _filletDrop,
        cx - r,
        top + r,
      )
      ..cubicTo(cx - r, top + r - k, cx - k, top, cx, top)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
