import 'package:fa_flutter_ui_kit/src/core/index.dart';
import 'package:fa_flutter_ui_kit/src/data/models/auth_response.dart/auth_response.dart';

abstract class LoginRepository {
  Future<VoidResult> getActivationCodeFromPhone(String phone);

  Future<Result<AuthResponse>> verifyActivationCode(String code);
}
