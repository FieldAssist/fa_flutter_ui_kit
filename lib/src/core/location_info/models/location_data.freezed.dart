// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationData _$LocationDataFromJson(Map<String, dynamic> json) {
  return _LocationData.fromJson(json);
}

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
  PlaceMarkData? get placeMarkData => throw _privateConstructorUsedError;
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
      _$LocationDataCopyWithImpl<$Res, LocationData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Longitude', required: true) double? longitude,
      @JsonKey(name: 'Latitude', required: true) double? latitude,
      @JsonKey(defaultValue: 0) int? accuracy,
      @JsonKey(defaultValue: "NA") String? source,
      PlaceMarkData? placeMarkData,
      int? captureTime,
      String? capturedAddress,
      String? captureLocationTime});

  $PlaceMarkDataCopyWith<$Res>? get placeMarkData;
}

/// @nodoc
class _$LocationDataCopyWithImpl<$Res, $Val extends LocationData>
    implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? accuracy = freezed,
    Object? source = freezed,
    Object? placeMarkData = freezed,
    Object? captureTime = freezed,
    Object? capturedAddress = freezed,
    Object? captureLocationTime = freezed,
  }) {
    return _then(_value.copyWith(
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      placeMarkData: freezed == placeMarkData
          ? _value.placeMarkData
          : placeMarkData // ignore: cast_nullable_to_non_nullable
              as PlaceMarkData?,
      captureTime: freezed == captureTime
          ? _value.captureTime
          : captureTime // ignore: cast_nullable_to_non_nullable
              as int?,
      capturedAddress: freezed == capturedAddress
          ? _value.capturedAddress
          : capturedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      captureLocationTime: freezed == captureLocationTime
          ? _value.captureLocationTime
          : captureLocationTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaceMarkDataCopyWith<$Res>? get placeMarkData {
    if (_value.placeMarkData == null) {
      return null;
    }

    return $PlaceMarkDataCopyWith<$Res>(_value.placeMarkData!, (value) {
      return _then(_value.copyWith(placeMarkData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LocationDataCopyWith<$Res>
    implements $LocationDataCopyWith<$Res> {
  factory _$$_LocationDataCopyWith(
          _$_LocationData value, $Res Function(_$_LocationData) then) =
      __$$_LocationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Longitude', required: true) double? longitude,
      @JsonKey(name: 'Latitude', required: true) double? latitude,
      @JsonKey(defaultValue: 0) int? accuracy,
      @JsonKey(defaultValue: "NA") String? source,
      PlaceMarkData? placeMarkData,
      int? captureTime,
      String? capturedAddress,
      String? captureLocationTime});

  @override
  $PlaceMarkDataCopyWith<$Res>? get placeMarkData;
}

/// @nodoc
class __$$_LocationDataCopyWithImpl<$Res>
    extends _$LocationDataCopyWithImpl<$Res, _$_LocationData>
    implements _$$_LocationDataCopyWith<$Res> {
  __$$_LocationDataCopyWithImpl(
      _$_LocationData _value, $Res Function(_$_LocationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? accuracy = freezed,
    Object? source = freezed,
    Object? placeMarkData = freezed,
    Object? captureTime = freezed,
    Object? capturedAddress = freezed,
    Object? captureLocationTime = freezed,
  }) {
    return _then(_$_LocationData(
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      placeMarkData: freezed == placeMarkData
          ? _value.placeMarkData
          : placeMarkData // ignore: cast_nullable_to_non_nullable
              as PlaceMarkData?,
      captureTime: freezed == captureTime
          ? _value.captureTime
          : captureTime // ignore: cast_nullable_to_non_nullable
              as int?,
      capturedAddress: freezed == capturedAddress
          ? _value.capturedAddress
          : capturedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      captureLocationTime: freezed == captureLocationTime
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
      this.placeMarkData,
      this.captureTime,
      this.capturedAddress,
      this.captureLocationTime});

  factory _$_LocationData.fromJson(Map<String, dynamic> json) =>
      _$$_LocationDataFromJson(json);

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
  final PlaceMarkData? placeMarkData;
  @override
  final int? captureTime;
  @override
  final String? capturedAddress;
  @override
  final String? captureLocationTime;

  @override
  String toString() {
    return 'LocationData(longitude: $longitude, latitude: $latitude, accuracy: $accuracy, source: $source, placeMarkData: $placeMarkData, captureTime: $captureTime, capturedAddress: $capturedAddress, captureLocationTime: $captureLocationTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationData &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.placeMarkData, placeMarkData) ||
                other.placeMarkData == placeMarkData) &&
            (identical(other.captureTime, captureTime) ||
                other.captureTime == captureTime) &&
            (identical(other.capturedAddress, capturedAddress) ||
                other.capturedAddress == capturedAddress) &&
            (identical(other.captureLocationTime, captureLocationTime) ||
                other.captureLocationTime == captureLocationTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, longitude, latitude, accuracy,
      source, placeMarkData, captureTime, capturedAddress, captureLocationTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationDataCopyWith<_$_LocationData> get copyWith =>
      __$$_LocationDataCopyWithImpl<_$_LocationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationDataToJson(
      this,
    );
  }
}

abstract class _LocationData implements LocationData {
  factory _LocationData(
      {@JsonKey(name: 'Longitude', required: true) final double? longitude,
      @JsonKey(name: 'Latitude', required: true) final double? latitude,
      @JsonKey(defaultValue: 0) final int? accuracy,
      @JsonKey(defaultValue: "NA") final String? source,
      final PlaceMarkData? placeMarkData,
      final int? captureTime,
      final String? capturedAddress,
      final String? captureLocationTime}) = _$_LocationData;

  factory _LocationData.fromJson(Map<String, dynamic> json) =
      _$_LocationData.fromJson;

  @override
  @JsonKey(name: 'Longitude', required: true)
  double? get longitude;
  @override
  @JsonKey(name: 'Latitude', required: true)
  double? get latitude;
  @override
  @JsonKey(defaultValue: 0)
  int? get accuracy;
  @override
  @JsonKey(defaultValue: "NA")
  String? get source;
  @override
  PlaceMarkData? get placeMarkData;
  @override
  int? get captureTime;
  @override
  String? get capturedAddress;
  @override
  String? get captureLocationTime;
  @override
  @JsonKey(ignore: true)
  _$$_LocationDataCopyWith<_$_LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}
