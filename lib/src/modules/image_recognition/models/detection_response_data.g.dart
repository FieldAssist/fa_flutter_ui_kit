// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetectionResponseData _$DetectionResponseDataFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      '_DetectionResponseData',
      json,
      ($checkedConvert) {
        final val = _DetectionResponseData(
          success: $checkedConvert('Success', (v) => v as bool? ?? false),
          data: $checkedConvert('Data', (v) => v as String? ?? ""),
          message: $checkedConvert('Message', (v) => v as String? ?? ""),
        );
        return val;
      },
      fieldKeyMap: const {
        'success': 'Success',
        'data': 'Data',
        'message': 'Message'
      },
    );

Map<String, dynamic> _$DetectionResponseDataToJson(
        _DetectionResponseData instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Data': instance.data,
      'Message': instance.message,
    };
