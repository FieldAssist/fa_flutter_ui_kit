import 'package:freezed_annotation/freezed_annotation.dart';

part 'ir_planogram.freezed.dart';

part 'ir_planogram.g.dart';

@freezed
abstract class IrPlanogram with _$IrPlanogram {
  factory IrPlanogram({
    @JsonKey(name: "planogramRackOutputImage") String? planogramRackOutputImage,
    @JsonKey(name: "planogramSkuOutputImage") String? planogramSkuOutputImage,
    @JsonKey(name: "planogramIssues") List<String>? planogramIssues,
    @JsonKey(name: "compliancePercentange") double? compliancePercentage,
    @JsonKey(
      name: "complianceStatus",
      toJson: complianceStatusToInt,
      fromJson: complianceStatusFromInt,
    )
    ComplianceStatus? complianceStatus,
  }) = _IrPlanogram;

  factory IrPlanogram.fromJson(Map<String, dynamic> json) =>
      _$IrPlanogramFromJson(json);
}

enum ComplianceStatus { pass, fail }

extension ComplianceStatusExtension on ComplianceStatus {
  String get name {
    switch (this) {
      case ComplianceStatus.pass:
        return "PASS";

      case ComplianceStatus.fail:
        return "FAIL";
    }
  }
}

ComplianceStatus? complianceStatusFromInt(int? val) {
  switch (val) {
    case 1:
      return ComplianceStatus.pass;
    case 2:
      return ComplianceStatus.fail;
    default:
      return null;
  }
}

int? complianceStatusToInt(ComplianceStatus? status) {
  switch (status) {
    case ComplianceStatus.pass:
      return 1;
    case ComplianceStatus.fail:
      return 2;
    default:
      return null;
  }
}
