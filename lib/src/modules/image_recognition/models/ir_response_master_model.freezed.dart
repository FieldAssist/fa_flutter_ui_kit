// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_response_master_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrResponseMasterModel {
  @JsonKey(name: "Success")
  bool get success;
  @JsonKey(name: "Data")
  IrResponseModel? get irResponseMasterModel;

  /// Create a copy of IrResponseMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrResponseMasterModelCopyWith<IrResponseMasterModel> get copyWith =>
      _$IrResponseMasterModelCopyWithImpl<IrResponseMasterModel>(
          this as IrResponseMasterModel, _$identity);

  /// Serializes this IrResponseMasterModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrResponseMasterModel &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.irResponseMasterModel, irResponseMasterModel) ||
                other.irResponseMasterModel == irResponseMasterModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, irResponseMasterModel);

  @override
  String toString() {
    return 'IrResponseMasterModel(success: $success, irResponseMasterModel: $irResponseMasterModel)';
  }
}

/// @nodoc
abstract mixin class $IrResponseMasterModelCopyWith<$Res> {
  factory $IrResponseMasterModelCopyWith(IrResponseMasterModel value,
          $Res Function(IrResponseMasterModel) _then) =
      _$IrResponseMasterModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "Success") bool success,
      @JsonKey(name: "Data") IrResponseModel? irResponseMasterModel});

  $IrResponseModelCopyWith<$Res>? get irResponseMasterModel;
}

/// @nodoc
class _$IrResponseMasterModelCopyWithImpl<$Res>
    implements $IrResponseMasterModelCopyWith<$Res> {
  _$IrResponseMasterModelCopyWithImpl(this._self, this._then);

  final IrResponseMasterModel _self;
  final $Res Function(IrResponseMasterModel) _then;

  /// Create a copy of IrResponseMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? irResponseMasterModel = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      irResponseMasterModel: freezed == irResponseMasterModel
          ? _self.irResponseMasterModel
          : irResponseMasterModel // ignore: cast_nullable_to_non_nullable
              as IrResponseModel?,
    ));
  }

  /// Create a copy of IrResponseMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IrResponseModelCopyWith<$Res>? get irResponseMasterModel {
    if (_self.irResponseMasterModel == null) {
      return null;
    }

    return $IrResponseModelCopyWith<$Res>(_self.irResponseMasterModel!,
        (value) {
      return _then(_self.copyWith(irResponseMasterModel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [IrResponseMasterModel].
extension IrResponseMasterModelPatterns on IrResponseMasterModel {
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
    TResult Function(_IrResponseMasterModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrResponseMasterModel() when $default != null:
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
    TResult Function(_IrResponseMasterModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseMasterModel():
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
    TResult? Function(_IrResponseMasterModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseMasterModel() when $default != null:
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
    TResult Function(@JsonKey(name: "Success") bool success,
            @JsonKey(name: "Data") IrResponseModel? irResponseMasterModel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrResponseMasterModel() when $default != null:
        return $default(_that.success, _that.irResponseMasterModel);
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
    TResult Function(@JsonKey(name: "Success") bool success,
            @JsonKey(name: "Data") IrResponseModel? irResponseMasterModel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseMasterModel():
        return $default(_that.success, _that.irResponseMasterModel);
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
    TResult? Function(@JsonKey(name: "Success") bool success,
            @JsonKey(name: "Data") IrResponseModel? irResponseMasterModel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseMasterModel() when $default != null:
        return $default(_that.success, _that.irResponseMasterModel);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrResponseMasterModel implements IrResponseMasterModel {
  _IrResponseMasterModel(
      {@JsonKey(name: "Success") this.success = false,
      @JsonKey(name: "Data") this.irResponseMasterModel});
  factory _IrResponseMasterModel.fromJson(Map<String, dynamic> json) =>
      _$IrResponseMasterModelFromJson(json);

  @override
  @JsonKey(name: "Success")
  final bool success;
  @override
  @JsonKey(name: "Data")
  final IrResponseModel? irResponseMasterModel;

  /// Create a copy of IrResponseMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrResponseMasterModelCopyWith<_IrResponseMasterModel> get copyWith =>
      __$IrResponseMasterModelCopyWithImpl<_IrResponseMasterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrResponseMasterModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrResponseMasterModel &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.irResponseMasterModel, irResponseMasterModel) ||
                other.irResponseMasterModel == irResponseMasterModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, irResponseMasterModel);

  @override
  String toString() {
    return 'IrResponseMasterModel(success: $success, irResponseMasterModel: $irResponseMasterModel)';
  }
}

/// @nodoc
abstract mixin class _$IrResponseMasterModelCopyWith<$Res>
    implements $IrResponseMasterModelCopyWith<$Res> {
  factory _$IrResponseMasterModelCopyWith(_IrResponseMasterModel value,
          $Res Function(_IrResponseMasterModel) _then) =
      __$IrResponseMasterModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Success") bool success,
      @JsonKey(name: "Data") IrResponseModel? irResponseMasterModel});

  @override
  $IrResponseModelCopyWith<$Res>? get irResponseMasterModel;
}

/// @nodoc
class __$IrResponseMasterModelCopyWithImpl<$Res>
    implements _$IrResponseMasterModelCopyWith<$Res> {
  __$IrResponseMasterModelCopyWithImpl(this._self, this._then);

  final _IrResponseMasterModel _self;
  final $Res Function(_IrResponseMasterModel) _then;

  /// Create a copy of IrResponseMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? irResponseMasterModel = freezed,
  }) {
    return _then(_IrResponseMasterModel(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      irResponseMasterModel: freezed == irResponseMasterModel
          ? _self.irResponseMasterModel
          : irResponseMasterModel // ignore: cast_nullable_to_non_nullable
              as IrResponseModel?,
    ));
  }

  /// Create a copy of IrResponseMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IrResponseModelCopyWith<$Res>? get irResponseMasterModel {
    if (_self.irResponseMasterModel == null) {
      return null;
    }

    return $IrResponseModelCopyWith<$Res>(_self.irResponseMasterModel!,
        (value) {
      return _then(_self.copyWith(irResponseMasterModel: value));
    });
  }
}

// dart format on
