import 'package:fa_flutter_core/fa_flutter_core.dart';

part 'upload_meta_data_model.freezed.dart';

part 'upload_meta_data_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class UploadMetaDataModel with _$UploadMetaDataModel {
  factory UploadMetaDataModel({
    @JsonKey(name: 'Container') required int container,
    @JsonKey(name: 'ContentType') required String contentType,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'SessionId') String? sessionId,
    @JsonKey(name: 'AttendanceGuid') String? attendanceGuid,
    @JsonKey(name: 'OutletId') String? outletId,
    @JsonKey(name: 'PromotionalType') String? promotionalType,
    @JsonKey(name: 'EmployeeId') String? employeeId,
  }) = _UploadMetaDataModel;

  factory UploadMetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$UploadMetaDataModelFromJson(json);
}
