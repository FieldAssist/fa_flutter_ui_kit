import 'package:freezed_annotation/freezed_annotation.dart';

part 'ir_outlet_asset_details_model.freezed.dart';
part 'ir_outlet_asset_details_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class IrOutletAssetDetailsModel with _$IrOutletAssetDetailsModel {
  factory IrOutletAssetDetailsModel({
    @JsonKey(name: "EquipmentId") required int equipmentId,
    @JsonKey(name: "EquipmentName") required String equipmentName,
    @JsonKey(name: "Id") @Default(0) int id,
    @JsonKey(name: "AssetDefinitionsId") @Default(0) int assetDefinitionsId,
    @JsonKey(name: "ValueCapacity") @Default(0) int valueCapacity,
    @JsonKey(name: "VolumeCapacity") @Default(0) num volumeCapacity,
    @JsonKey(name: "AssetName") String? assetName,
    @JsonKey(name: "AssetType") String? assetType,
    @JsonKey(name: "AssetReferenceNo") String? assetReferenceNo,
    @JsonKey(name: "AssetState") String? assetState,
    @JsonKey(name: "ImageId") String? imageId,
    @JsonKey(name: "AssetTypeId") int? assetTypeId,
    @JsonKey(name: "beforeAfterStateEnabled")
    @Default(false)
    bool beforeAfterStateEnabled,
  }) = _IrOutletAssetDetailsModel;
  factory IrOutletAssetDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$IrOutletAssetDetailsModelFromJson(json);
}
