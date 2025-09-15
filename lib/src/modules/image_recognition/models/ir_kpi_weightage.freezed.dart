// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_kpi_weightage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrKpiWeightage {
  @JsonKey(
      name: 'kpiEnum', fromJson: irKpiEnumFromJson, toJson: irKpiEnumToJson)
  IrKpiEnum? get kpiEnum;
  @JsonKey(name: "result")
  double? get result;
  @JsonKey(name: "calResult")
  double? get calResult;

  /// Create a copy of IrKpiWeightage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrKpiWeightageCopyWith<IrKpiWeightage> get copyWith =>
      _$IrKpiWeightageCopyWithImpl<IrKpiWeightage>(
          this as IrKpiWeightage, _$identity);

  /// Serializes this IrKpiWeightage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrKpiWeightage &&
            (identical(other.kpiEnum, kpiEnum) || other.kpiEnum == kpiEnum) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.calResult, calResult) ||
                other.calResult == calResult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kpiEnum, result, calResult);

  @override
  String toString() {
    return 'IrKpiWeightage(kpiEnum: $kpiEnum, result: $result, calResult: $calResult)';
  }
}

/// @nodoc
abstract mixin class $IrKpiWeightageCopyWith<$Res> {
  factory $IrKpiWeightageCopyWith(
          IrKpiWeightage value, $Res Function(IrKpiWeightage) _then) =
      _$IrKpiWeightageCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'kpiEnum', fromJson: irKpiEnumFromJson, toJson: irKpiEnumToJson)
      IrKpiEnum? kpiEnum,
      @JsonKey(name: "result") double? result,
      @JsonKey(name: "calResult") double? calResult});
}

/// @nodoc
class _$IrKpiWeightageCopyWithImpl<$Res>
    implements $IrKpiWeightageCopyWith<$Res> {
  _$IrKpiWeightageCopyWithImpl(this._self, this._then);

  final IrKpiWeightage _self;
  final $Res Function(IrKpiWeightage) _then;

  /// Create a copy of IrKpiWeightage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kpiEnum = freezed,
    Object? result = freezed,
    Object? calResult = freezed,
  }) {
    return _then(_self.copyWith(
      kpiEnum: freezed == kpiEnum
          ? _self.kpiEnum
          : kpiEnum // ignore: cast_nullable_to_non_nullable
              as IrKpiEnum?,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as double?,
      calResult: freezed == calResult
          ? _self.calResult
          : calResult // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [IrKpiWeightage].
extension IrKpiWeightagePatterns on IrKpiWeightage {
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
    TResult Function(_IrKpiWeightage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrKpiWeightage() when $default != null:
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
    TResult Function(_IrKpiWeightage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrKpiWeightage():
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
    TResult? Function(_IrKpiWeightage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrKpiWeightage() when $default != null:
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
            @JsonKey(
                name: 'kpiEnum',
                fromJson: irKpiEnumFromJson,
                toJson: irKpiEnumToJson)
            IrKpiEnum? kpiEnum,
            @JsonKey(name: "result") double? result,
            @JsonKey(name: "calResult") double? calResult)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrKpiWeightage() when $default != null:
        return $default(_that.kpiEnum, _that.result, _that.calResult);
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
            @JsonKey(
                name: 'kpiEnum',
                fromJson: irKpiEnumFromJson,
                toJson: irKpiEnumToJson)
            IrKpiEnum? kpiEnum,
            @JsonKey(name: "result") double? result,
            @JsonKey(name: "calResult") double? calResult)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrKpiWeightage():
        return $default(_that.kpiEnum, _that.result, _that.calResult);
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
            @JsonKey(
                name: 'kpiEnum',
                fromJson: irKpiEnumFromJson,
                toJson: irKpiEnumToJson)
            IrKpiEnum? kpiEnum,
            @JsonKey(name: "result") double? result,
            @JsonKey(name: "calResult") double? calResult)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrKpiWeightage() when $default != null:
        return $default(_that.kpiEnum, _that.result, _that.calResult);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrKpiWeightage implements IrKpiWeightage {
  _IrKpiWeightage(
      {@JsonKey(
          name: 'kpiEnum', fromJson: irKpiEnumFromJson, toJson: irKpiEnumToJson)
      this.kpiEnum,
      @JsonKey(name: "result") this.result,
      @JsonKey(name: "calResult") this.calResult});
  factory _IrKpiWeightage.fromJson(Map<String, dynamic> json) =>
      _$IrKpiWeightageFromJson(json);

  @override
  @JsonKey(
      name: 'kpiEnum', fromJson: irKpiEnumFromJson, toJson: irKpiEnumToJson)
  final IrKpiEnum? kpiEnum;
  @override
  @JsonKey(name: "result")
  final double? result;
  @override
  @JsonKey(name: "calResult")
  final double? calResult;

  /// Create a copy of IrKpiWeightage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrKpiWeightageCopyWith<_IrKpiWeightage> get copyWith =>
      __$IrKpiWeightageCopyWithImpl<_IrKpiWeightage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrKpiWeightageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrKpiWeightage &&
            (identical(other.kpiEnum, kpiEnum) || other.kpiEnum == kpiEnum) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.calResult, calResult) ||
                other.calResult == calResult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kpiEnum, result, calResult);

  @override
  String toString() {
    return 'IrKpiWeightage(kpiEnum: $kpiEnum, result: $result, calResult: $calResult)';
  }
}

/// @nodoc
abstract mixin class _$IrKpiWeightageCopyWith<$Res>
    implements $IrKpiWeightageCopyWith<$Res> {
  factory _$IrKpiWeightageCopyWith(
          _IrKpiWeightage value, $Res Function(_IrKpiWeightage) _then) =
      __$IrKpiWeightageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'kpiEnum', fromJson: irKpiEnumFromJson, toJson: irKpiEnumToJson)
      IrKpiEnum? kpiEnum,
      @JsonKey(name: "result") double? result,
      @JsonKey(name: "calResult") double? calResult});
}

/// @nodoc
class __$IrKpiWeightageCopyWithImpl<$Res>
    implements _$IrKpiWeightageCopyWith<$Res> {
  __$IrKpiWeightageCopyWithImpl(this._self, this._then);

  final _IrKpiWeightage _self;
  final $Res Function(_IrKpiWeightage) _then;

  /// Create a copy of IrKpiWeightage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kpiEnum = freezed,
    Object? result = freezed,
    Object? calResult = freezed,
  }) {
    return _then(_IrKpiWeightage(
      kpiEnum: freezed == kpiEnum
          ? _self.kpiEnum
          : kpiEnum // ignore: cast_nullable_to_non_nullable
              as IrKpiEnum?,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as double?,
      calResult: freezed == calResult
          ? _self.calResult
          : calResult // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
