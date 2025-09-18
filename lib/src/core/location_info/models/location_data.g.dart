// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationData _$LocationDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_LocationData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['Longitude', 'Latitude'],
        );
        final val = _LocationData(
          longitude:
              $checkedConvert('Longitude', (v) => (v as num?)?.toDouble()),
          latitude: $checkedConvert('Latitude', (v) => (v as num?)?.toDouble()),
          accuracy:
              $checkedConvert('accuracy', (v) => (v as num?)?.toInt() ?? 0),
          source: $checkedConvert('source', (v) => v as String? ?? 'NA'),
          placeMarkData: $checkedConvert(
              'placeMarkData',
              (v) => v == null
                  ? null
                  : PlaceMarkData.fromJson(v as Map<String, dynamic>)),
          captureTime:
              $checkedConvert('captureTime', (v) => (v as num?)?.toInt()),
          capturedAddress:
              $checkedConvert('capturedAddress', (v) => v as String?),
          captureLocationTime:
              $checkedConvert('captureLocationTime', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'longitude': 'Longitude', 'latitude': 'Latitude'},
    );

Map<String, dynamic> _$LocationDataToJson(_LocationData instance) =>
    <String, dynamic>{
      'Longitude': instance.longitude,
      'Latitude': instance.latitude,
      'accuracy': instance.accuracy,
      'source': instance.source,
      'placeMarkData': instance.placeMarkData?.toJson(),
      'captureTime': instance.captureTime,
      'capturedAddress': instance.capturedAddress,
      'captureLocationTime': instance.captureLocationTime,
    };
