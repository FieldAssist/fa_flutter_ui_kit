import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';

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
  /// [depth] is the distance from the top of the screen to the curve's lowest
  /// point, and [sagitta] how far that point sits below the edges. The
  /// defaults are measured from the MT 2.0 "Outlet Detail" screen.
  const factory FaBackdrop.brandCurve({double depth, double sagitta}) =
      FaBackdropBrandCurve;

  /// A brand gradient with a straight bottom edge.
  const factory FaBackdrop.brandFlat({double height}) = FaBackdropBrandFlat;

  /// Anything else the caller wants to paint up there.
  const factory FaBackdrop.custom(Widget child) = FaBackdropCustom;

  Widget build(BuildContext context);
}

final class FaBackdropNone extends FaBackdrop {
  const FaBackdropNone();

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

final class FaBackdropBrandCurve extends FaBackdrop {
  const FaBackdropBrandCurve({this.depth = 162, this.sagitta = 13});

  /// Screen top to the curve's lowest point.
  final double depth;

  /// How far the lowest point drops below the left and right edges.
  final double sagitta;

  @override
  Widget build(BuildContext context) => ClipPath(
        clipper: _CurveClipper(sagitta),
        child: Container(
          height: depth,
          decoration: BoxDecoration(
            gradient: context.faGradients.headerBackdrop,
          ),
        ),
      );
}

final class FaBackdropBrandFlat extends FaBackdrop {
  const FaBackdropBrandFlat({this.height = 158});

  final double height;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        decoration: BoxDecoration(
          gradient: context.faGradients.headerBackdrop,
        ),
      );
}

final class FaBackdropCustom extends FaBackdrop {
  const FaBackdropCustom(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
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
