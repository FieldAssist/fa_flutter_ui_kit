import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/fa_theme_context.dart';
import 'fa_backdrop.dart';

/// The screen shell for MT 2.0.
///
/// Composes — rather than extends — [Scaffold], so screens get the header,
/// gradient backdrop and status-bar treatment without inheriting a concrete
/// widget's constructor. Layering, and only layering, is its job: the header
/// is [FaTopNav]'s, the painted area is [FaBackdrop]'s.
///
/// ```dart
/// FaScaffold(
///   header: FaTopNav(title: 'Outlet Details', leading: back, actions: [call]),
///   body: content,
/// )
/// ```
class FaScaffold extends StatelessWidget {
  const FaScaffold({
    required this.body,
    this.header,
    this.backdrop = const FaBackdrop.brandCurve(),
    this.bottomBar,
    this.floatingActionButton,
    this.background,
    this.contentOverlap = 0,
    this.resizeToAvoidBottomInset,
    super.key,
  });

  final Widget body;

  /// Usually a [FaTopNav]. Drawn over [backdrop], never behind it.
  final PreferredSizeWidget? header;

  /// Painted from the top of the screen down, behind the status bar.
  final FaBackdrop backdrop;

  final Widget? bottomBar;
  final Widget? floatingActionButton;

  /// Defaults to the canvas token.
  final Color? background;

  /// How far the body may reach up into [backdrop]. Zero keeps content off
  /// the backdrop entirely; a screen with a hero that straddles the band —
  /// the hub's outlet avatar — asks for as much as it needs.
  final double contentOverlap;

  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    final header = this.header;
    // With `extendBodyBehindAppBar` the body starts at the very top of the
    // screen, which is what lets the backdrop run behind the status bar. Body
    // content is pushed clear of the backdrop again here — and clipped to the
    // same line — so a scrolling list passes under the band instead of over
    // it, and callers still lay out from the top of their own content.
    final topInset = header == null
        ? 0.0
        : (backdrop.contentInset(context) - contentOverlap)
            .clamp(0.0, double.infinity);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: background ?? context.faColors.canvas,
        extendBodyBehindAppBar: true,
        appBar: header,
        bottomNavigationBar: bottomBar,
        floatingActionButton: floatingActionButton,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        // `Scaffold` hands its body *loose* constraints, so a plain Stack would
        // shrink-wrap to whatever the screen's content happens to measure and
        // drag the full-bleed backdrop in with it. Expanding pins both to the
        // screen.
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: backdrop.build(context),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(top: topInset),
                child: ClipRect(child: body),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Status-bar icons follow the backdrop: light over a brand gradient, dark
  /// over the plain canvas.
  SystemUiOverlayStyle get _overlayStyle => switch (backdrop) {
        FaBackdropBrandCurve() ||
        FaBackdropBrandFlat() =>
          SystemUiOverlayStyle.light,
        FaBackdropNone() || FaBackdropSurface() => SystemUiOverlayStyle.dark,
        FaBackdropCustom() => SystemUiOverlayStyle.light,
      };
}
