// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_mark_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceMarkData _$PlaceMarkDataFromJson(Map<String, dynamic> json) =>
    _PlaceMarkData(
      name: json['name'] as String?,
      street: json['street'] as String?,
      isoCountryCode: json['isoCountryCode'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      administrativeArea: json['administrativeArea'] as String?,
      subAdministrativeArea: json['subAdministrativeArea'] as String?,
      locality: json['locality'] as String?,
      subLocality: json['subLocality'] as String?,
      thoroughfare: json['thoroughfare'] as String?,
      subThoroughfare: json['subThoroughfare'] as String?,
    );

Map<String, dynamic> _$PlaceMarkDataToJson(_PlaceMarkData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'street': instance.street,
      'isoCountryCode': instance.isoCountryCode,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'administrativeArea': instance.administrativeArea,
      'subAdministrativeArea': instance.subAdministrativeArea,
      'locality': instance.locality,
      'subLocality': instance.subLocality,
      'thoroughfare': instance.thoroughfare,
      'subThoroughfare': instance.subThoroughfare,
    };
