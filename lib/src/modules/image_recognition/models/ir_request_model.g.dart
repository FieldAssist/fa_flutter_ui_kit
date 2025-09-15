// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrRequestModel _$IrRequestModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_IrRequestModel',
      json,
      ($checkedConvert) {
        final val = _IrRequestModel(
          sessionId: $checkedConvert('SessionId', (v) => v as String? ?? ""),
          attendanceId:
              $checkedConvert('AttendanceId', (v) => v as String? ?? ""),
          outletId:
              $checkedConvert('OutletId', (v) => (v as num?)?.toInt() ?? 0),
          remarks: $checkedConvert('Remarks', (v) => v as String? ?? ""),
          assetId: $checkedConvert('AssetId', (v) => (v as num?)?.toInt() ?? 0),
          equipmentId:
              $checkedConvert('EquipmentId', (v) => (v as num?)?.toInt()),
          beforeSeenEnabled:
              $checkedConvert('BeforeSeenEnabled', (v) => v ?? 0),
          imageState:
              $checkedConvert('ImageState', (v) => (v as num?)?.toInt() ?? 100),
          logicId: $checkedConvert('LogicId', (v) => (v as num?)?.toInt() ?? 0),
          mustSellProducts: $checkedConvert(
              'MustSellProducts',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => (e as num).toInt())
                      .toList() ??
                  const []),
          focusedProducts: $checkedConvert(
              'FocusedProducts',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => (e as num).toInt())
                      .toList() ??
                  const []),
          premiumSkus: $checkedConvert(
              'PremiumSkuProducts',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => (e as num).toInt())
                      .toList() ??
                  const []),
          imageUrl: $checkedConvert('ImageUrl', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'sessionId': 'SessionId',
        'attendanceId': 'AttendanceId',
        'outletId': 'OutletId',
        'remarks': 'Remarks',
        'assetId': 'AssetId',
        'equipmentId': 'EquipmentId',
        'beforeSeenEnabled': 'BeforeSeenEnabled',
        'imageState': 'ImageState',
        'logicId': 'LogicId',
        'mustSellProducts': 'MustSellProducts',
        'focusedProducts': 'FocusedProducts',
        'premiumSkus': 'PremiumSkuProducts',
        'imageUrl': 'ImageUrl'
      },
    );

Map<String, dynamic> _$IrRequestModelToJson(_IrRequestModel instance) =>
    <String, dynamic>{
      'SessionId': instance.sessionId,
      'AttendanceId': instance.attendanceId,
      'OutletId': instance.outletId,
      'Remarks': instance.remarks,
      'AssetId': instance.assetId,
      'EquipmentId': instance.equipmentId,
      'BeforeSeenEnabled': instance.beforeSeenEnabled,
      'ImageState': instance.imageState,
      'LogicId': instance.logicId,
      'MustSellProducts': instance.mustSellProducts,
      'FocusedProducts': instance.focusedProducts,
      'PremiumSkuProducts': instance.premiumSkus,
      'ImageUrl': instance.imageUrl,
    };
