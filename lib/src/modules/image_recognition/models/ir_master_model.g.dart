// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_master_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrMasterModel _$IrMasterModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_IrMasterModel',
      json,
      ($checkedConvert) {
        final val = _IrMasterModel(
          uniqueId: $checkedConvert('UniqueId', (v) => v as String? ?? ""),
          assetName: $checkedConvert('AssetName', (v) => v as String? ?? ""),
          assetId: $checkedConvert('AssetId', (v) => (v as num?)?.toInt() ?? 0),
          equipmentId:
              $checkedConvert('EquipmentId', (v) => (v as num?)?.toInt()),
          outletId:
              $checkedConvert('OutletId', (v) => (v as num?)?.toInt() ?? 0),
          routeId: $checkedConvert('RouteId', (v) => (v as num?)?.toInt() ?? 0),
          beatId: $checkedConvert('BeatId', (v) => (v as num?)?.toInt() ?? 0),
          fileName: $checkedConvert('FileName', (v) => v as String? ?? ""),
          detectionId:
              $checkedConvert('DetectionId', (v) => v as String? ?? ""),
          resultPreviewed:
              $checkedConvert('ResultPreviewed', (v) => v as bool? ?? false),
          syncStatus: $checkedConvert(
              'SyncStatus',
              (v) => v == null
                  ? TaskStatus.draft
                  : taskStatusfromJson(v as String)),
          syncRetryCount: $checkedConvert(
              'SyncRetryCount', (v) => (v as num?)?.toInt() ?? 0),
          internetAvailable:
              $checkedConvert('InternetAvailable', (v) => v as bool? ?? false),
          imageIndex:
              $checkedConvert('ImageIndex', (v) => (v as num?)?.toInt() ?? 0),
          localFilePath:
              $checkedConvert('LocalFilePath', (v) => v as String? ?? ""),
          irRequestModel: $checkedConvert(
              'IrRequestModel',
              (v) => v == null
                  ? null
                  : IrRequestModel.fromJson(v as Map<String, dynamic>)),
          irResponseModel: $checkedConvert(
              'IrResponseModel',
              (v) => v == null
                  ? null
                  : IrResponseModel.fromJson(v as Map<String, dynamic>)),
          uploadImageFailedReason: $checkedConvert(
              'UploadImageFailedReason', (v) => v as String? ?? ""),
          imageUploadState: $checkedConvert(
              'ImageUploadState',
              (v) => v == null
                  ? IrImageUploadStateEnum.singleImage
                  : irImageUploadStateFromInt((v as num).toInt())),
          instanceNumber: $checkedConvert(
              'InstanceNumber', (v) => (v as num?)?.toInt() ?? 1),
          isForPlanogram:
              $checkedConvert('isForPlanogram', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {
        'uniqueId': 'UniqueId',
        'assetName': 'AssetName',
        'assetId': 'AssetId',
        'equipmentId': 'EquipmentId',
        'outletId': 'OutletId',
        'routeId': 'RouteId',
        'beatId': 'BeatId',
        'fileName': 'FileName',
        'detectionId': 'DetectionId',
        'resultPreviewed': 'ResultPreviewed',
        'syncStatus': 'SyncStatus',
        'syncRetryCount': 'SyncRetryCount',
        'internetAvailable': 'InternetAvailable',
        'imageIndex': 'ImageIndex',
        'localFilePath': 'LocalFilePath',
        'irRequestModel': 'IrRequestModel',
        'irResponseModel': 'IrResponseModel',
        'uploadImageFailedReason': 'UploadImageFailedReason',
        'imageUploadState': 'ImageUploadState',
        'instanceNumber': 'InstanceNumber'
      },
    );

Map<String, dynamic> _$IrMasterModelToJson(_IrMasterModel instance) =>
    <String, dynamic>{
      'UniqueId': instance.uniqueId,
      'AssetName': instance.assetName,
      'AssetId': instance.assetId,
      'EquipmentId': instance.equipmentId,
      'OutletId': instance.outletId,
      'RouteId': instance.routeId,
      'BeatId': instance.beatId,
      'FileName': instance.fileName,
      'DetectionId': instance.detectionId,
      'ResultPreviewed': instance.resultPreviewed,
      'SyncStatus': taskStatusToJson(instance.syncStatus),
      'SyncRetryCount': instance.syncRetryCount,
      'InternetAvailable': instance.internetAvailable,
      'ImageIndex': instance.imageIndex,
      'LocalFilePath': instance.localFilePath,
      'IrRequestModel': instance.irRequestModel?.toJson(),
      'IrResponseModel': instance.irResponseModel?.toJson(),
      'UploadImageFailedReason': instance.uploadImageFailedReason,
      'ImageUploadState': irImageUploadStateToInt(instance.imageUploadState),
      'InstanceNumber': instance.instanceNumber,
      'isForPlanogram': instance.isForPlanogram,
    };
