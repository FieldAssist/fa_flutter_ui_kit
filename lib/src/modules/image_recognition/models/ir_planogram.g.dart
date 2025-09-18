// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_planogram.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrPlanogram _$IrPlanogramFromJson(Map<String, dynamic> json) => $checkedCreate(
      '_IrPlanogram',
      json,
      ($checkedConvert) {
        final val = _IrPlanogram(
          planogramRackOutputImage:
              $checkedConvert('planogramRackOutputImage', (v) => v as String?),
          planogramSkuOutputImage:
              $checkedConvert('planogramSkuOutputImage', (v) => v as String?),
          planogramIssues: $checkedConvert('planogramIssues',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          compliancePercentage: $checkedConvert(
              'compliancePercentange', (v) => (v as num?)?.toDouble()),
          complianceStatus: $checkedConvert('complianceStatus',
              (v) => complianceStatusFromInt((v as num?)?.toInt())),
        );
        return val;
      },
      fieldKeyMap: const {'compliancePercentage': 'compliancePercentange'},
    );

Map<String, dynamic> _$IrPlanogramToJson(_IrPlanogram instance) =>
    <String, dynamic>{
      'planogramRackOutputImage': instance.planogramRackOutputImage,
      'planogramSkuOutputImage': instance.planogramSkuOutputImage,
      'planogramIssues': instance.planogramIssues,
      'compliancePercentange': instance.compliancePercentage,
      'complianceStatus': complianceStatusToInt(instance.complianceStatus),
    };
