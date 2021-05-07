import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/error/location_error.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/error/unknown_error.dart';
import 'package:flutter/material.dart';

class AppErrorPage extends StatelessWidget {
  const AppErrorPage(
    this.e, {
    this.onRetryTap,
  });

  final dynamic e;
  final VoidCallback? onRetryTap;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              getWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getWidget() {
    //TODO(TusharFA): Import LocationException once LocationImp moved to core.
    // if (e is LocationException) {
    if (e is Exception) {
      return LocationErrorWidget(
        error: e.toString(),
        onRefreshTap: () => onRetryTap,
        pop: false,
      );
    } else {
      return UnknownErrorWidget(
        onRetryTap!,
        pop: false,
        message: e?.toString() ?? Constants.errorSomethingWentWrong,
      );
    }
  }
}
