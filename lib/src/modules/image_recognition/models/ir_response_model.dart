import 'package:freezed_annotation/freezed_annotation.dart';
import '../enum/kpi_enum.dart';
import 'ir_response_product_data.dart';
import 'ir_kpi_weightage.dart';
import 'ir_planogram.dart';

part 'ir_response_model.freezed.dart';

part 'ir_response_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class IrResponseModel with _$IrResponseModel {
  factory IrResponseModel({
    @JsonKey(name: "ImageURL") @Default("") String imageURL,
    @JsonKey(name: "BrandSkuCount") @Default(0) int brandSkuCount,
    @JsonKey(name: "TotalObjectCount") @Default(0) int totalObjectCount,
    @JsonKey(name: "ShelfShare") @Default(0) int shelfShare,
    @JsonKey(name: "ShelfSharePercent") @Default(0) double shelfSharePercent,
    @JsonKey(name: "AssetScore") @Default(0) double assetScore,
    @JsonKey(name: "Data") @Default([]) List<IrResponseProductData> data,
    @JsonKey(name: "Products")
    @Default([])
    List<IrResponseProductData> products,
    @JsonKey(name: "KPIWeightage")
    @Default([])
    List<IrKpiWeightage> kpiWeightage,
    @JsonKey(name: "Planogram") IrPlanogram? planogram,
    @JsonKey(name: "AssetName") String? assetName,
    @JsonKey(name: "EquipmentName") String? equipmentName,
  }) = _IrResponseModel;

  factory IrResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IrResponseModelFromJson(json);
}
