import 'package:fa_flutter_core/fa_flutter_core.dart';

import '../../enum/kpi_enum.dart';

part 'ir_api_master_model.freezed.dart';
part 'ir_api_master_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class IrApiMasterModel with _$IrApiMasterModel {
  factory IrApiMasterModel({
    @JsonKey(name: 'Id') @Default(-1) int id,
    @JsonKey(name: 'RuleName') @Default("") String ruleName,
    @JsonKey(name: 'IsMandatory') @Default(false) bool isMandatory,
    @JsonKey(name: 'AssetList') @Default([]) List<int> assetList,
    @JsonKey(name: 'Outlets') @Default([]) List<int> outlets,
    @JsonKey(name: 'BeforeSeenEnabled') @Default(false) bool beforeStateEnabled,
    @JsonKey(name: 'KPIWeightageList') List<KPIWeightage>? kpiWeightageList,
  }) = _IrApiMasterModel;

  factory IrApiMasterModel.fromJson(Map<String, dynamic> json) =>
      _$IrApiMasterModelFromJson(json);
}

@Freezed()
abstract class KPIWeightage with _$KPIWeightage {
  factory KPIWeightage({
    @JsonKey(
      name: 'KPIEnum',
      fromJson: irKpiEnumFromJson,
      toJson: irKpiEnumToJson,
    )
    IrKpiEnum? kpiEnum,
    @JsonKey(name: 'Weightage') double? weightage,
    @JsonKey(name: 'Target') double? target,
    @JsonKey(name: 'Planogram') List<Planogram>? planogram,
  }) = _KPIWeightage;

  factory KPIWeightage.fromJson(Map<String, dynamic> json) =>
      _$KPIWeightageFromJson(json);
}

@Freezed()
abstract class Planogram with _$Planogram {
  factory Planogram({
    @JsonKey(name: 'IdealPlanogramImageUrl') String? idealPlanogramImageUrl,
    @JsonKey(name: 'AssetDefinitionIds') List<int>? assetDefinitionIds,
    @JsonKey(name: 'Compliance') double? compliance,
  }) = _Planogram;

  factory Planogram.fromJson(Map<String, dynamic> json) =>
      _$PlanogramFromJson(json);
}
