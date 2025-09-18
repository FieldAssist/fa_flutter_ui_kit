// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Country _$CountryFromJson(Map<String, dynamic> json) => $checkedCreate(
      '_Country',
      json,
      ($checkedConvert) {
        final val = _Country(
          countryId: $checkedConvert('countryId', (v) => v as String?),
          countryCode: $checkedConvert('countryCode', (v) => v as String?),
          dialCode: $checkedConvert('dialCode', (v) => v as String?),
          flagCode: $checkedConvert('flagCode', (v) => v as String?),
          nationality: $checkedConvert('nationality', (v) => v as String?),
          countryName: $checkedConvert('countryName', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CountryToJson(_Country instance) => <String, dynamic>{
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'dialCode': instance.dialCode,
      'flagCode': instance.flagCode,
      'nationality': instance.nationality,
      'countryName': instance.countryName,
    };
