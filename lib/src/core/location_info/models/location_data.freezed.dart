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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationData.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  @JsonKey(name: 'Longitude', required: true)
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Latitude', required: true)
  double get latitude => throw _privateConstructorUsedError;
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
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Longitude', required: true) double longitude,
      @JsonKey(name: 'Latitude', required: true) double latitude,
      @JsonKey(defaultValue: 0) int? accuracy,
      @JsonKey(defaultValue: "NA") String? source,
      PlaceMarkData? placeMarkData,
      int? captureTime,
      String? capturedAddress,
      String? captureLocationTime});

  $PlaceMarkDataCopyWith<$Res>? get placeMarkData;
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = null,
    Object? latitude = null,
    Object? accuracy = freezed,
    Object? source = freezed,
    Object? placeMarkData = freezed,
    Object? captureTime = freezed,
    Object? capturedAddress = freezed,
    Object? captureLocationTime = freezed,
  }) {
    return _then(_value.copyWith(
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$LocationDataImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationDataImplCopyWith(
          _$LocationDataImpl value, $Res Function(_$LocationDataImpl) then) =
      __$$LocationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Longitude', required: true) double longitude,
      @JsonKey(name: 'Latitude', required: true) double latitude,
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
class __$$LocationDataImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationDataImpl>
    implements _$$LocationDataImplCopyWith<$Res> {
  __$$LocationDataImplCopyWithImpl(
      _$LocationDataImpl _value, $Res Function(_$LocationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = null,
    Object? latitude = null,
    Object? accuracy = freezed,
    Object? source = freezed,
    Object? placeMarkData = freezed,
    Object? captureTime = freezed,
    Object? capturedAddress = freezed,
    Object? captureLocationTime = freezed,
  }) {
    return _then(_$LocationDataImpl(
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$LocationDataImpl implements _LocationData {
  _$LocationDataImpl(
      {@JsonKey(name: 'Longitude', required: true) required this.longitude,
      @JsonKey(name: 'Latitude', required: true) required this.latitude,
      @JsonKey(defaultValue: 0) this.accuracy,
      @JsonKey(defaultValue: "NA") this.source,
      this.placeMarkData,
      this.captureTime,
      this.capturedAddress,
      this.captureLocationTime});

  factory _$LocationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDataImplFromJson(json);

  @override
  @JsonKey(name: 'Longitude', required: true)
  final double longitude;
  @override
  @JsonKey(name: 'Latitude', required: true)
  final double latitude;
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
    return 'LocationModel(longitude: $longitude, latitude: $latitude, accuracy: $accuracy, source: $source, placeMarkData: $placeMarkData, captureTime: $captureTime, capturedAddress: $capturedAddress, captureLocationTime: $captureLocationTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDataImpl &&
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
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      __$$LocationDataImplCopyWithImpl<_$LocationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDataImplToJson(
      this,
    );
  }
}

abstract class _LocationData implements LocationModel {
  factory _LocationData(
      {@JsonKey(name: 'Longitude', required: true)
      required final double longitude,
      @JsonKey(name: 'Latitude', required: true) required final double latitude,
      @JsonKey(defaultValue: 0) final int? accuracy,
      @JsonKey(defaultValue: "NA") final String? source,
      final PlaceMarkData? placeMarkData,
      final int? captureTime,
      final String? capturedAddress,
      final String? captureLocationTime}) = _$LocationDataImpl;

  factory _LocationData.fromJson(Map<String, dynamic> json) =
      _$LocationDataImpl.fromJson;

  @override
  @JsonKey(name: 'Longitude', required: true)
  double get longitude;
  @override
  @JsonKey(name: 'Latitude', required: true)
  double get latitude;
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
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
