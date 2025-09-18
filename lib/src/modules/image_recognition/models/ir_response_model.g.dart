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
          imageURL: $checkedConvert('imageURL', (v) => v as String? ?? ""),
          brandSkuCount: $checkedConvert(
              'brandSkuCount', (v) => (v as num?)?.toInt() ?? 0),
          totalObjectCount: $checkedConvert(
              'totalObjectCount', (v) => (v as num?)?.toInt() ?? 0),
          shelfShare:
              $checkedConvert('shelfShare', (v) => (v as num?)?.toInt() ?? 0),
          shelfSharePercent: $checkedConvert(
              'shelfSharePercent', (v) => (v as num?)?.toDouble() ?? 0),
          assetScore: $checkedConvert(
              'assetScore', (v) => (v as num?)?.toDouble() ?? 0),
          data: $checkedConvert(
              'data',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => IrResponseProductData.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          products: $checkedConvert(
              'products',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => IrResponseProductData.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          kpiWeightage: $checkedConvert(
              'kpiWeightage',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          IrKpiWeightage.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          planogram: $checkedConvert(
              'planogram',
              (v) => v == null
                  ? null
                  : IrPlanogram.fromJson(v as Map<String, dynamic>)),
          assetName: $checkedConvert('assetName', (v) => v as String?),
          equipmentName: $checkedConvert('equipmentName', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$IrResponseModelToJson(_IrResponseModel instance) =>
    <String, dynamic>{
      'imageURL': instance.imageURL,
      'brandSkuCount': instance.brandSkuCount,
      'totalObjectCount': instance.totalObjectCount,
      'shelfShare': instance.shelfShare,
      'shelfSharePercent': instance.shelfSharePercent,
      'assetScore': instance.assetScore,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'products': instance.products.map((e) => e.toJson()).toList(),
      'kpiWeightage': instance.kpiWeightage.map((e) => e.toJson()).toList(),
      'planogram': instance.planogram?.toJson(),
      'assetName': instance.assetName,
      'equipmentName': instance.equipmentName,
    };
