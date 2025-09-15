import 'package:freezed_annotation/freezed_annotation.dart';

part 'compliance_score_data.freezed.dart';

part 'compliance_score_data.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ComplianceScoreData with _$ComplianceScoreData {
  factory ComplianceScoreData({
    num? mustSellSkuPercentage,
    num? sosPercentage,
    num? premiumSkuPercentage,
    num? coolerPurityPercentage,
    num? mustSellSkuScore,
    num? sosScore,
    num? premiumSkuScore,
    num? outletScore,
    num? posmScore,
    num? coolerPurityScore,
    num? eoeScore,
    num? sosVisibilityScore,
    @JsonKey(name: "AttendanceGuid") String? attendanceGuid,
    @JsonKey(name: 'AssetLevelScoreData')
    List<AssetLevelScoreData>? assetLevelScoreData,
    @JsonKey(name: 'UserType') int? userType,
    @JsonKey(name: 'OutletId') int? outletId,
  }) = _ComplianceScoreData;

  factory ComplianceScoreData.fromJson(Map<String, dynamic> json) =>
      _$ComplianceScoreDataFromJson(json);
}

@freezed
abstract class AssetLevelScoreData with _$AssetLevelScoreData {
  factory AssetLevelScoreData({
    @JsonKey(name: 'AssetId') int? assetId,
    @JsonKey(name: 'EquipmentId') int? equipmentId,
    @JsonKey(name: 'PlanogramComplianceStatus') int? planogramComplianceStatus,
    @JsonKey(name: 'PlanogramCompliancePercentage')
    double? planogramCompliancePercentage,
    @JsonKey(name: 'AssetScore') double? assetScore,
  }) = _AssetLevelScoreData;

  factory AssetLevelScoreData.fromJson(Map<String, dynamic> json) =>
      _$AssetLevelScoreDataFromJson(json);
}
