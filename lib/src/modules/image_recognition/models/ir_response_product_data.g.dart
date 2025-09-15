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
          product: $checkedConvert('Product', (v) => v as String? ?? ""),
          label: $checkedConvert('Label', (v) => v as String? ?? ""),
          count: $checkedConvert('Count', (v) => (v as num?)?.toInt() ?? 0),
          id: $checkedConvert('Id', (v) => v as String? ?? ""),
        );
        return val;
      },
      fieldKeyMap: const {
        'product': 'Product',
        'label': 'Label',
        'count': 'Count',
        'id': 'Id'
      },
    );

Map<String, dynamic> _$IrResponseProductDataToJson(
        _IrResponseProductData instance) =>
    <String, dynamic>{
      'Product': instance.product,
      'Label': instance.label,
      'Count': instance.count,
      'Id': instance.id,
    };
