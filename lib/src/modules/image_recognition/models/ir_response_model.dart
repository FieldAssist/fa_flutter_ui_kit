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
    @JsonKey(name: "imageURL") @Default("") String imageURL,
    @JsonKey(name: "brandSkuCount") @Default(0) int brandSkuCount,
    @JsonKey(name: "totalObjectCount") @Default(0) int totalObjectCount,
    @JsonKey(name: "shelfShare") @Default(0) int shelfShare,
    @JsonKey(name: "shelfSharePercent") @Default(0) double shelfSharePercent,
    @JsonKey(name: "assetScore") @Default(0) double assetScore,
    @JsonKey(name: "data") @Default([]) List<IrResponseProductData> data,
    @JsonKey(name: "products")
    @Default([])
    List<IrResponseProductData> products,
    @JsonKey(name: "kpiWeightage")
    @Default([])
    List<IrKpiWeightage> kpiWeightage,
    @JsonKey(name: "planogram") IrPlanogram? planogram,
    @JsonKey(name: "assetName") String? assetName,
    @JsonKey(name: "equipmentName") String? equipmentName,
  }) = _IrResponseModel;

  factory IrResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IrResponseModelFromJson(json);
}
