// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_response_product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrResponseProductData _$IrResponseProductDataFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      '_IrResponseProductData',
      json,
      ($checkedConvert) {
        final val = _IrResponseProductData(
          product: $checkedConvert('product', (v) => v as String? ?? ""),
          label: $checkedConvert('label', (v) => v as String? ?? ""),
          count: $checkedConvert('count', (v) => (v as num?)?.toInt() ?? 0),
          id: $checkedConvert('id', (v) => v as String? ?? ""),
        );
        return val;
      },
    );

Map<String, dynamic> _$IrResponseProductDataToJson(
        _IrResponseProductData instance) =>
    <String, dynamic>{
      'product': instance.product,
      'label': instance.label,
      'count': instance.count,
      'id': instance.id,
    };
