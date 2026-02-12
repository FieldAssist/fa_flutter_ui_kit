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
    this.onTap, {
    this.userName,
    this.userErpId = '--',
    this.currentTime = '--',
    this.currentAppVersion = '--',
  });

  final dynamic streamError;
  final VoidCallback? onTap;
  final String? userName;
  final String? userErpId;
  final String? currentTime;
  final String? currentAppVersion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (userName != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Name - $userName',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.greenAccent,
                  ),
                ),
                Text(
                  'ErpId - $userErpId',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.greenAccent,
                  ),
                ),
                Text(
                  'Time - $currentTime',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.greenAccent,
                  ),
                ),
                Text(
                  'Version - $currentAppVersion',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          SizedBox(
            height: 5,
          ),
          getWidget(),
          /*SizedBox(
              height: 8,
            ),
            SupportErrorWidget(streamError),*/
        ],
      ),
    );
  }

  Widget getWidget() {
    if (streamError is UnauthorizedError) {
      return UnknownErrorWidget(
        onTap,
        message: streamError?.toString() ?? Constants.errorSomethingWentWrong,
        errorImage: Images.forbidden,
        showErrorSubtitle: false,
        errorTitle: 'Forbidden!',
      );
    } else if (streamError is NoInternetError) {
      return InternetNotAvailable(onTap);
    } else if (streamError is ClientError || streamError is ServerError) {
      return ServerErrorWidget(streamError.toString(), onTap);
    } else if (streamError is LocationException) {
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
