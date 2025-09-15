// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_kpi_weightage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrKpiWeightage _$IrKpiWeightageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_IrKpiWeightage',
      json,
      ($checkedConvert) {
        final val = _IrKpiWeightage(
          kpiEnum: $checkedConvert(
              'kpiEnum', (v) => irKpiEnumFromJson((v as num?)?.toInt())),
          result: $checkedConvert('result', (v) => (v as num?)?.toDouble()),
          calResult:
              $checkedConvert('calResult', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$IrKpiWeightageToJson(_IrKpiWeightage instance) =>
    <String, dynamic>{
      'kpiEnum': irKpiEnumToJson(instance.kpiEnum),
      'result': instance.result,
      'calResult': instance.calResult,
    };
