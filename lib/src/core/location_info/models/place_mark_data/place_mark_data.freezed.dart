// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_mark_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceMarkData {
  String? get name;
  String? get street;
  String? get isoCountryCode;
  String? get country;
  String? get postalCode;
  String? get administrativeArea;
  String? get subAdministrativeArea;
  String? get locality;
  String? get subLocality;
  String? get thoroughfare;
  String? get subThoroughfare;

  /// Create a copy of PlaceMarkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceMarkDataCopyWith<PlaceMarkData> get copyWith =>
      _$PlaceMarkDataCopyWithImpl<PlaceMarkData>(
          this as PlaceMarkData, _$identity);

  /// Serializes this PlaceMarkData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceMarkData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.isoCountryCode, isoCountryCode) ||
                other.isoCountryCode == isoCountryCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.administrativeArea, administrativeArea) ||
                other.administrativeArea == administrativeArea) &&
            (identical(other.subAdministrativeArea, subAdministrativeArea) ||
                other.subAdministrativeArea == subAdministrativeArea) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.subLocality, subLocality) ||
                other.subLocality == subLocality) &&
            (identical(other.thoroughfare, thoroughfare) ||
                other.thoroughfare == thoroughfare) &&
            (identical(other.subThoroughfare, subThoroughfare) ||
                other.subThoroughfare == subThoroughfare));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      street,
      isoCountryCode,
      country,
      postalCode,
      administrativeArea,
      subAdministrativeArea,
      locality,
      subLocality,
      thoroughfare,
      subThoroughfare);

  @override
  String toString() {
    return 'PlaceMarkData(name: $name, street: $street, isoCountryCode: $isoCountryCode, country: $country, postalCode: $postalCode, administrativeArea: $administrativeArea, subAdministrativeArea: $subAdministrativeArea, locality: $locality, subLocality: $subLocality, thoroughfare: $thoroughfare, subThoroughfare: $subThoroughfare)';
  }
}

/// @nodoc
abstract mixin class $PlaceMarkDataCopyWith<$Res> {
  factory $PlaceMarkDataCopyWith(
          PlaceMarkData value, $Res Function(PlaceMarkData) _then) =
      _$PlaceMarkDataCopyWithImpl;
  @useResult
  $Res call(
      {String? name,
      String? street,
      String? isoCountryCode,
      String? country,
      String? postalCode,
      String? administrativeArea,
      String? subAdministrativeArea,
      String? locality,
      String? subLocality,
      String? thoroughfare,
      String? subThoroughfare});
}

/// @nodoc
class _$PlaceMarkDataCopyWithImpl<$Res>
    implements $PlaceMarkDataCopyWith<$Res> {
  _$PlaceMarkDataCopyWithImpl(this._self, this._then);

  final PlaceMarkData _self;
  final $Res Function(PlaceMarkData) _then;

  /// Create a copy of PlaceMarkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? street = freezed,
    Object? isoCountryCode = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? administrativeArea = freezed,
    Object? subAdministrativeArea = freezed,
    Object? locality = freezed,
    Object? subLocality = freezed,
    Object? thoroughfare = freezed,
    Object? subThoroughfare = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      isoCountryCode: freezed == isoCountryCode
          ? _self.isoCountryCode
          : isoCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      administrativeArea: freezed == administrativeArea
          ? _self.administrativeArea
          : administrativeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      subAdministrativeArea: freezed == subAdministrativeArea
          ? _self.subAdministrativeArea
          : subAdministrativeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _self.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      subLocality: freezed == subLocality
          ? _self.subLocality
          : subLocality // ignore: cast_nullable_to_non_nullable
              as String?,
      thoroughfare: freezed == thoroughfare
          ? _self.thoroughfare
          : thoroughfare // ignore: cast_nullable_to_non_nullable
              as String?,
      subThoroughfare: freezed == subThoroughfare
          ? _self.subThoroughfare
          : subThoroughfare // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaceMarkData].
extension PlaceMarkDataPatterns on PlaceMarkData {
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
    TResult Function(_PlaceMarkData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceMarkData() when $default != null:
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
    TResult Function(_PlaceMarkData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceMarkData():
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
    TResult? Function(_PlaceMarkData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceMarkData() when $default != null:
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
            String? name,
            String? street,
            String? isoCountryCode,
            String? country,
            String? postalCode,
            String? administrativeArea,
            String? subAdministrativeArea,
            String? locality,
            String? subLocality,
            String? thoroughfare,
            String? subThoroughfare)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceMarkData() when $default != null:
        return $default(
            _that.name,
            _that.street,
            _that.isoCountryCode,
            _that.country,
            _that.postalCode,
            _that.administrativeArea,
            _that.subAdministrativeArea,
            _that.locality,
            _that.subLocality,
            _that.thoroughfare,
            _that.subThoroughfare);
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
            String? name,
            String? street,
            String? isoCountryCode,
            String? country,
            String? postalCode,
            String? administrativeArea,
            String? subAdministrativeArea,
            String? locality,
            String? subLocality,
            String? thoroughfare,
            String? subThoroughfare)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceMarkData():
        return $default(
            _that.name,
            _that.street,
            _that.isoCountryCode,
            _that.country,
            _that.postalCode,
            _that.administrativeArea,
            _that.subAdministrativeArea,
            _that.locality,
            _that.subLocality,
            _that.thoroughfare,
            _that.subThoroughfare);
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
            String? name,
            String? street,
            String? isoCountryCode,
            String? country,
            String? postalCode,
            String? administrativeArea,
            String? subAdministrativeArea,
            String? locality,
            String? subLocality,
            String? thoroughfare,
            String? subThoroughfare)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceMarkData() when $default != null:
        return $default(
            _that.name,
            _that.street,
            _that.isoCountryCode,
            _that.country,
            _that.postalCode,
            _that.administrativeArea,
            _that.subAdministrativeArea,
            _that.locality,
            _that.subLocality,
            _that.thoroughfare,
            _that.subThoroughfare);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceMarkData extends PlaceMarkData {
  _PlaceMarkData(
      {this.name,
      this.street,
      this.isoCountryCode,
      this.country,
      this.postalCode,
      this.administrativeArea,
      this.subAdministrativeArea,
      this.locality,
      this.subLocality,
      this.thoroughfare,
      this.subThoroughfare})
      : super._();
  factory _PlaceMarkData.fromJson(Map<String, dynamic> json) =>
      _$PlaceMarkDataFromJson(json);

  @override
  final String? name;
  @override
  final String? street;
  @override
  final String? isoCountryCode;
  @override
  final String? country;
  @override
  final String? postalCode;
  @override
  final String? administrativeArea;
  @override
  final String? subAdministrativeArea;
  @override
  final String? locality;
  @override
  final String? subLocality;
  @override
  final String? thoroughfare;
  @override
  final String? subThoroughfare;

  /// Create a copy of PlaceMarkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceMarkDataCopyWith<_PlaceMarkData> get copyWith =>
      __$PlaceMarkDataCopyWithImpl<_PlaceMarkData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceMarkDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceMarkData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.isoCountryCode, isoCountryCode) ||
                other.isoCountryCode == isoCountryCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.administrativeArea, administrativeArea) ||
                other.administrativeArea == administrativeArea) &&
            (identical(other.subAdministrativeArea, subAdministrativeArea) ||
                other.subAdministrativeArea == subAdministrativeArea) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.subLocality, subLocality) ||
                other.subLocality == subLocality) &&
            (identical(other.thoroughfare, thoroughfare) ||
                other.thoroughfare == thoroughfare) &&
            (identical(other.subThoroughfare, subThoroughfare) ||
                other.subThoroughfare == subThoroughfare));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      street,
      isoCountryCode,
      country,
      postalCode,
      administrativeArea,
      subAdministrativeArea,
      locality,
      subLocality,
      thoroughfare,
      subThoroughfare);

  @override
  String toString() {
    return 'PlaceMarkData(name: $name, street: $street, isoCountryCode: $isoCountryCode, country: $country, postalCode: $postalCode, administrativeArea: $administrativeArea, subAdministrativeArea: $subAdministrativeArea, locality: $locality, subLocality: $subLocality, thoroughfare: $thoroughfare, subThoroughfare: $subThoroughfare)';
  }
}

/// @nodoc
abstract mixin class _$PlaceMarkDataCopyWith<$Res>
    implements $PlaceMarkDataCopyWith<$Res> {
  factory _$PlaceMarkDataCopyWith(
          _PlaceMarkData value, $Res Function(_PlaceMarkData) _then) =
      __$PlaceMarkDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? name,
      String? street,
      String? isoCountryCode,
      String? country,
      String? postalCode,
      String? administrativeArea,
      String? subAdministrativeArea,
      String? locality,
      String? subLocality,
      String? thoroughfare,
      String? subThoroughfare});
}

/// @nodoc
class __$PlaceMarkDataCopyWithImpl<$Res>
    implements _$PlaceMarkDataCopyWith<$Res> {
  __$PlaceMarkDataCopyWithImpl(this._self, this._then);

  final _PlaceMarkData _self;
  final $Res Function(_PlaceMarkData) _then;

  /// Create a copy of PlaceMarkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? street = freezed,
    Object? isoCountryCode = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? administrativeArea = freezed,
    Object? subAdministrativeArea = freezed,
    Object? locality = freezed,
    Object? subLocality = freezed,
    Object? thoroughfare = freezed,
    Object? subThoroughfare = freezed,
  }) {
    return _then(_PlaceMarkData(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      isoCountryCode: freezed == isoCountryCode
          ? _self.isoCountryCode
          : isoCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      administrativeArea: freezed == administrativeArea
          ? _self.administrativeArea
          : administrativeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      subAdministrativeArea: freezed == subAdministrativeArea
          ? _self.subAdministrativeArea
          : subAdministrativeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _self.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      subLocality: freezed == subLocality
          ? _self.subLocality
          : subLocality // ignore: cast_nullable_to_non_nullable
              as String?,
      thoroughfare: freezed == thoroughfare
          ? _self.thoroughfare
          : thoroughfare // ignore: cast_nullable_to_non_nullable
              as String?,
      subThoroughfare: freezed == subThoroughfare
          ? _self.subThoroughfare
          : subThoroughfare // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
