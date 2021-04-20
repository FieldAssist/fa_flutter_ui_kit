import 'dart:convert';
import 'package:fa_flutter_ui_kit/src/core/index.dart';
import 'package:fa_flutter_ui_kit/src/core/system_info/system_info.dart';
import 'package:fa_flutter_ui_kit/src/data/contract/login_repository.dart';
import 'package:fa_flutter_ui_kit/src/data/models/auth_response.dart/auth_response.dart';
import 'package:fa_flutter_ui_kit/src/data/remote/api_endpoints.dart';
import 'package:fa_flutter_ui_kit/src/data/remote/api_helper.dart';
import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';
import 'package:meta/meta.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({
    @required this.apiHelper,
    @required this.systemInfo,
    @required this.apiEndPoints,
  });

  final ApiHelper apiHelper;
  final ApiEndPoints apiEndPoints;
  final SystemInfo systemInfo;

  @override
  Future<VoidResult> getActivationCodeFromPhone(String phone) async {
    try {
      final res = await apiHelper.get(
        url: apiEndPoints.getActivationCodeFromPhone(phone),
      );
      if (res.statusCode == 200) {
        return VoidResult.success();
      }
      return VoidResult.failure(reason: 'Unable to submit Phone');
    } catch (e, stk) {
      logger.e(e, stk);
      return VoidResult.failure(reason: '$e');
    }
  }

  /// Verify the activation code received
  ///
  /// The sample POST body is as below
  /// {
  ///         "AppVersionName": "MT-8.11.4-DEBUG",
  ///         "AppVersionNumber": 10058,
  ///         "Brand": "motorola",
  ///         "GcmId": "na",
  ///         "Manufacturer": "motorola",
  ///         "Model": "Moto G (5)",
  ///         "OSVersion": "8.1.0",
  ///         "SdkVersion": 27,
  ///         "Serial": "ZY3223FNC6"
  /// }
  /// You can use the below map as well
  /// {
  //   "AppVersionName": systemInfo.version,
  //   "AppVersionNumber": systemInfo.buildNumber,
  //   "Brand": systemInfo.brand,
  //   "GcmId": "NA",
  //   "Manufacturer": systemInfo.manufacturer,
  //   "Model": systemInfo.model,
  //   "OSVersion": systemInfo.os,
  //   "SdkVersion": systemInfo.deviceInfo.sdk,
  //   "Serial": systemInfo.deviceInfo.id,
  // };
  @override
  Future<Result<AuthResponse>> verifyActivationCode(String code) async {
    try {
      final body = systemInfo.map;
      final res = await apiHelper.post(
        endpoint: apiEndPoints.verifyActivationCode(code),
        body: json.encode(body),
      );

      final data = AuthResponse.fromJson(res.data);
      return Result.success(data: data);
    } catch (e, stk) {
      logger.e(e, stk);
      return Result.failure(reason: '$e');
    }
  }
}
