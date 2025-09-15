// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrResponseModel _$IrResponseModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_IrResponseModel',
      json,
      ($checkedConvert) {
        final val = _IrResponseModel(
          imageURL: $checkedConvert('ImageURL', (v) => v as String? ?? ""),
          brandSkuCount: $checkedConvert(
              'BrandSkuCount', (v) => (v as num?)?.toInt() ?? 0),
          totalObjectCount: $checkedConvert(
              'TotalObjectCount', (v) => (v as num?)?.toInt() ?? 0),
          shelfShare:
              $checkedConvert('ShelfShare', (v) => (v as num?)?.toInt() ?? 0),
          shelfSharePercent: $checkedConvert(
              'ShelfSharePercent', (v) => (v as num?)?.toDouble() ?? 0),
          assetScore: $checkedConvert(
              'AssetScore', (v) => (v as num?)?.toDouble() ?? 0),
          data: $checkedConvert(
              'Data',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => IrResponseProductData.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          products: $checkedConvert(
              'Products',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => IrResponseProductData.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          kpiWeightage: $checkedConvert(
              'KPIWeightage',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          IrKpiWeightage.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          planogram: $checkedConvert(
              'Planogram',
              (v) => v == null
                  ? null
                  : IrPlanogram.fromJson(v as Map<String, dynamic>)),
          assetName: $checkedConvert('AssetName', (v) => v as String?),
          equipmentName: $checkedConvert('EquipmentName', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'imageURL': 'ImageURL',
        'brandSkuCount': 'BrandSkuCount',
        'totalObjectCount': 'TotalObjectCount',
        'shelfShare': 'ShelfShare',
        'shelfSharePercent': 'ShelfSharePercent',
        'assetScore': 'AssetScore',
        'data': 'Data',
        'products': 'Products',
        'kpiWeightage': 'KPIWeightage',
        'planogram': 'Planogram',
        'assetName': 'AssetName',
        'equipmentName': 'EquipmentName'
      },
    );

Map<String, dynamic> _$IrResponseModelToJson(_IrResponseModel instance) =>
    <String, dynamic>{
      'ImageURL': instance.imageURL,
      'BrandSkuCount': instance.brandSkuCount,
      'TotalObjectCount': instance.totalObjectCount,
      'ShelfShare': instance.shelfShare,
      'ShelfSharePercent': instance.shelfSharePercent,
      'AssetScore': instance.assetScore,
      'Data': instance.data.map((e) => e.toJson()).toList(),
      'Products': instance.products.map((e) => e.toJson()).toList(),
      'KPIWeightage': instance.kpiWeightage.map((e) => e.toJson()).toList(),
      'Planogram': instance.planogram?.toJson(),
      'AssetName': instance.assetName,
      'EquipmentName': instance.equipmentName,
    };
