import 'package:freezed_annotation/freezed_annotation.dart';

part 'ir_response_product_data.freezed.dart';
part 'ir_response_product_data.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class IrResponseProductData with _$IrResponseProductData {
  factory IrResponseProductData({
    @JsonKey(name: "Product") @Default("") String product,
    @JsonKey(name: "Label") @Default("") String label,
    @JsonKey(name: "Count") @Default(0) int count,
    @JsonKey(name: "Id") @Default("") String id,
  }) = _IrResponseProductData;
  factory IrResponseProductData.fromJson(Map<String, dynamic> json) =>
      _$IrResponseProductDataFromJson(json);
}
