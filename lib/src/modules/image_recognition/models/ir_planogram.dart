import 'package:freezed_annotation/freezed_annotation.dart';

part 'ir_planogram.freezed.dart';
part 'ir_planogram.g.dart';

@freezed
abstract class IrPlanogram with _$IrPlanogram {
  factory IrPlanogram({
    @JsonKey(name: "PlanogramRackOutputImage") String? planogramRackOutputImage,
    @JsonKey(name: "PlanogramSkuOutputImage") String? planogramSkuOutputImage,
    @JsonKey(name: "PlanogramIssues") List<String>? planogramIssues,
    @JsonKey(name: "Compliance_Percentange") double? compliancePercentage,
    @JsonKey(name: "Compliance_Status") String? complianceStatus,
  }) = _IrPlanogram;

  factory IrPlanogram.fromJson(Map<String, dynamic> json) =>
      _$IrPlanogramFromJson(json);
}
