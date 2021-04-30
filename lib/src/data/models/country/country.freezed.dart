// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'country.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
class _$CountryTearOff {
  const _$CountryTearOff();

  _Country call(
      {String? countryId,
      String? countryCode,
      String? dialCode,
      String? flagCode,
      String? nationality,
      String? countryName}) {
    return _Country(
      countryId: countryId,
      countryCode: countryCode,
      dialCode: dialCode,
      flagCode: flagCode,
      nationality: nationality,
      countryName: countryName,
    );
  }

  Country fromJson(Map<String, Object> json) {
    return Country.fromJson(json);
  }
}

/// @nodoc
const $Country = _$CountryTearOff();

/// @nodoc
mixin _$Country {
  String? get countryId => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get dialCode => throw _privateConstructorUsedError;
  String? get flagCode => throw _privateConstructorUsedError;
  String? get nationality => throw _privateConstructorUsedError;
  String? get countryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res>;
  $Res call(
      {String? countryId,
      String? countryCode,
      String? dialCode,
      String? flagCode,
      String? nationality,
      String? countryName});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res> implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  final Country _value;
  // ignore: unused_field
  final $Res Function(Country) _then;

  @override
  $Res call({
    Object? countryId = freezed,
    Object? countryCode = freezed,
    Object? dialCode = freezed,
    Object? flagCode = freezed,
    Object? nationality = freezed,
    Object? countryName = freezed,
  }) {
    return _then(_value.copyWith(
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dialCode: dialCode == freezed
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      flagCode: flagCode == freezed
          ? _value.flagCode
          : flagCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: nationality == freezed
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: countryName == freezed
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) then) =
      __$CountryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? countryId,
      String? countryCode,
      String? dialCode,
      String? flagCode,
      String? nationality,
      String? countryName});
}

/// @nodoc
class __$CountryCopyWithImpl<$Res> extends _$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(_Country _value, $Res Function(_Country) _then)
      : super(_value, (v) => _then(v as _Country));

  @override
  _Country get _value => super._value as _Country;

  @override
  $Res call({
    Object? countryId = freezed,
    Object? countryCode = freezed,
    Object? dialCode = freezed,
    Object? flagCode = freezed,
    Object? nationality = freezed,
    Object? countryName = freezed,
  }) {
    return _then(_Country(
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dialCode: dialCode == freezed
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      flagCode: flagCode == freezed
          ? _value.flagCode
          : flagCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: nationality == freezed
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: countryName == freezed
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Country implements _Country {
  _$_Country(
      {this.countryId,
      this.countryCode,
      this.dialCode,
      this.flagCode,
      this.nationality,
      this.countryName});

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryFromJson(json);

  @override
  final String? countryId;
  @override
  final String? countryCode;
  @override
  final String? dialCode;
  @override
  final String? flagCode;
  @override
  final String? nationality;
  @override
  final String? countryName;

  @override
  String toString() {
    return 'Country(countryId: $countryId, countryCode: $countryCode, dialCode: $dialCode, flagCode: $flagCode, nationality: $nationality, countryName: $countryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Country &&
            (identical(other.countryId, countryId) ||
                const DeepCollectionEquality()
                    .equals(other.countryId, countryId)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.dialCode, dialCode) ||
                const DeepCollectionEquality()
                    .equals(other.dialCode, dialCode)) &&
            (identical(other.flagCode, flagCode) ||
                const DeepCollectionEquality()
                    .equals(other.flagCode, flagCode)) &&
            (identical(other.nationality, nationality) ||
                const DeepCollectionEquality()
                    .equals(other.nationality, nationality)) &&
            (identical(other.countryName, countryName) ||
                const DeepCollectionEquality()
                    .equals(other.countryName, countryName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(countryId) ^
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(dialCode) ^
      const DeepCollectionEquality().hash(flagCode) ^
      const DeepCollectionEquality().hash(nationality) ^
      const DeepCollectionEquality().hash(countryName);

  @JsonKey(ignore: true)
  @override
  _$CountryCopyWith<_Country> get copyWith =>
      __$CountryCopyWithImpl<_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryToJson(this);
  }
}

abstract class _Country implements Country {
  factory _Country(
      {String? countryId,
      String? countryCode,
      String? dialCode,
      String? flagCode,
      String? nationality,
      String? countryName}) = _$_Country;

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  String? get countryId => throw _privateConstructorUsedError;
  @override
  String? get countryCode => throw _privateConstructorUsedError;
  @override
  String? get dialCode => throw _privateConstructorUsedError;
  @override
  String? get flagCode => throw _privateConstructorUsedError;
  @override
  String? get nationality => throw _privateConstructorUsedError;
  @override
  String? get countryName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryCopyWith<_Country> get copyWith =>
      throw _privateConstructorUsedError;
}
