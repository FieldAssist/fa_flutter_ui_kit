import 'dart:async';

import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';
import 'package:flutter/material.dart';

class UnknownErrorWidget extends StatefulWidget {
  const UnknownErrorWidget(
    this.onTap, {
    this.pop = true,
    this.message,
    this.errorImage = Images.superCommander,
    this.errorTitle = 'Something is wrong.',
    this.errorSubtitle = 'Supercommander FA is fixing it',
    this.showErrorImage = true,
    this.showErrorTitle = true,
    this.showErrorSubtitle = true,
    this.padding,
    this.errorTitleStyle,
    this.errorSubtitleStyle,
    this.messageStyle,
  });

  /// May be a plain [VoidCallback] or an async `Future<void> Function()`.
  final FutureOr<void> Function()? onTap;
  final bool pop;
  final String? message;
  final String errorImage;
  final String errorTitle;
  final String errorSubtitle;
  final bool showErrorImage;
  final bool showErrorTitle;
  final bool showErrorSubtitle;
  final EdgeInsetsGeometry? padding;
  final TextStyle? errorTitleStyle, errorSubtitleStyle, messageStyle;

  @override
  State<UnknownErrorWidget> createState() => _UnknownErrorWidgetState();
}

class _UnknownErrorWidgetState extends State<UnknownErrorWidget> {
  bool _isRetrying = false;

  Future<void> _handleTap() async {
    if (_isRetrying) return;
    setState(() => _isRetrying = true);
    try {
      await Future.sync(() => widget.onTap?.call());
    } catch (e, s) {
      logger.e(e, s);
    } finally {
      if (mounted) setState(() => _isRetrying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.showErrorImage) ...[
            Image.asset(
              widget.errorImage,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: 50,
            )
          ],
          if (widget.showErrorTitle) ...[
            Text(
              widget.errorTitle,
              style: widget.errorTitleStyle ??
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            SizedBox(
              height: 20,
            )
          ],
          if (widget.showErrorSubtitle) ...[
            Text(
              widget.errorSubtitle,
              style: widget.errorSubtitleStyle ??
                  TextStyle(
                    fontSize: 15,
                  ),
            ),
            SizedBox(
              height: 100,
            )
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (widget.pop)
                Flexible(
                  child: OutlinedIconButton(
                    endAction: () {
                      Navigator.pop(context);
                    },
                    endIcon: Icon(Icons.keyboard_arrow_left),
                    endText: Text('GO BACK'),
                  ),
                ),
              if (widget.onTap != null)
                Flexible(
                  child: OutlinedIconButton(
                    endAction: _handleTap,
                    endIcon: Icon(
                      Icons.replay,
                      color: Colors.green,
                    ),
                    endText: Text(
                      'RETRY',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (widget.message != null)
            SizedBox(
              height: 30,
            ),
          if (widget.message != null)
            Text(
              widget.message ?? '',
              style: widget.messageStyle ??
                  TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 10,
                  ),
            ),
        ],
      ),
    );
  }
}
