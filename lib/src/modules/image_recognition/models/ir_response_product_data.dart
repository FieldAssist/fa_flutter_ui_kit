import 'package:freezed_annotation/freezed_annotation.dart';

part 'ir_response_product_data.freezed.dart';
part 'ir_response_product_data.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class IrResponseProductData with _$IrResponseProductData {
  factory IrResponseProductData({
    @JsonKey(name: "product") @Default("") String product,
    @JsonKey(name: "label") @Default("") String label,
    @JsonKey(name: "count") @Default(0) int count,
    @JsonKey(name: "id") @Default("") String id,
  }) = _IrResponseProductData;
  factory IrResponseProductData.fromJson(Map<String, dynamic> json) =>
      _$IrResponseProductDataFromJson(json);
}
