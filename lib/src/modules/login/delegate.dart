import 'package:fa_flutter_ui_kit/src/config/config.dart';
import 'package:fa_flutter_ui_kit/src/core/index.dart';
import 'package:fa_flutter_ui_kit/src/data/models/auth_response.dart/auth_response.dart';

class LoginDelegate {
  Future<Result<AuthResponse>> verifyActivationCode(String code) async {
    final result =
        await AppConfig.instance.loginRepositoryImpl.verifyActivationCode(code);

    return result.when(
      success: (authRes) {
        AppConfig.instance.userRepositoryImpl
          ..userName = authRes.employee.name
          ..companyId = authRes.employee.companyId
          ..companyName = authRes.employee.companyName
          ..authToken = authRes.employee.authToken
          ..isUserLoggedIn = true;

        return Result.success(data: authRes);
      },
      failure: (error) {
        return Result.failure(reason: error);
      },
    );
  }

  Future<VoidResult> getActivationCodeFromPhone(String phone) async {
    final result = await AppConfig.instance.loginRepositoryImpl
        .getActivationCodeFromPhone(phone);
    return result.when(
      success: () {
        return VoidResult.success();
      },
      failure: (e) {
        return VoidResult.failure(reason: e);
      },
    );
  }
}
