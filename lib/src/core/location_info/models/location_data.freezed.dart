// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'location_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationData _$LocationDataFromJson(Map<String, dynamic> json) {
  return _LocationData.fromJson(json);
}

/// @nodoc
class _$LocationDataTearOff {
  const _$LocationDataTearOff();

  _LocationData call(
      {@JsonKey(name: 'Longitude', required: true) double? longitude,
      @JsonKey(name: 'Latitude', required: true) double? latitude,
      @JsonKey(defaultValue: 0) int? accuracy,
      @JsonKey(defaultValue: "NA") String? source,
      int? captureTime,
      String? capturedAddress,
      String? captureLocationTime}) {
    return _LocationData(
      longitude: longitude,
      latitude: latitude,
      accuracy: accuracy,
      source: source,
      captureTime: captureTime,
      capturedAddress: capturedAddress,
      captureLocationTime: captureLocationTime,
    );
  }

  LocationData fromJson(Map<String, Object> json) {
    return LocationData.fromJson(json);
  }
}

/// @nodoc
const $LocationData = _$LocationDataTearOff();

/// @nodoc
mixin _$LocationData {
  @JsonKey(name: 'Longitude', required: true)
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Latitude', required: true)
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int? get accuracy => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "NA")
  String? get source => throw _privateConstructorUsedError;
  int? get captureTime => throw _privateConstructorUsedError;
  String? get capturedAddress => throw _privateConstructorUsedError;
  String? get captureLocationTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationDataCopyWith<LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataCopyWith<$Res> {
  factory $LocationDataCopyWith(
          LocationData value, $Res Function(LocationData) then) =
      _$LocationDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Longitude', required: true) double? longitude,
      @JsonKey(name: 'Latitude', required: true) double? latitude,
      @JsonKey(defaultValue: 0) int? accuracy,
      @JsonKey(defaultValue: "NA") String? source,
      int? captureTime,
      String? capturedAddress,
      String? captureLocationTime});
}

/// @nodoc
class _$LocationDataCopyWithImpl<$Res> implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._value, this._then);

  final LocationData _value;
  // ignore: unused_field
  final $Res Function(LocationData) _then;

  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? accuracy = freezed,
    Object? source = freezed,
    Object? captureTime = freezed,
    Object? capturedAddress = freezed,
    Object? captureLocationTime = freezed,
  }) {
    return _then(_value.copyWith(
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int?,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      captureTime: captureTime == freezed
          ? _value.captureTime
          : captureTime // ignore: cast_nullable_to_non_nullable
              as int?,
      capturedAddress: capturedAddress == freezed
          ? _value.capturedAddress
          : capturedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      captureLocationTime: captureLocationTime == freezed
          ? _value.captureLocationTime
          : captureLocationTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LocationDataCopyWith<$Res>
    implements $LocationDataCopyWith<$Res> {
  factory _$LocationDataCopyWith(
          _LocationData value, $Res Function(_LocationData) then) =
      __$LocationDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Longitude', required: true) double? longitude,
      @JsonKey(name: 'Latitude', required: true) double? latitude,
      @JsonKey(defaultValue: 0) int? accuracy,
      @JsonKey(defaultValue: "NA") String? source,
      int? captureTime,
      String? capturedAddress,
      String? captureLocationTime});
}

/// @nodoc
class __$LocationDataCopyWithImpl<$Res> extends _$LocationDataCopyWithImpl<$Res>
    implements _$LocationDataCopyWith<$Res> {
  __$LocationDataCopyWithImpl(
      _LocationData _value, $Res Function(_LocationData) _then)
      : super(_value, (v) => _then(v as _LocationData));

  @override
  _LocationData get _value => super._value as _LocationData;

  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? accuracy = freezed,
    Object? source = freezed,
    Object? captureTime = freezed,
    Object? capturedAddress = freezed,
    Object? captureLocationTime = freezed,
  }) {
    return _then(_LocationData(
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int?,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      captureTime: captureTime == freezed
          ? _value.captureTime
          : captureTime // ignore: cast_nullable_to_non_nullable
              as int?,
      capturedAddress: capturedAddress == freezed
          ? _value.capturedAddress
          : capturedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      captureLocationTime: captureLocationTime == freezed
          ? _value.captureLocationTime
          : captureLocationTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationData implements _LocationData {
  _$_LocationData(
      {@JsonKey(name: 'Longitude', required: true) this.longitude,
      @JsonKey(name: 'Latitude', required: true) this.latitude,
      @JsonKey(defaultValue: 0) this.accuracy,
      @JsonKey(defaultValue: "NA") this.source,
      this.captureTime,
      this.capturedAddress,
      this.captureLocationTime});

  factory _$_LocationData.fromJson(Map<String, dynamic> json) =>
      _$_$_LocationDataFromJson(json);

  @override
  @JsonKey(name: 'Longitude', required: true)
  final double? longitude;
  @override
  @JsonKey(name: 'Latitude', required: true)
  final double? latitude;
  @override
  @JsonKey(defaultValue: 0)
  final int? accuracy;
  @override
  @JsonKey(defaultValue: "NA")
  final String? source;
  @override
  final int? captureTime;
  @override
  final String? capturedAddress;
  @override
  final String? captureLocationTime;

  @override
  String toString() {
    return 'LocationData(longitude: $longitude, latitude: $latitude, accuracy: $accuracy, source: $source, captureTime: $captureTime, capturedAddress: $capturedAddress, captureLocationTime: $captureLocationTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocationData &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.accuracy, accuracy) ||
                const DeepCollectionEquality()
                    .equals(other.accuracy, accuracy)) &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.captureTime, captureTime) ||
                const DeepCollectionEquality()
                    .equals(other.captureTime, captureTime)) &&
            (identical(other.capturedAddress, capturedAddress) ||
                const DeepCollectionEquality()
                    .equals(other.capturedAddress, capturedAddress)) &&
            (identical(other.captureLocationTime, captureLocationTime) ||
                const DeepCollectionEquality()
                    .equals(other.captureLocationTime, captureLocationTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(accuracy) ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(captureTime) ^
      const DeepCollectionEquality().hash(capturedAddress) ^
      const DeepCollectionEquality().hash(captureLocationTime);

  @JsonKey(ignore: true)
  @override
  _$LocationDataCopyWith<_LocationData> get copyWith =>
      __$LocationDataCopyWithImpl<_LocationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocationDataToJson(this);
  }
}

abstract class _LocationData implements LocationData {
  factory _LocationData(
      {@JsonKey(name: 'Longitude', required: true) double? longitude,
      @JsonKey(name: 'Latitude', required: true) double? latitude,
      @JsonKey(defaultValue: 0) int? accuracy,
      @JsonKey(defaultValue: "NA") String? source,
      int? captureTime,
      String? capturedAddress,
      String? captureLocationTime}) = _$_LocationData;

  factory _LocationData.fromJson(Map<String, dynamic> json) =
      _$_LocationData.fromJson;

  @override
  @JsonKey(name: 'Longitude', required: true)
  double? get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Latitude', required: true)
  double? get latitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(defaultValue: 0)
  int? get accuracy => throw _privateConstructorUsedError;
  @override
  @JsonKey(defaultValue: "NA")
  String? get source => throw _privateConstructorUsedError;
  @override
  int? get captureTime => throw _privateConstructorUsedError;
  @override
  String? get capturedAddress => throw _privateConstructorUsedError;
  @override
  String? get captureLocationTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocationDataCopyWith<_LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}
