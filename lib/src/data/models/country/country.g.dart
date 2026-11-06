// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Country _$CountryFromJson(Map<String, dynamic> json) => _Country(
  countryId: json['countryId'] as String?,
  countryCode: json['countryCode'] as String?,
  dialCode: json['dialCode'] as String?,
  flagCode: json['flagCode'] as String?,
  nationality: json['nationality'] as String?,
  countryName: json['countryName'] as String?,
);

Map<String, dynamic> _$CountryToJson(_Country instance) => <String, dynamic>{
  'countryId': instance.countryId,
  'countryCode': instance.countryCode,
  'dialCode': instance.dialCode,
  'flagCode': instance.flagCode,
  'nationality': instance.nationality,
  'countryName': instance.countryName,
};
