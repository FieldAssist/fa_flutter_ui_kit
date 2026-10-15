import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'config/ui_common_colors.dart';
import 'config/ui_common_texts.dart';
import 'logger.dart';

typedef BarcodeHandler = Future<void> Function(String code);

class ProductBarcodeScannerPage extends StatefulWidget {
  const ProductBarcodeScannerPage({
    required this.onScanned,
    this.title,
    this.subtitle,
    this.formats = const [BarcodeFormat.all],
    this.screenIdentifier,
    this.closeIdentifier,
    super.key,
  });

  final BarcodeHandler onScanned;
  final String? title;
  final String? subtitle;

  /// Which barcode symbologies to detect. Restricting to a single format
  /// (e.g. `[BarcodeFormat.qrCode]`) makes detection faster, avoids
  /// false-positives from nearby 1D codes, and renders a square window.
  final List<BarcodeFormat> formats;

  /// Optional `Semantics(identifier:)` values for E2E tests: the page itself
  /// and its close button. Null adds no id, so callers are unaffected.
  final String? screenIdentifier;
  final String? closeIdentifier;

  bool get _isQrOnly =>
      formats.length == 1 && formats.first == BarcodeFormat.qrCode;

  @override
  State<ProductBarcodeScannerPage> createState() =>
      _ProductBarcodeScannerPageState();
}

class _ProductBarcodeScannerPageState extends State<ProductBarcodeScannerPage> {
  late final MobileScannerController _controller;
  bool _isHandled = false;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      returnImage: false,
      formats: widget.formats,
    );
  }

  static const _rearmCooldown = Duration(milliseconds: 500);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_isHandled || !mounted) {
      return;
    }
    final code =
        capture.barcodes.isNotEmpty ? capture.barcodes.first.rawValue : null;
    if (code == null || code.isEmpty) {
      return;
    }
    _isHandled = true;
    unawaited(HapticFeedback.lightImpact());
    unawaited(_invokeHandler(code));
  }

  Future<void> _invokeHandler(String code) async {
    try {
      await widget.onScanned(code);
    } catch (e, s) {
      faUiCommonLogger.e('ProductBarcodeScanner.onScanned failed $e', s);
    } finally {
      await Future<void>.delayed(_rearmCooldown);
      if (mounted) {
        _isHandled = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.title ?? UiCommonTexts().kScanProductBarcode;
    final subtitle = widget.subtitle ?? UiCommonTexts().kScanProductBarcodeHint;
    final overlayColor = UiCommonColors.kBlackC.withOpacity(0.6);

    return Semantics(
      identifier: widget.screenIdentifier,
      // Only with an id: explicitChildNodes reaches descendants even on an
      // unannotated node, so it would otherwise change the tree.
      explicitChildNodes: widget.screenIdentifier != null,
      child: Scaffold(
        backgroundColor: UiCommonColors.kBlackC,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: UiCommonColors.kTransparent,
          elevation: 0,
          leading: Semantics(
            identifier: widget.closeIdentifier,
            child: _circleIconButton(
              icon: Icons.close,
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: UiCommonColors.kWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  color: UiCommonColors.kWhite.withOpacity(0.75),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          actions: [
            ValueListenableBuilder<MobileScannerState>(
              valueListenable: _controller,
              builder: (context, state, _) {
                final isOn = state.torchState == TorchState.on;
                return _circleIconButton(
                  icon: isOn ? Icons.flash_on : Icons.flash_off,
                  onPressed: () => unawaited(_controller.toggleTorch()),
                );
              },
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
            ),
            IgnorePointer(
              child: CustomPaint(
                painter: _ScannerOverlayPainter(
                  overlayColor: overlayColor,
                  isSquare: widget._isQrOnly,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: UiCommonColors.kBlackC.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(icon, color: UiCommonColors.kWhite),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class _ScannerOverlayPainter extends CustomPainter {
  _ScannerOverlayPainter({
    required this.overlayColor,
    this.isSquare = false,
  });

  final Color overlayColor;
  final bool isSquare;

  // Unified window width across modes — only the height changes, so QR and
  // barcode feel like the same scanner, not two different screens.
  static const double _widthFactor = 0.75;
  static const double _barcodeAspect = 0.55; // height = 0.55 × width for 1D
  static const double _cornerRadius = 18;
  static const double _bracketLength = 28;
  static const double _bracketStroke = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final windowWidth = size.width * _widthFactor;
    final windowHeight = isSquare ? windowWidth : windowWidth * _barcodeAspect;
    final left = (size.width - windowWidth) / 2;
    final top = (size.height - windowHeight) / 2;
    final right = left + windowWidth;
    final bottom = top + windowHeight;

    final windowRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, windowWidth, windowHeight),
      const Radius.circular(_cornerRadius),
    );

    // Dim everything outside the window using evenodd to punch the cutout.
    final overlayPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(windowRect)
      ..fillType = PathFillType.evenOdd;
    canvas.drawPath(overlayPath, Paint()..color = overlayColor);

    // Corner brackets — same style + same arc as the mask, so they trace
    // the cutout exactly. White for guaranteed contrast on dimmed background.
    final bracketPaint = Paint()
      ..color = UiCommonColors.kWhite
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = _bracketStroke;

    const r = _cornerRadius;
    const l = _bracketLength;
    const radius = Radius.circular(r);

    // Each bracket: short edge segment → arc through the rounded corner →
    // short edge segment on the perpendicular side. arcToPoint clockwise:true
    // (default) bulges toward the outer corner, matching the RRect mask.
    final topLeft = Path()
      ..moveTo(left, top + l)
      ..lineTo(left, top + r)
      ..arcToPoint(Offset(left + r, top), radius: radius)
      ..lineTo(left + l, top);

    final topRight = Path()
      ..moveTo(right - l, top)
      ..lineTo(right - r, top)
      ..arcToPoint(Offset(right, top + r), radius: radius)
      ..lineTo(right, top + l);

    final bottomRight = Path()
      ..moveTo(right, bottom - l)
      ..lineTo(right, bottom - r)
      ..arcToPoint(Offset(right - r, bottom), radius: radius)
      ..lineTo(right - l, bottom);

    final bottomLeft = Path()
      ..moveTo(left + l, bottom)
      ..lineTo(left + r, bottom)
      ..arcToPoint(Offset(left, bottom - r), radius: radius)
      ..lineTo(left, bottom - l);

    for (final path in [topLeft, topRight, bottomRight, bottomLeft]) {
      canvas.drawPath(path, bracketPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ScannerOverlayPainter oldDelegate) {
    return oldDelegate.overlayColor != overlayColor ||
        oldDelegate.isSquare != isSquare;
  }
}
