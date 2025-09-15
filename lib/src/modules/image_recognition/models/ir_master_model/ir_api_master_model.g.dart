// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_api_master_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrApiMasterModel _$IrApiMasterModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_IrApiMasterModel',
      json,
      ($checkedConvert) {
        final val = _IrApiMasterModel(
          id: $checkedConvert('Id', (v) => (v as num?)?.toInt() ?? -1),
          ruleName: $checkedConvert('RuleName', (v) => v as String? ?? ""),
          isMandatory:
              $checkedConvert('IsMandatory', (v) => v as bool? ?? false),
          assetList: $checkedConvert(
              'AssetList',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => (e as num).toInt())
                      .toList() ??
                  const []),
          outlets: $checkedConvert(
              'Outlets',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => (e as num).toInt())
                      .toList() ??
                  const []),
          beforeStateEnabled:
              $checkedConvert('BeforeSeenEnabled', (v) => v as bool? ?? false),
          kpiWeightageList: $checkedConvert(
              'KPIWeightageList',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => KPIWeightage.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'ruleName': 'RuleName',
        'isMandatory': 'IsMandatory',
        'assetList': 'AssetList',
        'outlets': 'Outlets',
        'beforeStateEnabled': 'BeforeSeenEnabled',
        'kpiWeightageList': 'KPIWeightageList'
      },
    );

Map<String, dynamic> _$IrApiMasterModelToJson(_IrApiMasterModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'RuleName': instance.ruleName,
      'IsMandatory': instance.isMandatory,
      'AssetList': instance.assetList,
      'Outlets': instance.outlets,
      'BeforeSeenEnabled': instance.beforeStateEnabled,
      'KPIWeightageList':
          instance.kpiWeightageList?.map((e) => e.toJson()).toList(),
    };

_KPIWeightage _$KPIWeightageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_KPIWeightage',
      json,
      ($checkedConvert) {
        final val = _KPIWeightage(
          kpiEnum: $checkedConvert(
              'KPIEnum', (v) => irKpiEnumFromJson((v as num?)?.toInt())),
          weightage:
              $checkedConvert('Weightage', (v) => (v as num?)?.toDouble()),
          target: $checkedConvert('Target', (v) => (v as num?)?.toDouble()),
          planogram: $checkedConvert(
              'Planogram',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Planogram.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'kpiEnum': 'KPIEnum',
        'weightage': 'Weightage',
        'target': 'Target',
        'planogram': 'Planogram'
      },
    );

Map<String, dynamic> _$KPIWeightageToJson(_KPIWeightage instance) =>
    <String, dynamic>{
      'KPIEnum': irKpiEnumToJson(instance.kpiEnum),
      'Weightage': instance.weightage,
      'Target': instance.target,
      'Planogram': instance.planogram?.map((e) => e.toJson()).toList(),
    };

_Planogram _$PlanogramFromJson(Map<String, dynamic> json) => $checkedCreate(
      '_Planogram',
      json,
      ($checkedConvert) {
        final val = _Planogram(
          idealPlanogramImageUrl:
              $checkedConvert('IdealPlanogramImageUrl', (v) => v as String?),
          assetDefinitionIds: $checkedConvert(
              'AssetDefinitionIds',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          compliance:
              $checkedConvert('Compliance', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'idealPlanogramImageUrl': 'IdealPlanogramImageUrl',
        'assetDefinitionIds': 'AssetDefinitionIds',
        'compliance': 'Compliance'
      },
    );

Map<String, dynamic> _$PlanogramToJson(_Planogram instance) =>
    <String, dynamic>{
      'IdealPlanogramImageUrl': instance.idealPlanogramImageUrl,
      'AssetDefinitionIds': instance.assetDefinitionIds,
      'Compliance': instance.compliance,
    };
