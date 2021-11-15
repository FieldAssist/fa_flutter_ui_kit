import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/progress_dialog/progress_dialog.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
// import 'package:progress_dialog/progress_dialog.dart';

Widget _defaultProgressWidget = Image.asset(Images.doubleRingLoader);

class GTProgressDialog {
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
