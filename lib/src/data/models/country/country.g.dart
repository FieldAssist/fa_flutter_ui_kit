// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      countryId: json['countryId'] as String?,
      countryCode: json['countryCode'] as String?,
      dialCode: json['dialCode'] as String?,
      flagCode: json['flagCode'] as String?,
      nationality: json['nationality'] as String?,
      countryName: json['countryName'] as String?,
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'dialCode': instance.dialCode,
      'flagCode': instance.flagCode,
      'nationality': instance.nationality,
      'countryName': instance.countryName,
    };
