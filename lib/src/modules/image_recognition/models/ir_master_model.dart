import 'package:fa_flutter_ui_kit/src/modules/image_recognition/models/task_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/image_upload_state_enum.dart';
import 'ir_request_model.dart';
import 'ir_response_model.dart';

part 'ir_master_model.freezed.dart';
part 'ir_master_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class IrMasterModel with _$IrMasterModel {
  factory IrMasterModel({
    @JsonKey(name: "UniqueId") @Default("") String uniqueId,
    @JsonKey(name: "AssetName") @Default("") String assetName,
    @JsonKey(name: "AssetId") @Default(0) int assetId,
    @JsonKey(name: "EquipmentId") int? equipmentId,
    @JsonKey(name: "OutletId") @Default(0) int outletId,
    @JsonKey(name: "RouteId") @Default(0) int routeId,
    @JsonKey(name: "BeatId") @Default(0) int beatId,
    @JsonKey(name: "FileName") @Default("") String fileName,
    @JsonKey(name: "DetectionId") @Default("") String detectionId,
    @JsonKey(name: "ResultPreviewed") @Default(false) bool resultPreviewed,
    @JsonKey(
      name: 'SyncStatus',
      fromJson: taskStatusfromJson,
      toJson: taskStatusToJson,
    )
    @Default(TaskStatus.draft)
    TaskStatus syncStatus,
    @JsonKey(name: "SyncRetryCount") @Default(0) int syncRetryCount,
    @JsonKey(name: "InternetAvailable") @Default(false) bool internetAvailable,
    @JsonKey(name: "ImageIndex") @Default(0) int imageIndex,
    @JsonKey(name: "LocalFilePath") @Default("") String localFilePath,
    @JsonKey(name: "IrRequestModel") IrRequestModel? irRequestModel,
    @JsonKey(name: "IrResponseModel") IrResponseModel? irResponseModel,
    @JsonKey(name: "UploadImageFailedReason")
    @Default("")
    String uploadImageFailedReason,
    @JsonKey(
      name: 'ImageUploadState',
      fromJson: irImageUploadStateFromInt,
      toJson: irImageUploadStateToInt,
    )
    @Default(IrImageUploadStateEnum.singleImage)
    IrImageUploadStateEnum imageUploadState,
    @JsonKey(name: "InstanceNumber") @Default(1) int instanceNumber,
    @Default(false) bool isForPlanogram,
  }) = _IrMasterModel;

  factory IrMasterModel.fromJson(Map<String, dynamic> json) =>
      _$IrMasterModelFromJson(json);
}
