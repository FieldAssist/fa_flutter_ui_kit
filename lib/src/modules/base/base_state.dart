import 'package:fa_flutter_ui_kit/src/constants/constants.dart';
import 'package:flutter/material.dart';

enum SnackBarType { warning, error, success }

extension SnackBarTypeX on SnackBarType? {
  Color? get color => {
        SnackBarType.warning: Colors.orange,
        SnackBarType.error: Colors.red,
        SnackBarType.success: Colors.green,
      }[this!];
}

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void hideSnackBar() => _scaffoldKey.currentState!.removeCurrentSnackBar();

  Future<SnackBarClosedReason> showSnackBar(
    String? message, {
    SnackBarType type = SnackBarType.error,
    String actionLabel = 'DISMISS',
    Duration duration = const Duration(milliseconds: 2000),
    VoidCallback? onActionPressed,
  }) {
    _scaffoldKey.currentState!.removeCurrentSnackBar();

    return _scaffoldKey.currentState!
        .showSnackBar(
          _snackBar(
            message ?? Constants.errorSomethingWentWrong,
            duration: duration,
            actionLabel: actionLabel,
            type: type,
            onActionPressed: onActionPressed,
          ),
        )
        .closed;
  }

  SnackBar _snackBar(
    String message, {
    SnackBarType? type,
    Duration duration = const Duration(milliseconds: 2000),
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) {
    SnackBarAction? action;
    if (actionLabel != null) {
      action = SnackBarAction(
        label: actionLabel,
        onPressed: onActionPressed ?? () {},
      );
    }
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: type.color,
      action: action,
      duration: duration,
      content: Text(
        message,
      ),
    );
  }
}
