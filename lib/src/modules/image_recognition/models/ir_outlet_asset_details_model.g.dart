// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_outlet_asset_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrOutletAssetDetailsModel _$IrOutletAssetDetailsModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      '_IrOutletAssetDetailsModel',
      json,
      ($checkedConvert) {
        final val = _IrOutletAssetDetailsModel(
          equipmentId:
              $checkedConvert('EquipmentId', (v) => (v as num).toInt()),
          equipmentName: $checkedConvert('EquipmentName', (v) => v as String),
          id: $checkedConvert('Id', (v) => (v as num?)?.toInt() ?? 0),
          assetDefinitionsId: $checkedConvert(
              'AssetDefinitionsId', (v) => (v as num?)?.toInt() ?? 0),
          valueCapacity: $checkedConvert(
              'ValueCapacity', (v) => (v as num?)?.toInt() ?? 0),
          volumeCapacity:
              $checkedConvert('VolumeCapacity', (v) => v as num? ?? 0),
          assetName: $checkedConvert('AssetName', (v) => v as String?),
          assetType: $checkedConvert('AssetType', (v) => v as String?),
          assetReferenceNo:
              $checkedConvert('AssetReferenceNo', (v) => v as String?),
          assetState: $checkedConvert('AssetState', (v) => v as String?),
          imageId: $checkedConvert('ImageId', (v) => v as String?),
          assetTypeId:
              $checkedConvert('AssetTypeId', (v) => (v as num?)?.toInt()),
          beforeAfterStateEnabled: $checkedConvert(
              'beforeAfterStateEnabled', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {
        'equipmentId': 'EquipmentId',
        'equipmentName': 'EquipmentName',
        'id': 'Id',
        'assetDefinitionsId': 'AssetDefinitionsId',
        'valueCapacity': 'ValueCapacity',
        'volumeCapacity': 'VolumeCapacity',
        'assetName': 'AssetName',
        'assetType': 'AssetType',
        'assetReferenceNo': 'AssetReferenceNo',
        'assetState': 'AssetState',
        'imageId': 'ImageId',
        'assetTypeId': 'AssetTypeId'
      },
    );

Map<String, dynamic> _$IrOutletAssetDetailsModelToJson(
        _IrOutletAssetDetailsModel instance) =>
    <String, dynamic>{
      'EquipmentId': instance.equipmentId,
      'EquipmentName': instance.equipmentName,
      'Id': instance.id,
      'AssetDefinitionsId': instance.assetDefinitionsId,
      'ValueCapacity': instance.valueCapacity,
      'VolumeCapacity': instance.volumeCapacity,
      'AssetName': instance.assetName,
      'AssetType': instance.assetType,
      'AssetReferenceNo': instance.assetReferenceNo,
      'AssetState': instance.assetState,
      'ImageId': instance.imageId,
      'AssetTypeId': instance.assetTypeId,
      'beforeAfterStateEnabled': instance.beforeAfterStateEnabled,
    };
