import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';

class AppErrorPage extends StatelessWidget {
  const AppErrorPage(
    this.e, {
    this.onRetryTap,
    this.hasSettingButton = false,
  });

  final dynamic e;
  final VoidCallback? onRetryTap;
  final bool hasSettingButton;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: BaseScaffold(
          appBody: Column(
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
    if (e is LocationException) {
      return LocationErrorWidget(
        hasSettingButton: hasSettingButton,
        error: e.toString(),
        onRefreshTap: onRetryTap ?? () {},
        pop: false,
      );
    } else {
      return Center(
        child: UnknownErrorWidget(
          onRetryTap ?? () {},
          pop: false,
          message: e?.toString() ?? Constants.errorSomethingWentWrong,
        ),
      );
    }
  }
}
