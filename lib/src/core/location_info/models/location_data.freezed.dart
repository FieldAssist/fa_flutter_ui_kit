// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationData {
  @JsonKey(name: 'Longitude', required: true)
  double? get longitude;
  @JsonKey(name: 'Latitude', required: true)
  double? get latitude;
  @JsonKey(defaultValue: 0)
  int? get accuracy;
  @JsonKey(defaultValue: "NA")
  String? get source;
  PlaceMarkData? get placeMarkData;
  int? get captureTime;
  String? get capturedAddress;
  String? get captureLocationTime;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationDataCopyWith<LocationData> get copyWith =>
      _$LocationDataCopyWithImpl<LocationData>(
          this as LocationData, _$identity);

  /// Serializes this LocationData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, longitude, latitude, accuracy,
      source, placeMarkData, captureTime, capturedAddress, captureLocationTime);

  @override
  String toString() {
    return 'LocationData(longitude: $longitude, latitude: $latitude, accuracy: $accuracy, source: $source, placeMarkData: $placeMarkData, captureTime: $captureTime, capturedAddress: $capturedAddress, captureLocationTime: $captureLocationTime)';
  }
}

/// @nodoc
abstract mixin class $LocationDataCopyWith<$Res> {
  factory $LocationDataCopyWith(
          LocationData value, $Res Function(LocationData) _then) =
      _$LocationDataCopyWithImpl;
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
class _$LocationDataCopyWithImpl<$Res> implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._self, this._then);

  final LocationData _self;
  final $Res Function(LocationData) _then;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int?,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      placeMarkData: freezed == placeMarkData
          ? _self.placeMarkData
          : placeMarkData // ignore: cast_nullable_to_non_nullable
              as PlaceMarkData?,
      captureTime: freezed == captureTime
          ? _self.captureTime
          : captureTime // ignore: cast_nullable_to_non_nullable
              as int?,
      capturedAddress: freezed == capturedAddress
          ? _self.capturedAddress
          : capturedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      captureLocationTime: freezed == captureLocationTime
          ? _self.captureLocationTime
          : captureLocationTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceMarkDataCopyWith<$Res>? get placeMarkData {
    if (_self.placeMarkData == null) {
      return null;
    }

    return $PlaceMarkDataCopyWith<$Res>(_self.placeMarkData!, (value) {
      return _then(_self.copyWith(placeMarkData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LocationData].
extension LocationDataPatterns on LocationData {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocationData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationData() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocationData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationData():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocationData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationData() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'Longitude', required: true) double? longitude,
            @JsonKey(name: 'Latitude', required: true) double? latitude,
            @JsonKey(defaultValue: 0) int? accuracy,
            @JsonKey(defaultValue: "NA") String? source,
            PlaceMarkData? placeMarkData,
            int? captureTime,
            String? capturedAddress,
            String? captureLocationTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationData() when $default != null:
        return $default(
            _that.longitude,
            _that.latitude,
            _that.accuracy,
            _that.source,
            _that.placeMarkData,
            _that.captureTime,
            _that.capturedAddress,
            _that.captureLocationTime);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'Longitude', required: true) double? longitude,
            @JsonKey(name: 'Latitude', required: true) double? latitude,
            @JsonKey(defaultValue: 0) int? accuracy,
            @JsonKey(defaultValue: "NA") String? source,
            PlaceMarkData? placeMarkData,
            int? captureTime,
            String? capturedAddress,
            String? captureLocationTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationData():
        return $default(
            _that.longitude,
            _that.latitude,
            _that.accuracy,
            _that.source,
            _that.placeMarkData,
            _that.captureTime,
            _that.capturedAddress,
            _that.captureLocationTime);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'Longitude', required: true) double? longitude,
            @JsonKey(name: 'Latitude', required: true) double? latitude,
            @JsonKey(defaultValue: 0) int? accuracy,
            @JsonKey(defaultValue: "NA") String? source,
            PlaceMarkData? placeMarkData,
            int? captureTime,
            String? capturedAddress,
            String? captureLocationTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationData() when $default != null:
        return $default(
            _that.longitude,
            _that.latitude,
            _that.accuracy,
            _that.source,
            _that.placeMarkData,
            _that.captureTime,
            _that.capturedAddress,
            _that.captureLocationTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocationData implements LocationData {
  _LocationData(
      {@JsonKey(name: 'Longitude', required: true) this.longitude,
      @JsonKey(name: 'Latitude', required: true) this.latitude,
      @JsonKey(defaultValue: 0) this.accuracy,
      @JsonKey(defaultValue: "NA") this.source,
      this.placeMarkData,
      this.captureTime,
      this.capturedAddress,
      this.captureLocationTime});
  factory _LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

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

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationDataCopyWith<_LocationData> get copyWith =>
      __$LocationDataCopyWithImpl<_LocationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, longitude, latitude, accuracy,
      source, placeMarkData, captureTime, capturedAddress, captureLocationTime);

  @override
  String toString() {
    return 'LocationData(longitude: $longitude, latitude: $latitude, accuracy: $accuracy, source: $source, placeMarkData: $placeMarkData, captureTime: $captureTime, capturedAddress: $capturedAddress, captureLocationTime: $captureLocationTime)';
  }
}

/// @nodoc
abstract mixin class _$LocationDataCopyWith<$Res>
    implements $LocationDataCopyWith<$Res> {
  factory _$LocationDataCopyWith(
          _LocationData value, $Res Function(_LocationData) _then) =
      __$LocationDataCopyWithImpl;
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
class __$LocationDataCopyWithImpl<$Res>
    implements _$LocationDataCopyWith<$Res> {
  __$LocationDataCopyWithImpl(this._self, this._then);

  final _LocationData _self;
  final $Res Function(_LocationData) _then;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_LocationData(
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int?,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      placeMarkData: freezed == placeMarkData
          ? _self.placeMarkData
          : placeMarkData // ignore: cast_nullable_to_non_nullable
              as PlaceMarkData?,
      captureTime: freezed == captureTime
          ? _self.captureTime
          : captureTime // ignore: cast_nullable_to_non_nullable
              as int?,
      capturedAddress: freezed == capturedAddress
          ? _self.capturedAddress
          : capturedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      captureLocationTime: freezed == captureLocationTime
          ? _self.captureLocationTime
          : captureLocationTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceMarkDataCopyWith<$Res>? get placeMarkData {
    if (_self.placeMarkData == null) {
      return null;
    }

    return $PlaceMarkDataCopyWith<$Res>(_self.placeMarkData!, (value) {
      return _then(_self.copyWith(placeMarkData: value));
    });
  }
}

// dart format on
