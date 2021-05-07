import 'package:fa_flutter_api_client/fa_flutter_api_client.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/error/location_error.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/error/server_error.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/error/unknown_error.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/internet_not_available.dart';
import 'package:flutter/material.dart';

class StreamErrorWidget extends StatelessWidget {
  const StreamErrorWidget(
    this.streamError,
    this.onTap,
  );

  final dynamic streamError;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getWidget(),
            /*SizedBox(
              height: 8,
            ),
            SupportErrorWidget(streamError),*/
          ],
        ),
      ),
    );
  }

  Widget getWidget() {
    if (streamError is NoInternetError) {
      return InternetNotAvailable(onTap);
    } else if (streamError is ClientError || streamError is ServerError) {
      return ServerErrorWidget(streamError.toString(), onTap);
      //TODO(TusharFA): Import LocationException once LocationImp moved to core.
      // } else if (streamError is LocationException) {
    } else if (streamError is Exception) {
      return LocationErrorWidget(
          error: streamError.toString(), onRefreshTap: onTap);
    } else {
      return UnknownErrorWidget(
        onTap,
        message: streamError?.toString() ?? Constants.errorSomethingWentWrong,
      );
    }
  }
}
