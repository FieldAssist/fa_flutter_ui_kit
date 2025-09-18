// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_response_product_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrResponseProductData {
  @JsonKey(name: "product")
  String get product;
  @JsonKey(name: "label")
  String get label;
  @JsonKey(name: "count")
  int get count;
  @JsonKey(name: "id")
  String get id;

  /// Create a copy of IrResponseProductData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrResponseProductDataCopyWith<IrResponseProductData> get copyWith =>
      _$IrResponseProductDataCopyWithImpl<IrResponseProductData>(
          this as IrResponseProductData, _$identity);

  /// Serializes this IrResponseProductData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrResponseProductData &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, label, count, id);

  @override
  String toString() {
    return 'IrResponseProductData(product: $product, label: $label, count: $count, id: $id)';
  }
}

/// @nodoc
abstract mixin class $IrResponseProductDataCopyWith<$Res> {
  factory $IrResponseProductDataCopyWith(IrResponseProductData value,
          $Res Function(IrResponseProductData) _then) =
      _$IrResponseProductDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "product") String product,
      @JsonKey(name: "label") String label,
      @JsonKey(name: "count") int count,
      @JsonKey(name: "id") String id});
}

/// @nodoc
class _$IrResponseProductDataCopyWithImpl<$Res>
    implements $IrResponseProductDataCopyWith<$Res> {
  _$IrResponseProductDataCopyWithImpl(this._self, this._then);

  final IrResponseProductData _self;
  final $Res Function(IrResponseProductData) _then;

  /// Create a copy of IrResponseProductData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? label = null,
    Object? count = null,
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [IrResponseProductData].
extension IrResponseProductDataPatterns on IrResponseProductData {
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
    TResult Function(_IrResponseProductData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrResponseProductData() when $default != null:
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
    TResult Function(_IrResponseProductData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseProductData():
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
    TResult? Function(_IrResponseProductData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseProductData() when $default != null:
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
            @JsonKey(name: "product") String product,
            @JsonKey(name: "label") String label,
            @JsonKey(name: "count") int count,
            @JsonKey(name: "id") String id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrResponseProductData() when $default != null:
        return $default(_that.product, _that.label, _that.count, _that.id);
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
            @JsonKey(name: "product") String product,
            @JsonKey(name: "label") String label,
            @JsonKey(name: "count") int count,
            @JsonKey(name: "id") String id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseProductData():
        return $default(_that.product, _that.label, _that.count, _that.id);
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
            @JsonKey(name: "product") String product,
            @JsonKey(name: "label") String label,
            @JsonKey(name: "count") int count,
            @JsonKey(name: "id") String id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseProductData() when $default != null:
        return $default(_that.product, _that.label, _that.count, _that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrResponseProductData implements IrResponseProductData {
  _IrResponseProductData(
      {@JsonKey(name: "product") this.product = "",
      @JsonKey(name: "label") this.label = "",
      @JsonKey(name: "count") this.count = 0,
      @JsonKey(name: "id") this.id = ""});
  factory _IrResponseProductData.fromJson(Map<String, dynamic> json) =>
      _$IrResponseProductDataFromJson(json);

  @override
  @JsonKey(name: "product")
  final String product;
  @override
  @JsonKey(name: "label")
  final String label;
  @override
  @JsonKey(name: "count")
  final int count;
  @override
  @JsonKey(name: "id")
  final String id;

  /// Create a copy of IrResponseProductData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrResponseProductDataCopyWith<_IrResponseProductData> get copyWith =>
      __$IrResponseProductDataCopyWithImpl<_IrResponseProductData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrResponseProductDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrResponseProductData &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, label, count, id);

  @override
  String toString() {
    return 'IrResponseProductData(product: $product, label: $label, count: $count, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$IrResponseProductDataCopyWith<$Res>
    implements $IrResponseProductDataCopyWith<$Res> {
  factory _$IrResponseProductDataCopyWith(_IrResponseProductData value,
          $Res Function(_IrResponseProductData) _then) =
      __$IrResponseProductDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "product") String product,
      @JsonKey(name: "label") String label,
      @JsonKey(name: "count") int count,
      @JsonKey(name: "id") String id});
}

/// @nodoc
class __$IrResponseProductDataCopyWithImpl<$Res>
    implements _$IrResponseProductDataCopyWith<$Res> {
  __$IrResponseProductDataCopyWithImpl(this._self, this._then);

  final _IrResponseProductData _self;
  final $Res Function(_IrResponseProductData) _then;

  /// Create a copy of IrResponseProductData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
    Object? label = null,
    Object? count = null,
    Object? id = null,
  }) {
    return _then(_IrResponseProductData(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
