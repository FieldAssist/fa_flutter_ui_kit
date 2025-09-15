// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compliance_score_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComplianceScoreData _$ComplianceScoreDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ComplianceScoreData',
      json,
      ($checkedConvert) {
        final val = _ComplianceScoreData(
          mustSellSkuPercentage:
              $checkedConvert('mustSellSkuPercentage', (v) => v as num?),
          sosPercentage: $checkedConvert('sosPercentage', (v) => v as num?),
          premiumSkuPercentage:
              $checkedConvert('premiumSkuPercentage', (v) => v as num?),
          coolerPurityPercentage:
              $checkedConvert('coolerPurityPercentage', (v) => v as num?),
          mustSellSkuScore:
              $checkedConvert('mustSellSkuScore', (v) => v as num?),
          sosScore: $checkedConvert('sosScore', (v) => v as num?),
          premiumSkuScore: $checkedConvert('premiumSkuScore', (v) => v as num?),
          outletScore: $checkedConvert('outletScore', (v) => v as num?),
          posmScore: $checkedConvert('posmScore', (v) => v as num?),
          coolerPurityScore:
              $checkedConvert('coolerPurityScore', (v) => v as num?),
          eoeScore: $checkedConvert('eoeScore', (v) => v as num?),
          sosVisibilityScore:
              $checkedConvert('sosVisibilityScore', (v) => v as num?),
          attendanceGuid:
              $checkedConvert('AttendanceGuid', (v) => v as String?),
          assetLevelScoreData: $checkedConvert(
              'AssetLevelScoreData',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AssetLevelScoreData.fromJson(e as Map<String, dynamic>))
                  .toList()),
          userType: $checkedConvert('UserType', (v) => (v as num?)?.toInt()),
          outletId: $checkedConvert('OutletId', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'attendanceGuid': 'AttendanceGuid',
        'assetLevelScoreData': 'AssetLevelScoreData',
        'userType': 'UserType',
        'outletId': 'OutletId'
      },
    );

Map<String, dynamic> _$ComplianceScoreDataToJson(
        _ComplianceScoreData instance) =>
    <String, dynamic>{
      'mustSellSkuPercentage': instance.mustSellSkuPercentage,
      'sosPercentage': instance.sosPercentage,
      'premiumSkuPercentage': instance.premiumSkuPercentage,
      'coolerPurityPercentage': instance.coolerPurityPercentage,
      'mustSellSkuScore': instance.mustSellSkuScore,
      'sosScore': instance.sosScore,
      'premiumSkuScore': instance.premiumSkuScore,
      'outletScore': instance.outletScore,
      'posmScore': instance.posmScore,
      'coolerPurityScore': instance.coolerPurityScore,
      'eoeScore': instance.eoeScore,
      'sosVisibilityScore': instance.sosVisibilityScore,
      'AttendanceGuid': instance.attendanceGuid,
      'AssetLevelScoreData':
          instance.assetLevelScoreData?.map((e) => e.toJson()).toList(),
      'UserType': instance.userType,
      'OutletId': instance.outletId,
    };

_AssetLevelScoreData _$AssetLevelScoreDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_AssetLevelScoreData',
      json,
      ($checkedConvert) {
        final val = _AssetLevelScoreData(
          assetId: $checkedConvert('AssetId', (v) => (v as num?)?.toInt()),
          equipmentId:
              $checkedConvert('EquipmentId', (v) => (v as num?)?.toInt()),
          planogramComplianceStatus: $checkedConvert(
              'PlanogramComplianceStatus', (v) => (v as num?)?.toInt()),
          planogramCompliancePercentage: $checkedConvert(
              'PlanogramCompliancePercentage', (v) => (v as num?)?.toDouble()),
          assetScore:
              $checkedConvert('AssetScore', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'assetId': 'AssetId',
        'equipmentId': 'EquipmentId',
        'planogramComplianceStatus': 'PlanogramComplianceStatus',
        'planogramCompliancePercentage': 'PlanogramCompliancePercentage',
        'assetScore': 'AssetScore'
      },
    );

Map<String, dynamic> _$AssetLevelScoreDataToJson(
        _AssetLevelScoreData instance) =>
    <String, dynamic>{
      'AssetId': instance.assetId,
      'EquipmentId': instance.equipmentId,
      'PlanogramComplianceStatus': instance.planogramComplianceStatus,
      'PlanogramCompliancePercentage': instance.planogramCompliancePercentage,
      'AssetScore': instance.assetScore,
    };
