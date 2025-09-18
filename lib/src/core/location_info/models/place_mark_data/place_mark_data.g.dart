// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_mark_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceMarkData _$PlaceMarkDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PlaceMarkData',
      json,
      ($checkedConvert) {
        final val = _PlaceMarkData(
          name: $checkedConvert('name', (v) => v as String?),
          street: $checkedConvert('street', (v) => v as String?),
          isoCountryCode:
              $checkedConvert('isoCountryCode', (v) => v as String?),
          country: $checkedConvert('country', (v) => v as String?),
          postalCode: $checkedConvert('postalCode', (v) => v as String?),
          administrativeArea:
              $checkedConvert('administrativeArea', (v) => v as String?),
          subAdministrativeArea:
              $checkedConvert('subAdministrativeArea', (v) => v as String?),
          locality: $checkedConvert('locality', (v) => v as String?),
          subLocality: $checkedConvert('subLocality', (v) => v as String?),
          thoroughfare: $checkedConvert('thoroughfare', (v) => v as String?),
          subThoroughfare:
              $checkedConvert('subThoroughfare', (v) => v as String?),
        );
        return val;
      },
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
