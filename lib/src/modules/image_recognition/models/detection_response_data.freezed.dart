// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detection_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetectionResponseData {
  @JsonKey(name: "Success")
  bool get success;
  @JsonKey(name: "Data")
  String get data;
  @JsonKey(name: "Message")
  String get message;

  /// Create a copy of DetectionResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetectionResponseDataCopyWith<DetectionResponseData> get copyWith =>
      _$DetectionResponseDataCopyWithImpl<DetectionResponseData>(
          this as DetectionResponseData, _$identity);

  /// Serializes this DetectionResponseData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetectionResponseData &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  @override
  String toString() {
    return 'DetectionResponseData(success: $success, data: $data, message: $message)';
  }
}

/// @nodoc
abstract mixin class $DetectionResponseDataCopyWith<$Res> {
  factory $DetectionResponseDataCopyWith(DetectionResponseData value,
          $Res Function(DetectionResponseData) _then) =
      _$DetectionResponseDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "Success") bool success,
      @JsonKey(name: "Data") String data,
      @JsonKey(name: "Message") String message});
}

/// @nodoc
class _$DetectionResponseDataCopyWithImpl<$Res>
    implements $DetectionResponseDataCopyWith<$Res> {
  _$DetectionResponseDataCopyWithImpl(this._self, this._then);

  final DetectionResponseData _self;
  final $Res Function(DetectionResponseData) _then;

  /// Create a copy of DetectionResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DetectionResponseData].
extension DetectionResponseDataPatterns on DetectionResponseData {
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
    TResult Function(_DetectionResponseData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DetectionResponseData() when $default != null:
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
    TResult Function(_DetectionResponseData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DetectionResponseData():
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
    TResult? Function(_DetectionResponseData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DetectionResponseData() when $default != null:
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
            @JsonKey(name: "Success") bool success,
            @JsonKey(name: "Data") String data,
            @JsonKey(name: "Message") String message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DetectionResponseData() when $default != null:
        return $default(_that.success, _that.data, _that.message);
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
            @JsonKey(name: "Success") bool success,
            @JsonKey(name: "Data") String data,
            @JsonKey(name: "Message") String message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DetectionResponseData():
        return $default(_that.success, _that.data, _that.message);
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
            @JsonKey(name: "Success") bool success,
            @JsonKey(name: "Data") String data,
            @JsonKey(name: "Message") String message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DetectionResponseData() when $default != null:
        return $default(_that.success, _that.data, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DetectionResponseData implements DetectionResponseData {
  _DetectionResponseData(
      {@JsonKey(name: "Success") this.success = false,
      @JsonKey(name: "Data") this.data = "",
      @JsonKey(name: "Message") this.message = ""});
  factory _DetectionResponseData.fromJson(Map<String, dynamic> json) =>
      _$DetectionResponseDataFromJson(json);

  @override
  @JsonKey(name: "Success")
  final bool success;
  @override
  @JsonKey(name: "Data")
  final String data;
  @override
  @JsonKey(name: "Message")
  final String message;

  /// Create a copy of DetectionResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DetectionResponseDataCopyWith<_DetectionResponseData> get copyWith =>
      __$DetectionResponseDataCopyWithImpl<_DetectionResponseData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DetectionResponseDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetectionResponseData &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  @override
  String toString() {
    return 'DetectionResponseData(success: $success, data: $data, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$DetectionResponseDataCopyWith<$Res>
    implements $DetectionResponseDataCopyWith<$Res> {
  factory _$DetectionResponseDataCopyWith(_DetectionResponseData value,
          $Res Function(_DetectionResponseData) _then) =
      __$DetectionResponseDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Success") bool success,
      @JsonKey(name: "Data") String data,
      @JsonKey(name: "Message") String message});
}

/// @nodoc
class __$DetectionResponseDataCopyWithImpl<$Res>
    implements _$DetectionResponseDataCopyWith<$Res> {
  __$DetectionResponseDataCopyWithImpl(this._self, this._then);

  final _DetectionResponseData _self;
  final $Res Function(_DetectionResponseData) _then;

  /// Create a copy of DetectionResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = null,
  }) {
    return _then(_DetectionResponseData(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
