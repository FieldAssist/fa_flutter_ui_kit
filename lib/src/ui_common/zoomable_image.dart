import 'package:flutter/material.dart';

/// Wraps an image [child] in an [InteractiveViewer] so the full image stays
/// visible (the [child] should use `BoxFit.contain`) while letting the user
/// pinch-zoom and pan/swipe around it. Overlays explicit zoom in / zoom out
/// buttons for users who prefer tapping over pinching.
class ZoomableImage extends StatefulWidget {
  const ZoomableImage({
    required this.child,
    required this.iconColor,
    this.minScale = 1.0,
    this.maxScale = 4.0,
    this.onZoomChanged,
    super.key,
  });

  final Widget child;

  /// Colour of the zoom buttons' icons.
  final Color iconColor;

  final double minScale;
  final double maxScale;

  /// Fires whenever the image transitions between un-zoomed (1×) and zoomed.
  /// Hosts inside a [PageView] / scroll view use this to lock their own
  /// gestures so panning a zoomed image doesn't change pages.
  final ValueChanged<bool>? onZoomChanged;

  @override
  State<ZoomableImage> createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> {
  static const double _zoomStep = 1.5;

  final TransformationController _controller = TransformationController();
  bool _isZoomed = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTransformChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTransformChanged);
    _controller.dispose();
    super.dispose();
  }

  double get _currentScale => _controller.value.getMaxScaleOnAxis();

  void _onTransformChanged() {
    final zoomed = _currentScale > 1.01;
    if (zoomed != _isZoomed) {
      _isZoomed = zoomed;
      widget.onZoomChanged?.call(zoomed);
    }
  }

  void _zoomBy(double factor) {
    final target =
        (_currentScale * factor).clamp(widget.minScale, widget.maxScale);
    // ignore: deprecated_member_use
    _controller.value = Matrix4.identity()..scale(target);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: InteractiveViewer(
            transformationController: _controller,
            minScale: widget.minScale,
            maxScale: widget.maxScale,
            child: widget.child,
          ),
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ZoomButton(
                icon: Icons.add_rounded,
                color: widget.iconColor,
                onTap: () => _zoomBy(_zoomStep),
              ),
              const SizedBox(height: 8),
              _ZoomButton(
                icon: Icons.remove_rounded,
                color: widget.iconColor,
                onTap: () => _zoomBy(1 / _zoomStep),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ZoomButton extends StatelessWidget {
  const _ZoomButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 22,
            color: color,
          ),
        ),
      ),
    );
  }
}
