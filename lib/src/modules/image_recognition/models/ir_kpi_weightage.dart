import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/kpi_enum.dart';

part 'ir_kpi_weightage.freezed.dart';
part 'ir_kpi_weightage.g.dart';

@freezed
abstract class IrKpiWeightage with _$IrKpiWeightage {
  factory IrKpiWeightage({
    @JsonKey(
      name: 'kpiEnum',
      fromJson: irKpiEnumFromJson,
      toJson: irKpiEnumToJson,
    )
    IrKpiEnum? kpiEnum,
    @JsonKey(name: "result") double? result,
    @JsonKey(name: "calResult") double? calResult,
  }) = _IrKpiWeightage;

  factory IrKpiWeightage.fromJson(Map<String, dynamic> json) =>
      _$IrKpiWeightageFromJson(json);
}
