// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_assets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrAssetsModel _$IrAssetsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_IrAssetsModel',
      json,
      ($checkedConvert) {
        final val = _IrAssetsModel(
          id: $checkedConvert('Id', (v) => (v as num?)?.toInt() ?? 0),
          companyId:
              $checkedConvert('CompanyId', (v) => (v as num?)?.toInt() ?? 0),
          isActive: $checkedConvert('IsActive', (v) => v as bool? ?? true),
          name: $checkedConvert('Name', (v) => v as String? ?? ""),
          assetType: $checkedConvert('AssetType', (v) => v as String? ?? ""),
          valueCapacity: $checkedConvert(
              'ValueCapacity', (v) => (v as num?)?.toInt() ?? 0),
          volumeCapacity:
              $checkedConvert('VolumeCapacity', (v) => v as num? ?? 0),
          shortName: $checkedConvert('ShortName', (v) => v as String?),
          validationRegex:
              $checkedConvert('ValidationRegex', (v) => v as String?),
          entityType:
              $checkedConvert('EntityType', (v) => (v as num?)?.toInt()),
          entityIds: $checkedConvert('EntityIds', (v) => v as String?),
          isIRAsset: $checkedConvert('IsIRAsset', (v) => v as bool? ?? true),
          isAssetRefNoScannable: $checkedConvert(
              'IsAssetRefNoScannable', (v) => v as bool? ?? false),
          assetTypeId:
              $checkedConvert('AssetTypeId', (v) => (v as num?)?.toInt()),
          isOutletAsset:
              $checkedConvert('IsOutletAsset', (v) => v as bool? ?? false),
          beforeAfterStateEnabled: $checkedConvert(
              'app_specific_beforeStateEnabledForAsset', (v) => v as bool?),
          instanceNumber: $checkedConvert(
              'app_specific_instanceNumber', (v) => (v as num?)?.toInt() ?? 1),
          mappedEquipments: $checkedConvert(
              'MappedEquipments',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IrOutletAssetDetailsModel.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'companyId': 'CompanyId',
        'isActive': 'IsActive',
        'name': 'Name',
        'assetType': 'AssetType',
        'valueCapacity': 'ValueCapacity',
        'volumeCapacity': 'VolumeCapacity',
        'shortName': 'ShortName',
        'validationRegex': 'ValidationRegex',
        'entityType': 'EntityType',
        'entityIds': 'EntityIds',
        'isIRAsset': 'IsIRAsset',
        'isAssetRefNoScannable': 'IsAssetRefNoScannable',
        'assetTypeId': 'AssetTypeId',
        'isOutletAsset': 'IsOutletAsset',
        'beforeAfterStateEnabled': 'app_specific_beforeStateEnabledForAsset',
        'instanceNumber': 'app_specific_instanceNumber',
        'mappedEquipments': 'MappedEquipments'
      },
    );

Map<String, dynamic> _$IrAssetsModelToJson(_IrAssetsModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'CompanyId': instance.companyId,
      'IsActive': instance.isActive,
      'Name': instance.name,
      'AssetType': instance.assetType,
      'ValueCapacity': instance.valueCapacity,
      'VolumeCapacity': instance.volumeCapacity,
      'ShortName': instance.shortName,
      'ValidationRegex': instance.validationRegex,
      'EntityType': instance.entityType,
      'EntityIds': instance.entityIds,
      'IsIRAsset': instance.isIRAsset,
      'IsAssetRefNoScannable': instance.isAssetRefNoScannable,
      'AssetTypeId': instance.assetTypeId,
      'IsOutletAsset': instance.isOutletAsset,
      'app_specific_beforeStateEnabledForAsset':
          instance.beforeAfterStateEnabled,
      'app_specific_instanceNumber': instance.instanceNumber,
      'MappedEquipments':
          instance.mappedEquipments?.map((e) => e.toJson()).toList(),
    };
