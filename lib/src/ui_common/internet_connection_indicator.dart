import 'dart:async';

import 'package:flutter/material.dart';

import 'config/ui_common_colors.dart';
import 'config/ui_common_texts.dart';

/// A thin banner: red while offline, green for 3 seconds once back online.
class InternetConnectionIndicator extends StatefulWidget {
  const InternetConnectionIndicator({
    required this.isConnected,
    required this.onStatusChange,
    super.key,
  });

  final Future<bool> Function() isConnected;

  /// Emits whether the device is connected, on every change.
  final Stream<bool> onStatusChange;

  @override
  State<InternetConnectionIndicator> createState() =>
      _InternetConnectionIndicatorState();
}

class _InternetConnectionIndicatorState
    extends State<InternetConnectionIndicator> {
  StreamSubscription<bool>? _subscription;
  Timer? _hideTimer;

  bool _isVisible = false;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // Check initial status
    _isConnected = await widget.isConnected();

    // Show indicator if initially offline
    if (!_isConnected && mounted) {
      setState(() => _isVisible = true);
    }

    // Listen for changes
    _subscription = widget.onStatusChange.listen(_onStatusChange);
  }

  void _onStatusChange(bool isConnected) {
    final wasConnected = _isConnected;
    _isConnected = isConnected;

    // No change
    if (wasConnected == _isConnected) {
      return;
    }

    _hideTimer?.cancel();

    if (_isConnected) {
      // Came back online - show green for 3 seconds then hide
      setState(() => _isVisible = true);
      _hideTimer = Timer(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() => _isVisible = false);
        }
      });
    } else {
      // Went offline - show red until back online
      setState(() => _isVisible = true);
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isVisible ? 20 : 0,
      alignment: Alignment.center,
      color: _isConnected ? UiCommonColors.kGreen : UiCommonColors.kRed,
      child: _isVisible
          ? Text(
              _isConnected
                  ? UiCommonTexts().kBackOnline
                  : UiCommonTexts().kNoInternetConnectionBanner,
              style: TextStyle(
                color: UiCommonColors.kWhite.withValues(alpha: 0.9),
                fontSize: 12,
              ),
            )
          : null,
    );
  }
}
