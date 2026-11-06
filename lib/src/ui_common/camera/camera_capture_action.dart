import 'dart:io';

import 'package:flutter/material.dart';

/// Another way to take the picture, offered as a button in the camera's app
/// bar beside the shutter (for example a live AR shelf scanner).
///
/// [capture] runs it and returns the photo's path, or null when the user backs
/// out. The camera hands its lens over while [capture] runs, then treats the
/// photo like a normal shot (scaled, compressed, watermarked) and returns it.
class CameraCaptureAction {
  const CameraCaptureAction({
    required this.label,
    required this.icon,
    required this.capture,
    this.identifier,
  });

  final String label;
  final IconData icon;
  final Future<String?> Function(BuildContext context) capture;

  /// Optional `Semantics(identifier:)` for E2E tests.
  final String? identifier;
}

/// Checks a photo on the preview screen and returns what looks wrong with it,
/// worded for the user: empty when it looks fine, null when the check did not
/// run. Advisory only; the user can still keep the photo.
typedef ImageQualityCheck = Future<List<String>?> Function(File file);

/// The app bar button for a [CameraCaptureAction].
class CameraCaptureActionButton extends StatelessWidget {
  const CameraCaptureActionButton({
    required this.action,
    required this.onPressed,
    super.key,
  });

  final CameraCaptureAction action;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
        identifier: action.identifier,
        child: TextButton.icon(
          onPressed: onPressed,
          icon: Icon(action.icon, size: 20),
          label: Text(action.label, maxLines: 1),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            visualDensity: VisualDensity.compact,
          ),
        ),
      );
}
