// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_grid_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageGridModel {
  @JsonKey(name: "vertical_index")
  int get colIndex;
  @JsonKey(name: "horizontal_index")
  int get rowIndex;
  @JsonKey(name: "localPath")
  String get localPath;

  /// Create a copy of ImageGridModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageGridModelCopyWith<ImageGridModel> get copyWith =>
      _$ImageGridModelCopyWithImpl<ImageGridModel>(
          this as ImageGridModel, _$identity);

  /// Serializes this ImageGridModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageGridModel &&
            (identical(other.colIndex, colIndex) ||
                other.colIndex == colIndex) &&
            (identical(other.rowIndex, rowIndex) ||
                other.rowIndex == rowIndex) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, colIndex, rowIndex, localPath);

  @override
  String toString() {
    return 'ImageGridModel(colIndex: $colIndex, rowIndex: $rowIndex, localPath: $localPath)';
  }
}

/// @nodoc
abstract mixin class $ImageGridModelCopyWith<$Res> {
  factory $ImageGridModelCopyWith(
          ImageGridModel value, $Res Function(ImageGridModel) _then) =
      _$ImageGridModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "vertical_index") int colIndex,
      @JsonKey(name: "horizontal_index") int rowIndex,
      @JsonKey(name: "localPath") String localPath});
}

/// @nodoc
class _$ImageGridModelCopyWithImpl<$Res>
    implements $ImageGridModelCopyWith<$Res> {
  _$ImageGridModelCopyWithImpl(this._self, this._then);

  final ImageGridModel _self;
  final $Res Function(ImageGridModel) _then;

  /// Create a copy of ImageGridModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colIndex = null,
    Object? rowIndex = null,
    Object? localPath = null,
  }) {
    return _then(_self.copyWith(
      colIndex: null == colIndex
          ? _self.colIndex
          : colIndex // ignore: cast_nullable_to_non_nullable
              as int,
      rowIndex: null == rowIndex
          ? _self.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      localPath: null == localPath
          ? _self.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ImageGridModel].
extension ImageGridModelPatterns on ImageGridModel {
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
    TResult Function(_ImageGridModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ImageGridModel() when $default != null:
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
    TResult Function(_ImageGridModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageGridModel():
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
    TResult? Function(_ImageGridModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageGridModel() when $default != null:
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
            @JsonKey(name: "vertical_index") int colIndex,
            @JsonKey(name: "horizontal_index") int rowIndex,
            @JsonKey(name: "localPath") String localPath)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ImageGridModel() when $default != null:
        return $default(_that.colIndex, _that.rowIndex, _that.localPath);
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
            @JsonKey(name: "vertical_index") int colIndex,
            @JsonKey(name: "horizontal_index") int rowIndex,
            @JsonKey(name: "localPath") String localPath)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageGridModel():
        return $default(_that.colIndex, _that.rowIndex, _that.localPath);
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
            @JsonKey(name: "vertical_index") int colIndex,
            @JsonKey(name: "horizontal_index") int rowIndex,
            @JsonKey(name: "localPath") String localPath)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageGridModel() when $default != null:
        return $default(_that.colIndex, _that.rowIndex, _that.localPath);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ImageGridModel implements ImageGridModel {
  _ImageGridModel(
      {@JsonKey(name: "vertical_index") required this.colIndex,
      @JsonKey(name: "horizontal_index") this.rowIndex = 0,
      @JsonKey(name: "localPath") this.localPath = ""});
  factory _ImageGridModel.fromJson(Map<String, dynamic> json) =>
      _$ImageGridModelFromJson(json);

  @override
  @JsonKey(name: "vertical_index")
  final int colIndex;
  @override
  @JsonKey(name: "horizontal_index")
  final int rowIndex;
  @override
  @JsonKey(name: "localPath")
  final String localPath;

  /// Create a copy of ImageGridModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageGridModelCopyWith<_ImageGridModel> get copyWith =>
      __$ImageGridModelCopyWithImpl<_ImageGridModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageGridModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageGridModel &&
            (identical(other.colIndex, colIndex) ||
                other.colIndex == colIndex) &&
            (identical(other.rowIndex, rowIndex) ||
                other.rowIndex == rowIndex) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, colIndex, rowIndex, localPath);

  @override
  String toString() {
    return 'ImageGridModel(colIndex: $colIndex, rowIndex: $rowIndex, localPath: $localPath)';
  }
}

/// @nodoc
abstract mixin class _$ImageGridModelCopyWith<$Res>
    implements $ImageGridModelCopyWith<$Res> {
  factory _$ImageGridModelCopyWith(
          _ImageGridModel value, $Res Function(_ImageGridModel) _then) =
      __$ImageGridModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "vertical_index") int colIndex,
      @JsonKey(name: "horizontal_index") int rowIndex,
      @JsonKey(name: "localPath") String localPath});
}

/// @nodoc
class __$ImageGridModelCopyWithImpl<$Res>
    implements _$ImageGridModelCopyWith<$Res> {
  __$ImageGridModelCopyWithImpl(this._self, this._then);

  final _ImageGridModel _self;
  final $Res Function(_ImageGridModel) _then;

  /// Create a copy of ImageGridModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? colIndex = null,
    Object? rowIndex = null,
    Object? localPath = null,
  }) {
    return _then(_ImageGridModel(
      colIndex: null == colIndex
          ? _self.colIndex
          : colIndex // ignore: cast_nullable_to_non_nullable
              as int,
      rowIndex: null == rowIndex
          ? _self.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      localPath: null == localPath
          ? _self.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
