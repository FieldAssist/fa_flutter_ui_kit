// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_image_quality.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrImageQualityModel {
  @JsonKey(name: 'IsInvalid')
  bool get isInvalid;
  @JsonKey(name: 'Errors')
  List<String>? get errors;

  /// Create a copy of IrImageQualityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrImageQualityModelCopyWith<IrImageQualityModel> get copyWith =>
      _$IrImageQualityModelCopyWithImpl<IrImageQualityModel>(
          this as IrImageQualityModel, _$identity);

  /// Serializes this IrImageQualityModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrImageQualityModel &&
            (identical(other.isInvalid, isInvalid) ||
                other.isInvalid == isInvalid) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, isInvalid, const DeepCollectionEquality().hash(errors));

  @override
  String toString() {
    return 'IrImageQualityModel(isInvalid: $isInvalid, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $IrImageQualityModelCopyWith<$Res> {
  factory $IrImageQualityModelCopyWith(
          IrImageQualityModel value, $Res Function(IrImageQualityModel) _then) =
      _$IrImageQualityModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'IsInvalid') bool isInvalid,
      @JsonKey(name: 'Errors') List<String>? errors});
}

/// @nodoc
class _$IrImageQualityModelCopyWithImpl<$Res>
    implements $IrImageQualityModelCopyWith<$Res> {
  _$IrImageQualityModelCopyWithImpl(this._self, this._then);

  final IrImageQualityModel _self;
  final $Res Function(IrImageQualityModel) _then;

  /// Create a copy of IrImageQualityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInvalid = null,
    Object? errors = freezed,
  }) {
    return _then(_self.copyWith(
      isInvalid: null == isInvalid
          ? _self.isInvalid
          : isInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      errors: freezed == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [IrImageQualityModel].
extension IrImageQualityModelPatterns on IrImageQualityModel {
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
    TResult Function(_IrImageQualityModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrImageQualityModel() when $default != null:
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
    TResult Function(_IrImageQualityModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrImageQualityModel():
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
    TResult? Function(_IrImageQualityModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrImageQualityModel() when $default != null:
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
    TResult Function(@JsonKey(name: 'IsInvalid') bool isInvalid,
            @JsonKey(name: 'Errors') List<String>? errors)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrImageQualityModel() when $default != null:
        return $default(_that.isInvalid, _that.errors);
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
    TResult Function(@JsonKey(name: 'IsInvalid') bool isInvalid,
            @JsonKey(name: 'Errors') List<String>? errors)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrImageQualityModel():
        return $default(_that.isInvalid, _that.errors);
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
    TResult? Function(@JsonKey(name: 'IsInvalid') bool isInvalid,
            @JsonKey(name: 'Errors') List<String>? errors)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrImageQualityModel() when $default != null:
        return $default(_that.isInvalid, _that.errors);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrImageQualityModel implements IrImageQualityModel {
  _IrImageQualityModel(
      {@JsonKey(name: 'IsInvalid') this.isInvalid = false,
      @JsonKey(name: 'Errors') final List<String>? errors})
      : _errors = errors;
  factory _IrImageQualityModel.fromJson(Map<String, dynamic> json) =>
      _$IrImageQualityModelFromJson(json);

  @override
  @JsonKey(name: 'IsInvalid')
  final bool isInvalid;
  final List<String>? _errors;
  @override
  @JsonKey(name: 'Errors')
  List<String>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of IrImageQualityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrImageQualityModelCopyWith<_IrImageQualityModel> get copyWith =>
      __$IrImageQualityModelCopyWithImpl<_IrImageQualityModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrImageQualityModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrImageQualityModel &&
            (identical(other.isInvalid, isInvalid) ||
                other.isInvalid == isInvalid) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, isInvalid, const DeepCollectionEquality().hash(_errors));

  @override
  String toString() {
    return 'IrImageQualityModel(isInvalid: $isInvalid, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$IrImageQualityModelCopyWith<$Res>
    implements $IrImageQualityModelCopyWith<$Res> {
  factory _$IrImageQualityModelCopyWith(_IrImageQualityModel value,
          $Res Function(_IrImageQualityModel) _then) =
      __$IrImageQualityModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'IsInvalid') bool isInvalid,
      @JsonKey(name: 'Errors') List<String>? errors});
}

/// @nodoc
class __$IrImageQualityModelCopyWithImpl<$Res>
    implements _$IrImageQualityModelCopyWith<$Res> {
  __$IrImageQualityModelCopyWithImpl(this._self, this._then);

  final _IrImageQualityModel _self;
  final $Res Function(_IrImageQualityModel) _then;

  /// Create a copy of IrImageQualityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isInvalid = null,
    Object? errors = freezed,
  }) {
    return _then(_IrImageQualityModel(
      isInvalid: null == isInvalid
          ? _self.isInvalid
          : isInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      errors: freezed == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
