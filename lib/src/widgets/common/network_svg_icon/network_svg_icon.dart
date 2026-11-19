import 'dart:async';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

import 'network_svg_icon_bloc.dart';

/// The SVG icon at [url]. Shows [placeholder] while it loads, and
/// [errorWidget] (or [placeholder]) when it cannot be drawn. Use it instead of
/// `SvgPicture.network`; [NetworkSvgIconBloc] says why.
class NetworkSvgIcon extends StatefulWidget {
  const NetworkSvgIcon({
    required this.url,
    required this.placeholder,
    required this.fit,
    this.errorWidget,
    this.width,
    this.height,
    this.colorFilter,
    super.key,
  });

  final String url;
  final Widget placeholder;

  /// Shown when the icon cannot be downloaded or drawn; [placeholder] if null.
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BoxFit fit;
  final ColorFilter? colorFilter;

  @override
  State<NetworkSvgIcon> createState() => _NetworkSvgIconState();
}

class _NetworkSvgIconState extends State<NetworkSvgIcon> {
  late NetworkSvgIconBloc _bloc;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(NetworkSvgIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _bloc.dispose();
      _load();
    }
  }

  void _load() {
    _bloc = NetworkSvgIconBloc();
    unawaited(_bloc.load(widget.url));
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      // A new url starts over from its own cached icon, not the old one.
      key: ValueKey(widget.url),
      initialData: _bloc.svgStream.valueOrNull,
      stream: _bloc.svgStream,
      builder: (context, snapshot) {
        // No result yet: still downloading.
        if (!_bloc.svgStream.hasValue) {
          return widget.placeholder;
        }
        final svg = snapshot.data;
        if (svg == null) {
          return widget.errorWidget ?? widget.placeholder;
        }
        return SvgPicture.string(
          svg,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
          colorFilter: widget.colorFilter,
          placeholderBuilder: (_) => widget.placeholder,
        );
      },
    );
  }
}
