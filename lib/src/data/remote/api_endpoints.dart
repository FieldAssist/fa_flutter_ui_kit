import 'package:fa_flutter_ui_kit/src/utils/map_keys.dart';

class ApiEndPoints {
  final Map<String, dynamic> apiPaths;
  final String baseUrl;
  ApiEndPoints({this.baseUrl, this.apiPaths});

  //---------------------------Login--------------------------------//

  String getActivationCodeFromPhone(String phone) =>
      '${apiPaths[MapKeys.getActivationCodeFromPhone]}$phone';

  String verifyActivationCode(String code) =>
      '${apiPaths[MapKeys.verifyActivationCode]}$code';
}
