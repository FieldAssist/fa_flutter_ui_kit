// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationData _$_$_LocationDataFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['Longitude', 'Latitude']);
  return _$_LocationData(
    longitude: (json['Longitude'] as num?)?.toDouble(),
    latitude: (json['Latitude'] as num?)?.toDouble(),
    accuracy: json['accuracy'] as int? ?? 0,
    source: json['source'] as String? ?? 'NA',
    captureTime: json['captureTime'] as int?,
    capturedAddress: json['capturedAddress'] as String?,
    captureLocationTime: json['captureLocationTime'] as String?,
  );
}

Map<String, dynamic> _$_$_LocationDataToJson(_$_LocationData instance) =>
    <String, dynamic>{
      'Longitude': instance.longitude,
      'Latitude': instance.latitude,
      'accuracy': instance.accuracy,
      'source': instance.source,
      'captureTime': instance.captureTime,
      'capturedAddress': instance.capturedAddress,
      'captureLocationTime': instance.captureLocationTime,
    };
