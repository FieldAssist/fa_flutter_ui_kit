import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import 'fa_top_nav.dart';

/// The painted area behind a screen's header.
///
/// Sealed so that adding a new kind of backdrop means adding a subtype here,
/// not editing [FaScaffold] — the scaffold only ever calls [build].
sealed class FaBackdrop {
  const FaBackdrop();

  /// No backdrop; the screen shows its plain background.
  const factory FaBackdrop.none() = FaBackdropNone;

  /// MT 2.0's default: a brand gradient whose bottom edge bows downward.
  ///
  /// [overhang] is how far the band reaches below the header and [sagitta]
  /// how far its lowest point drops below its edges. The defaults are
  /// measured from the MT 2.0 "Outlet Detail" screen.
  const factory FaBackdrop.brandCurve({double overhang, double sagitta}) =
      FaBackdropBrandCurve;

  /// A brand gradient with a straight bottom edge.
  const factory FaBackdrop.brandFlat({double height}) = FaBackdropBrandFlat;

  /// A plain surface strip behind the status bar and header, as the list
  /// screens are drawn.
  const factory FaBackdrop.surface() = FaBackdropSurface;

  /// Anything else the caller wants to paint up there.
  const factory FaBackdrop.custom(Widget child) = FaBackdropCustom;

  Widget build(BuildContext context);

  /// Where a screen's content may start: the backdrop's own bottom, so no
  /// content is painted on it unless the screen asks to overlap.
  double contentInset(BuildContext context);
}

/// Status bar plus header — the strip every backdrop covers at least.
double _headerBottom(BuildContext context) =>
    MediaQuery.paddingOf(context).top + FaTopNav.height;

final class FaBackdropNone extends FaBackdrop {
  const FaBackdropNone();

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();

  @override
  double contentInset(BuildContext context) => _headerBottom(context);
}

final class FaBackdropBrandCurve extends FaBackdrop {
  const FaBackdropBrandCurve({
    this.overhang = defaultOverhang,
    this.sagitta = 13,
  });

  /// The MT 2.0 "Outlet Detail" band, measured below its header.
  static const double defaultOverhang = 61;

  /// How far the band reaches below the header.
  final double overhang;

  /// How far the lowest point drops below the left and right edges.
  final double sagitta;

  @override
  Widget build(BuildContext context) => ClipPath(
        clipper: _CurveClipper(sagitta),
        child: Container(
          // Measured from the header, so the band keeps its shape whatever
          // the device's status bar costs.
          height: contentInset(context),
          decoration: BoxDecoration(
            gradient: context.faGradients.headerBackdrop,
          ),
        ),
      );

  @override
  double contentInset(BuildContext context) =>
      _headerBottom(context) + overhang;
}

final class FaBackdropBrandFlat extends FaBackdrop {
  const FaBackdropBrandFlat({this.height});

  /// Defaults to the header's own height.
  final double? height;

  @override
  Widget build(BuildContext context) => Container(
        height: contentInset(context),
        decoration: BoxDecoration(
          gradient: context.faGradients.headerBackdrop,
        ),
      );

  @override
  double contentInset(BuildContext context) =>
      height ?? _headerBottom(context);
}

final class FaBackdropSurface extends FaBackdrop {
  const FaBackdropSurface();

  @override
  Widget build(BuildContext context) => Container(
        height: contentInset(context),
        color: context.faColors.surface,
      );

  @override
  double contentInset(BuildContext context) => _headerBottom(context);
}

final class FaBackdropCustom extends FaBackdrop {
  const FaBackdropCustom(this.child, {this.contentInsetOf});

  final Widget child;

  /// Where content may start; the header's bottom when not given.
  final double Function(BuildContext context)? contentInsetOf;

  @override
  Widget build(BuildContext context) => child;

  @override
  double contentInset(BuildContext context) =>
      contentInsetOf?.call(context) ?? _headerBottom(context);
}

/// Clips a rectangle so its bottom edge bows downward by [sagitta].
///
/// The control point sits `sagitta` *below* the box, which puts the curve's
/// midpoint exactly `sagitta` below the edges — a quadratic reaches only half
/// way to its control point.
class _CurveClipper extends CustomClipper<Path> {
  const _CurveClipper(this.sagitta);

  final double sagitta;

  @override
  Path getClip(Size size) {
    final edgeY = size.height - sagitta;
    return Path()
      ..lineTo(0, edgeY)
      ..quadraticBezierTo(size.width / 2, size.height + sagitta, size.width, edgeY)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(_CurveClipper oldClipper) => oldClipper.sagitta != sagitta;
}
