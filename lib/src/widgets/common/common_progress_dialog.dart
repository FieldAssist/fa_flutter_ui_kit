import 'package:cool_flare/flare_actor.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';

Widget _defaultProgressWidget = Image.asset(Images.doubleRingLoader);

class CommonProgressDialog {
  static ProgressDialog? _dialog;
  static BuildContext? _currentContext;

  static Future<bool> show(
    BuildContext context, {
    String message = 'Please Wait !',
    bool isDismissible = false,
    Widget? customLoader,
  }) async {
    await hide(); // Ensure any existing dialog is properly hidden

    _currentContext = context;
    _dialog = ProgressDialog(context, isDismissible: isDismissible)
      ..style(
        message: message,
        progressWidget: customLoader ?? _defaultProgressWidget,
        padding: const EdgeInsets.symmetric(vertical: 8),
      );
    return _dialog!.show();
  }

  static void update({
    required String message,
    required Widget progressWidget,
  }) {
    if (_isDialogValid()) {
      _dialog!.update(
        message: message,
        progressWidget: progressWidget,
      );
    }
  }

  static Future<void> doneAndHide({String message = 'Success'}) async {
    if (!_isDialogValid()) return;
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

  static Future<bool> hide() async {
    if (_dialog == null) return true;

    try {
      final result = await _dialog!.hide();
      return result;
    } catch (e) {
      return true;
    } finally {
      _dialog = null;
      _currentContext = null;
    }
  }

  static bool _isDialogValid() {
    return _dialog != null &&
        _currentContext != null &&
        _currentContext!.mounted;
  }
}
