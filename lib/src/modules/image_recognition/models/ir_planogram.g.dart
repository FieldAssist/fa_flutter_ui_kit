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
              $checkedConvert('PlanogramRackOutputImage', (v) => v as String?),
          planogramSkuOutputImage:
              $checkedConvert('PlanogramSkuOutputImage', (v) => v as String?),
          planogramIssues: $checkedConvert('PlanogramIssues',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          compliancePercentage: $checkedConvert(
              'Compliance_Percentange', (v) => (v as num?)?.toDouble()),
          complianceStatus:
              $checkedConvert('Compliance_Status', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'planogramRackOutputImage': 'PlanogramRackOutputImage',
        'planogramSkuOutputImage': 'PlanogramSkuOutputImage',
        'planogramIssues': 'PlanogramIssues',
        'compliancePercentage': 'Compliance_Percentange',
        'complianceStatus': 'Compliance_Status'
      },
    );

Map<String, dynamic> _$IrPlanogramToJson(_IrPlanogram instance) =>
    <String, dynamic>{
      'PlanogramRackOutputImage': instance.planogramRackOutputImage,
      'PlanogramSkuOutputImage': instance.planogramSkuOutputImage,
      'PlanogramIssues': instance.planogramIssues,
      'Compliance_Percentange': instance.compliancePercentage,
      'Compliance_Status': instance.complianceStatus,
    };
