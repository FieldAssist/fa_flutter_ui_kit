// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationDataImpl _$$LocationDataImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['Longitude', 'Latitude'],
  );
  return _$LocationDataImpl(
    longitude: (json['Longitude'] as num?)?.toDouble(),
    latitude: (json['Latitude'] as num?)?.toDouble(),
    accuracy: (json['accuracy'] as num?)?.toInt() ?? 0,
    source: json['source'] as String? ?? 'NA',
    placeMarkData: json['placeMarkData'] == null
        ? null
        : PlaceMarkData.fromJson(json['placeMarkData'] as Map<String, dynamic>),
    captureTime: (json['captureTime'] as num?)?.toInt(),
    capturedAddress: json['capturedAddress'] as String?,
    captureLocationTime: json['captureLocationTime'] as String?,
  );
}

Map<String, dynamic> _$$LocationDataImplToJson(_$LocationDataImpl instance) =>
    <String, dynamic>{
      'Longitude': instance.longitude,
      'Latitude': instance.latitude,
      'accuracy': instance.accuracy,
      'source': instance.source,
      'placeMarkData': instance.placeMarkData,
      'captureTime': instance.captureTime,
      'capturedAddress': instance.capturedAddress,
      'captureLocationTime': instance.captureLocationTime,
    };
