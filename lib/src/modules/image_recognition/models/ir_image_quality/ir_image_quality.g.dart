// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_image_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrImageQualityModel _$IrImageQualityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_IrImageQualityModel',
      json,
      ($checkedConvert) {
        final val = _IrImageQualityModel(
          isInvalid: $checkedConvert('IsInvalid', (v) => v as bool? ?? false),
          errors: $checkedConvert('Errors',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'isInvalid': 'IsInvalid', 'errors': 'Errors'},
    );

Map<String, dynamic> _$IrImageQualityModelToJson(
        _IrImageQualityModel instance) =>
    <String, dynamic>{
      'IsInvalid': instance.isInvalid,
      'Errors': instance.errors,
    };
