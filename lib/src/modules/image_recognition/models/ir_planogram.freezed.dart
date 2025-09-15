// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_planogram.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrPlanogram {
  @JsonKey(name: "PlanogramRackOutputImage")
  String? get planogramRackOutputImage;
  @JsonKey(name: "PlanogramSkuOutputImage")
  String? get planogramSkuOutputImage;
  @JsonKey(name: "PlanogramIssues")
  List<String>? get planogramIssues;
  @JsonKey(name: "Compliance_Percentange")
  double? get compliancePercentage;
  @JsonKey(name: "Compliance_Status")
  String? get complianceStatus;

  /// Create a copy of IrPlanogram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrPlanogramCopyWith<IrPlanogram> get copyWith =>
      _$IrPlanogramCopyWithImpl<IrPlanogram>(this as IrPlanogram, _$identity);

  /// Serializes this IrPlanogram to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrPlanogram &&
            (identical(
                    other.planogramRackOutputImage, planogramRackOutputImage) ||
                other.planogramRackOutputImage == planogramRackOutputImage) &&
            (identical(
                    other.planogramSkuOutputImage, planogramSkuOutputImage) ||
                other.planogramSkuOutputImage == planogramSkuOutputImage) &&
            const DeepCollectionEquality()
                .equals(other.planogramIssues, planogramIssues) &&
            (identical(other.compliancePercentage, compliancePercentage) ||
                other.compliancePercentage == compliancePercentage) &&
            (identical(other.complianceStatus, complianceStatus) ||
                other.complianceStatus == complianceStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      planogramRackOutputImage,
      planogramSkuOutputImage,
      const DeepCollectionEquality().hash(planogramIssues),
      compliancePercentage,
      complianceStatus);

  @override
  String toString() {
    return 'IrPlanogram(planogramRackOutputImage: $planogramRackOutputImage, planogramSkuOutputImage: $planogramSkuOutputImage, planogramIssues: $planogramIssues, compliancePercentage: $compliancePercentage, complianceStatus: $complianceStatus)';
  }
}

/// @nodoc
abstract mixin class $IrPlanogramCopyWith<$Res> {
  factory $IrPlanogramCopyWith(
          IrPlanogram value, $Res Function(IrPlanogram) _then) =
      _$IrPlanogramCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "PlanogramRackOutputImage")
      String? planogramRackOutputImage,
      @JsonKey(name: "PlanogramSkuOutputImage") String? planogramSkuOutputImage,
      @JsonKey(name: "PlanogramIssues") List<String>? planogramIssues,
      @JsonKey(name: "Compliance_Percentange") double? compliancePercentage,
      @JsonKey(name: "Compliance_Status") String? complianceStatus});
}

/// @nodoc
class _$IrPlanogramCopyWithImpl<$Res> implements $IrPlanogramCopyWith<$Res> {
  _$IrPlanogramCopyWithImpl(this._self, this._then);

  final IrPlanogram _self;
  final $Res Function(IrPlanogram) _then;

  /// Create a copy of IrPlanogram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planogramRackOutputImage = freezed,
    Object? planogramSkuOutputImage = freezed,
    Object? planogramIssues = freezed,
    Object? compliancePercentage = freezed,
    Object? complianceStatus = freezed,
  }) {
    return _then(_self.copyWith(
      planogramRackOutputImage: freezed == planogramRackOutputImage
          ? _self.planogramRackOutputImage
          : planogramRackOutputImage // ignore: cast_nullable_to_non_nullable
              as String?,
      planogramSkuOutputImage: freezed == planogramSkuOutputImage
          ? _self.planogramSkuOutputImage
          : planogramSkuOutputImage // ignore: cast_nullable_to_non_nullable
              as String?,
      planogramIssues: freezed == planogramIssues
          ? _self.planogramIssues
          : planogramIssues // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      compliancePercentage: freezed == compliancePercentage
          ? _self.compliancePercentage
          : compliancePercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      complianceStatus: freezed == complianceStatus
          ? _self.complianceStatus
          : complianceStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [IrPlanogram].
extension IrPlanogramPatterns on IrPlanogram {
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
    TResult Function(_IrPlanogram value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrPlanogram() when $default != null:
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
    TResult Function(_IrPlanogram value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrPlanogram():
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
    TResult? Function(_IrPlanogram value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrPlanogram() when $default != null:
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
            @JsonKey(name: "PlanogramRackOutputImage")
            String? planogramRackOutputImage,
            @JsonKey(name: "PlanogramSkuOutputImage")
            String? planogramSkuOutputImage,
            @JsonKey(name: "PlanogramIssues") List<String>? planogramIssues,
            @JsonKey(name: "Compliance_Percentange")
            double? compliancePercentage,
            @JsonKey(name: "Compliance_Status") String? complianceStatus)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrPlanogram() when $default != null:
        return $default(
            _that.planogramRackOutputImage,
            _that.planogramSkuOutputImage,
            _that.planogramIssues,
            _that.compliancePercentage,
            _that.complianceStatus);
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
            @JsonKey(name: "PlanogramRackOutputImage")
            String? planogramRackOutputImage,
            @JsonKey(name: "PlanogramSkuOutputImage")
            String? planogramSkuOutputImage,
            @JsonKey(name: "PlanogramIssues") List<String>? planogramIssues,
            @JsonKey(name: "Compliance_Percentange")
            double? compliancePercentage,
            @JsonKey(name: "Compliance_Status") String? complianceStatus)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrPlanogram():
        return $default(
            _that.planogramRackOutputImage,
            _that.planogramSkuOutputImage,
            _that.planogramIssues,
            _that.compliancePercentage,
            _that.complianceStatus);
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
            @JsonKey(name: "PlanogramRackOutputImage")
            String? planogramRackOutputImage,
            @JsonKey(name: "PlanogramSkuOutputImage")
            String? planogramSkuOutputImage,
            @JsonKey(name: "PlanogramIssues") List<String>? planogramIssues,
            @JsonKey(name: "Compliance_Percentange")
            double? compliancePercentage,
            @JsonKey(name: "Compliance_Status") String? complianceStatus)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrPlanogram() when $default != null:
        return $default(
            _that.planogramRackOutputImage,
            _that.planogramSkuOutputImage,
            _that.planogramIssues,
            _that.compliancePercentage,
            _that.complianceStatus);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrPlanogram implements IrPlanogram {
  _IrPlanogram(
      {@JsonKey(name: "PlanogramRackOutputImage") this.planogramRackOutputImage,
      @JsonKey(name: "PlanogramSkuOutputImage") this.planogramSkuOutputImage,
      @JsonKey(name: "PlanogramIssues") final List<String>? planogramIssues,
      @JsonKey(name: "Compliance_Percentange") this.compliancePercentage,
      @JsonKey(name: "Compliance_Status") this.complianceStatus})
      : _planogramIssues = planogramIssues;
  factory _IrPlanogram.fromJson(Map<String, dynamic> json) =>
      _$IrPlanogramFromJson(json);

  @override
  @JsonKey(name: "PlanogramRackOutputImage")
  final String? planogramRackOutputImage;
  @override
  @JsonKey(name: "PlanogramSkuOutputImage")
  final String? planogramSkuOutputImage;
  final List<String>? _planogramIssues;
  @override
  @JsonKey(name: "PlanogramIssues")
  List<String>? get planogramIssues {
    final value = _planogramIssues;
    if (value == null) return null;
    if (_planogramIssues is EqualUnmodifiableListView) return _planogramIssues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "Compliance_Percentange")
  final double? compliancePercentage;
  @override
  @JsonKey(name: "Compliance_Status")
  final String? complianceStatus;

  /// Create a copy of IrPlanogram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrPlanogramCopyWith<_IrPlanogram> get copyWith =>
      __$IrPlanogramCopyWithImpl<_IrPlanogram>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrPlanogramToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrPlanogram &&
            (identical(
                    other.planogramRackOutputImage, planogramRackOutputImage) ||
                other.planogramRackOutputImage == planogramRackOutputImage) &&
            (identical(
                    other.planogramSkuOutputImage, planogramSkuOutputImage) ||
                other.planogramSkuOutputImage == planogramSkuOutputImage) &&
            const DeepCollectionEquality()
                .equals(other._planogramIssues, _planogramIssues) &&
            (identical(other.compliancePercentage, compliancePercentage) ||
                other.compliancePercentage == compliancePercentage) &&
            (identical(other.complianceStatus, complianceStatus) ||
                other.complianceStatus == complianceStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      planogramRackOutputImage,
      planogramSkuOutputImage,
      const DeepCollectionEquality().hash(_planogramIssues),
      compliancePercentage,
      complianceStatus);

  @override
  String toString() {
    return 'IrPlanogram(planogramRackOutputImage: $planogramRackOutputImage, planogramSkuOutputImage: $planogramSkuOutputImage, planogramIssues: $planogramIssues, compliancePercentage: $compliancePercentage, complianceStatus: $complianceStatus)';
  }
}

/// @nodoc
abstract mixin class _$IrPlanogramCopyWith<$Res>
    implements $IrPlanogramCopyWith<$Res> {
  factory _$IrPlanogramCopyWith(
          _IrPlanogram value, $Res Function(_IrPlanogram) _then) =
      __$IrPlanogramCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "PlanogramRackOutputImage")
      String? planogramRackOutputImage,
      @JsonKey(name: "PlanogramSkuOutputImage") String? planogramSkuOutputImage,
      @JsonKey(name: "PlanogramIssues") List<String>? planogramIssues,
      @JsonKey(name: "Compliance_Percentange") double? compliancePercentage,
      @JsonKey(name: "Compliance_Status") String? complianceStatus});
}

/// @nodoc
class __$IrPlanogramCopyWithImpl<$Res> implements _$IrPlanogramCopyWith<$Res> {
  __$IrPlanogramCopyWithImpl(this._self, this._then);

  final _IrPlanogram _self;
  final $Res Function(_IrPlanogram) _then;

  /// Create a copy of IrPlanogram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? planogramRackOutputImage = freezed,
    Object? planogramSkuOutputImage = freezed,
    Object? planogramIssues = freezed,
    Object? compliancePercentage = freezed,
    Object? complianceStatus = freezed,
  }) {
    return _then(_IrPlanogram(
      planogramRackOutputImage: freezed == planogramRackOutputImage
          ? _self.planogramRackOutputImage
          : planogramRackOutputImage // ignore: cast_nullable_to_non_nullable
              as String?,
      planogramSkuOutputImage: freezed == planogramSkuOutputImage
          ? _self.planogramSkuOutputImage
          : planogramSkuOutputImage // ignore: cast_nullable_to_non_nullable
              as String?,
      planogramIssues: freezed == planogramIssues
          ? _self._planogramIssues
          : planogramIssues // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      compliancePercentage: freezed == compliancePercentage
          ? _self.compliancePercentage
          : compliancePercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      complianceStatus: freezed == complianceStatus
          ? _self.complianceStatus
          : complianceStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
