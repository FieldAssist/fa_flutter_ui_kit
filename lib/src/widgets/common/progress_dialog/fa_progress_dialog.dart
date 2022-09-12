import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/constants/flares.dart';
import 'package:fa_flutter_ui_kit/src/constants/images.dart';
import 'package:flutter/material.dart';

import 'progress_dialog.dart';

Widget _defaultProgressWidget = Image.asset(Images.doubleRingLoader);

class FAProgressDialog {
  static ProgressDialog? _dialog;

  static Future<bool> show(
    BuildContext context, {
    String message = 'Please Wait !',
    bool isDismissible = false,
  }) {
    _dialog ??= ProgressDialog(context, isDismissible: isDismissible)
      ..style(
        message: message,
        progressWidget: _defaultProgressWidget,
        padding: const EdgeInsets.symmetric(vertical: 8),
      );
    return _dialog!.show();
  }

  static void update(
          {required String message, required Widget progressWidget}) =>
      _dialog?.update(
        message: message,
        progressWidget: progressWidget,
      );

  static Future<void> doneAndHide({String message = 'Success'}) async {
    update(
      message: message,
      progressWidget: FlareActor(
        Flares.SUCCESS_CHECK,
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: 'success',
      ),
    );
    await Future.delayed(const Duration(milliseconds: 1500));
    await hide();
  }

  static Future<bool> hide() => _dialog!.hide()..then((_) => _dialog = null);
}
