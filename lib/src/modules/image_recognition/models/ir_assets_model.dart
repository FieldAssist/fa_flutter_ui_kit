import 'package:freezed_annotation/freezed_annotation.dart';

import 'ir_outlet_asset_details_model.dart';

part 'ir_assets_model.freezed.dart';
part 'ir_assets_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class IrAssetsModel with _$IrAssetsModel {
  factory IrAssetsModel({
    @JsonKey(name: "Id") @Default(0) int id,
    @JsonKey(name: "CompanyId") @Default(0) int companyId,
    @JsonKey(name: "IsActive") @Default(true) bool isActive,
    @JsonKey(name: "Name") @Default("") String name,
    @JsonKey(name: "AssetType") @Default("") String assetType,
    @JsonKey(name: "ValueCapacity") @Default(0) int valueCapacity,
    @JsonKey(name: "VolumeCapacity") @Default(0) num volumeCapacity,
    @JsonKey(name: "ShortName") String? shortName,
    @JsonKey(name: "ValidationRegex") String? validationRegex,
    @JsonKey(name: "EntityType") int? entityType,
    @JsonKey(name: "EntityIds") String? entityIds,
    @JsonKey(name: "IsIRAsset") @Default(true) bool isIRAsset,
    @JsonKey(name: "IsAssetRefNoScannable")
    @Default(false)
    bool isAssetRefNoScannable,
    @JsonKey(name: "AssetTypeId") int? assetTypeId,
    @JsonKey(name: "IsOutletAsset") @Default(false) bool isOutletAsset,
    @JsonKey(name: "app_specific_beforeStateEnabledForAsset")
    bool? beforeAfterStateEnabled,
    @JsonKey(name: "app_specific_instanceNumber")
    @Default(1)
    int instanceNumber,
    @JsonKey(name: "MappedEquipments")
    List<IrOutletAssetDetailsModel>? mappedEquipments,
  }) = _IrAssetsModel;

  factory IrAssetsModel.fromJson(Map<String, dynamic> json) =>
      _$IrAssetsModelFromJson(json);
}
