import 'package:fa_flutter_ui_kit/src/utils/map_keys.dart';

class ApiEndPoints {
  final Map<String, dynamic>? apiPaths;
  final String? baseUrl;

  ApiEndPoints({this.baseUrl, this.apiPaths});

  //---------------------------Login--------------------------------//

  String getActivationCodeFromPhone(String phone) =>
      '${apiPaths![MapKeys.getActivationCodeFromPhone]}$phone';

  String verifyActivationCode(String code) =>
      '${apiPaths![MapKeys.verifyActivationCode]}$code';

  static String getIrImageResponse(String detectionId) =>
      "IR/getResults?detectionId=$detectionId";

  static String uploadImageIr() => "IR/uploadImage";

  static String uploadOcrImageIr({String? attendanceId}) =>
      "IR/upload-ocr-image?attendanceId=$attendanceId";

  static String saveGatePass(String attendanceId, String guid) =>
      "IR/update-ocr-data?attendanceId=$attendanceId&guid=$guid";

  static String getIrMaster() => "IR/getMaster";

  static String getOcrDataByAttendanceGuid(
    String attendanceGuid,
    String guid,
  ) =>
      "IR/getOcrDataForPreviousAttendance?attendanceGuid=$attendanceGuid&guid=$guid";

  static String getAssetAuditDataById(String id) =>
      "LastTenOutletVisits/getAssetAuditData?visitId=$id";

  static String getComplianceScoreData(
    String? sessionId,
    String? attendanceId,
    String outletId,
  ) =>
      "IR/compliance-score?sessionId=$sessionId&attendanceId=$attendanceId&outletId=$outletId&isLastVist=${sessionId == null && attendanceId == null}";

  static String getIrAssetDetails() => "Asset/getAssetDetails";

  static String getIrOutletAssetDetails(int outletId) =>
      "Asset/getOutletAssetDetails?outletId=$outletId";

  static String getIrResultsForPreviousVisits(
    String? sessionId,
    String? attendanceId,
    String? outletId,
  ) =>
      "IR/irResultsForPreviousAttendance?sessionId=$sessionId&attendanceId=$attendanceId&outletId=$outletId";

  static String generateUploadUrl() => "upload/generateuploadurl";

  static String imageQualityCheck(String imageUrl) =>
      "ImageQuality/check?imageUrl=$imageUrl";

  static String irImageDetect() => "IR/imageDetect";

  static String imageUpload() => 'Image/upload';

  static String imageUploadMultipart(String container) =>
      "Image/uploadmultipartimage?container=$container";

  static String fileUpload() => 'Image/uploadSurveyFile';
}
