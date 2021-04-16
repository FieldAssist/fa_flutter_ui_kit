// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Country _$_$_CountryFromJson(Map<String, dynamic> json) {
  return _$_Country(
    countryId: json['countryId'] as String,
    countryCode: json['countryCode'] as String,
    dialCode: json['dialCode'] as String,
    flagCode: json['flagCode'] as String,
    nationality: json['nationality'] as String,
    countryName: json['countryName'] as String,
  );
}

Map<String, dynamic> _$_$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'dialCode': instance.dialCode,
      'flagCode': instance.flagCode,
      'nationality': instance.nationality,
      'countryName': instance.countryName,
    };
