// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Country {
  String? get countryId;
  String? get countryCode;
  String? get dialCode;
  String? get flagCode;
  String? get nationality;
  String? get countryName;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountryCopyWith<Country> get copyWith =>
      _$CountryCopyWithImpl<Country>(this as Country, _$identity);

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Country &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.flagCode, flagCode) ||
                other.flagCode == flagCode) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, countryId, countryCode, dialCode,
      flagCode, nationality, countryName);

  @override
  String toString() {
    return 'Country(countryId: $countryId, countryCode: $countryCode, dialCode: $dialCode, flagCode: $flagCode, nationality: $nationality, countryName: $countryName)';
  }
}

/// @nodoc
abstract mixin class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) _then) =
      _$CountryCopyWithImpl;
  @useResult
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
  _$CountryCopyWithImpl(this._self, this._then);

  final Country _self;
  final $Res Function(Country) _then;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryId = freezed,
    Object? countryCode = freezed,
    Object? dialCode = freezed,
    Object? flagCode = freezed,
    Object? nationality = freezed,
    Object? countryName = freezed,
  }) {
    return _then(_self.copyWith(
      countryId: freezed == countryId
          ? _self.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dialCode: freezed == dialCode
          ? _self.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      flagCode: freezed == flagCode
          ? _self.flagCode
          : flagCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _self.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Country].
extension CountryPatterns on Country {
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
    TResult Function(_Country value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Country() when $default != null:
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
    TResult Function(_Country value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Country():
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
    TResult? Function(_Country value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Country() when $default != null:
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
    TResult Function(String? countryId, String? countryCode, String? dialCode,
            String? flagCode, String? nationality, String? countryName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Country() when $default != null:
        return $default(_that.countryId, _that.countryCode, _that.dialCode,
            _that.flagCode, _that.nationality, _that.countryName);
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
    TResult Function(String? countryId, String? countryCode, String? dialCode,
            String? flagCode, String? nationality, String? countryName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Country():
        return $default(_that.countryId, _that.countryCode, _that.dialCode,
            _that.flagCode, _that.nationality, _that.countryName);
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
    TResult? Function(String? countryId, String? countryCode, String? dialCode,
            String? flagCode, String? nationality, String? countryName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Country() when $default != null:
        return $default(_that.countryId, _that.countryCode, _that.dialCode,
            _that.flagCode, _that.nationality, _that.countryName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Country implements Country {
  _Country(
      {this.countryId,
      this.countryCode,
      this.dialCode,
      this.flagCode,
      this.nationality,
      this.countryName});
  factory _Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

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

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountryCopyWith<_Country> get copyWith =>
      __$CountryCopyWithImpl<_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Country &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.flagCode, flagCode) ||
                other.flagCode == flagCode) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, countryId, countryCode, dialCode,
      flagCode, nationality, countryName);

  @override
  String toString() {
    return 'Country(countryId: $countryId, countryCode: $countryCode, dialCode: $dialCode, flagCode: $flagCode, nationality: $nationality, countryName: $countryName)';
  }
}

/// @nodoc
abstract mixin class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) _then) =
      __$CountryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? countryId,
      String? countryCode,
      String? dialCode,
      String? flagCode,
      String? nationality,
      String? countryName});
}

/// @nodoc
class __$CountryCopyWithImpl<$Res> implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(this._self, this._then);

  final _Country _self;
  final $Res Function(_Country) _then;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? countryId = freezed,
    Object? countryCode = freezed,
    Object? dialCode = freezed,
    Object? flagCode = freezed,
    Object? nationality = freezed,
    Object? countryName = freezed,
  }) {
    return _then(_Country(
      countryId: freezed == countryId
          ? _self.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dialCode: freezed == dialCode
          ? _self.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      flagCode: freezed == flagCode
          ? _self.flagCode
          : flagCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _self.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
