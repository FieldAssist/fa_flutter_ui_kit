// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_meta_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadMetaDataModel {
  @JsonKey(name: 'Container')
  int get container;
  @JsonKey(name: 'ContentType')
  String get contentType;
  @JsonKey(name: 'FileName')
  String? get fileName;
  @JsonKey(name: 'SessionId')
  String? get sessionId;
  @JsonKey(name: 'AttendanceGuid')
  String? get attendanceGuid;
  @JsonKey(name: 'OutletId')
  String? get outletId;
  @JsonKey(name: 'PromotionalType')
  String? get promotionalType;
  @JsonKey(name: 'EmployeeId')
  String? get employeeId;

  /// Create a copy of UploadMetaDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploadMetaDataModelCopyWith<UploadMetaDataModel> get copyWith =>
      _$UploadMetaDataModelCopyWithImpl<UploadMetaDataModel>(
          this as UploadMetaDataModel, _$identity);

  /// Serializes this UploadMetaDataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploadMetaDataModel &&
            (identical(other.container, container) ||
                other.container == container) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.attendanceGuid, attendanceGuid) ||
                other.attendanceGuid == attendanceGuid) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.promotionalType, promotionalType) ||
                other.promotionalType == promotionalType) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, container, contentType, fileName,
      sessionId, attendanceGuid, outletId, promotionalType, employeeId);

  @override
  String toString() {
    return 'UploadMetaDataModel(container: $container, contentType: $contentType, fileName: $fileName, sessionId: $sessionId, attendanceGuid: $attendanceGuid, outletId: $outletId, promotionalType: $promotionalType, employeeId: $employeeId)';
  }
}

/// @nodoc
abstract mixin class $UploadMetaDataModelCopyWith<$Res> {
  factory $UploadMetaDataModelCopyWith(
          UploadMetaDataModel value, $Res Function(UploadMetaDataModel) _then) =
      _$UploadMetaDataModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Container') int container,
      @JsonKey(name: 'ContentType') String contentType,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'SessionId') String? sessionId,
      @JsonKey(name: 'AttendanceGuid') String? attendanceGuid,
      @JsonKey(name: 'OutletId') String? outletId,
      @JsonKey(name: 'PromotionalType') String? promotionalType,
      @JsonKey(name: 'EmployeeId') String? employeeId});
}

/// @nodoc
class _$UploadMetaDataModelCopyWithImpl<$Res>
    implements $UploadMetaDataModelCopyWith<$Res> {
  _$UploadMetaDataModelCopyWithImpl(this._self, this._then);

  final UploadMetaDataModel _self;
  final $Res Function(UploadMetaDataModel) _then;

  /// Create a copy of UploadMetaDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? container = null,
    Object? contentType = null,
    Object? fileName = freezed,
    Object? sessionId = freezed,
    Object? attendanceGuid = freezed,
    Object? outletId = freezed,
    Object? promotionalType = freezed,
    Object? employeeId = freezed,
  }) {
    return _then(_self.copyWith(
      container: null == container
          ? _self.container
          : container // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: freezed == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceGuid: freezed == attendanceGuid
          ? _self.attendanceGuid
          : attendanceGuid // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: freezed == outletId
          ? _self.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionalType: freezed == promotionalType
          ? _self.promotionalType
          : promotionalType // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _self.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UploadMetaDataModel].
extension UploadMetaDataModelPatterns on UploadMetaDataModel {
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
    TResult Function(_UploadMetaDataModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadMetaDataModel() when $default != null:
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
    TResult Function(_UploadMetaDataModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadMetaDataModel():
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
    TResult? Function(_UploadMetaDataModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadMetaDataModel() when $default != null:
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
            @JsonKey(name: 'Container') int container,
            @JsonKey(name: 'ContentType') String contentType,
            @JsonKey(name: 'FileName') String? fileName,
            @JsonKey(name: 'SessionId') String? sessionId,
            @JsonKey(name: 'AttendanceGuid') String? attendanceGuid,
            @JsonKey(name: 'OutletId') String? outletId,
            @JsonKey(name: 'PromotionalType') String? promotionalType,
            @JsonKey(name: 'EmployeeId') String? employeeId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UploadMetaDataModel() when $default != null:
        return $default(
            _that.container,
            _that.contentType,
            _that.fileName,
            _that.sessionId,
            _that.attendanceGuid,
            _that.outletId,
            _that.promotionalType,
            _that.employeeId);
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
            @JsonKey(name: 'Container') int container,
            @JsonKey(name: 'ContentType') String contentType,
            @JsonKey(name: 'FileName') String? fileName,
            @JsonKey(name: 'SessionId') String? sessionId,
            @JsonKey(name: 'AttendanceGuid') String? attendanceGuid,
            @JsonKey(name: 'OutletId') String? outletId,
            @JsonKey(name: 'PromotionalType') String? promotionalType,
            @JsonKey(name: 'EmployeeId') String? employeeId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadMetaDataModel():
        return $default(
            _that.container,
            _that.contentType,
            _that.fileName,
            _that.sessionId,
            _that.attendanceGuid,
            _that.outletId,
            _that.promotionalType,
            _that.employeeId);
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
            @JsonKey(name: 'Container') int container,
            @JsonKey(name: 'ContentType') String contentType,
            @JsonKey(name: 'FileName') String? fileName,
            @JsonKey(name: 'SessionId') String? sessionId,
            @JsonKey(name: 'AttendanceGuid') String? attendanceGuid,
            @JsonKey(name: 'OutletId') String? outletId,
            @JsonKey(name: 'PromotionalType') String? promotionalType,
            @JsonKey(name: 'EmployeeId') String? employeeId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UploadMetaDataModel() when $default != null:
        return $default(
            _that.container,
            _that.contentType,
            _that.fileName,
            _that.sessionId,
            _that.attendanceGuid,
            _that.outletId,
            _that.promotionalType,
            _that.employeeId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UploadMetaDataModel implements UploadMetaDataModel {
  _UploadMetaDataModel(
      {@JsonKey(name: 'Container') required this.container,
      @JsonKey(name: 'ContentType') required this.contentType,
      @JsonKey(name: 'FileName') this.fileName,
      @JsonKey(name: 'SessionId') this.sessionId,
      @JsonKey(name: 'AttendanceGuid') this.attendanceGuid,
      @JsonKey(name: 'OutletId') this.outletId,
      @JsonKey(name: 'PromotionalType') this.promotionalType,
      @JsonKey(name: 'EmployeeId') this.employeeId});
  factory _UploadMetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$UploadMetaDataModelFromJson(json);

  @override
  @JsonKey(name: 'Container')
  final int container;
  @override
  @JsonKey(name: 'ContentType')
  final String contentType;
  @override
  @JsonKey(name: 'FileName')
  final String? fileName;
  @override
  @JsonKey(name: 'SessionId')
  final String? sessionId;
  @override
  @JsonKey(name: 'AttendanceGuid')
  final String? attendanceGuid;
  @override
  @JsonKey(name: 'OutletId')
  final String? outletId;
  @override
  @JsonKey(name: 'PromotionalType')
  final String? promotionalType;
  @override
  @JsonKey(name: 'EmployeeId')
  final String? employeeId;

  /// Create a copy of UploadMetaDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploadMetaDataModelCopyWith<_UploadMetaDataModel> get copyWith =>
      __$UploadMetaDataModelCopyWithImpl<_UploadMetaDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UploadMetaDataModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadMetaDataModel &&
            (identical(other.container, container) ||
                other.container == container) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.attendanceGuid, attendanceGuid) ||
                other.attendanceGuid == attendanceGuid) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.promotionalType, promotionalType) ||
                other.promotionalType == promotionalType) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, container, contentType, fileName,
      sessionId, attendanceGuid, outletId, promotionalType, employeeId);

  @override
  String toString() {
    return 'UploadMetaDataModel(container: $container, contentType: $contentType, fileName: $fileName, sessionId: $sessionId, attendanceGuid: $attendanceGuid, outletId: $outletId, promotionalType: $promotionalType, employeeId: $employeeId)';
  }
}

/// @nodoc
abstract mixin class _$UploadMetaDataModelCopyWith<$Res>
    implements $UploadMetaDataModelCopyWith<$Res> {
  factory _$UploadMetaDataModelCopyWith(_UploadMetaDataModel value,
          $Res Function(_UploadMetaDataModel) _then) =
      __$UploadMetaDataModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Container') int container,
      @JsonKey(name: 'ContentType') String contentType,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'SessionId') String? sessionId,
      @JsonKey(name: 'AttendanceGuid') String? attendanceGuid,
      @JsonKey(name: 'OutletId') String? outletId,
      @JsonKey(name: 'PromotionalType') String? promotionalType,
      @JsonKey(name: 'EmployeeId') String? employeeId});
}

/// @nodoc
class __$UploadMetaDataModelCopyWithImpl<$Res>
    implements _$UploadMetaDataModelCopyWith<$Res> {
  __$UploadMetaDataModelCopyWithImpl(this._self, this._then);

  final _UploadMetaDataModel _self;
  final $Res Function(_UploadMetaDataModel) _then;

  /// Create a copy of UploadMetaDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? container = null,
    Object? contentType = null,
    Object? fileName = freezed,
    Object? sessionId = freezed,
    Object? attendanceGuid = freezed,
    Object? outletId = freezed,
    Object? promotionalType = freezed,
    Object? employeeId = freezed,
  }) {
    return _then(_UploadMetaDataModel(
      container: null == container
          ? _self.container
          : container // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: freezed == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceGuid: freezed == attendanceGuid
          ? _self.attendanceGuid
          : attendanceGuid // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: freezed == outletId
          ? _self.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionalType: freezed == promotionalType
          ? _self.promotionalType
          : promotionalType // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _self.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
