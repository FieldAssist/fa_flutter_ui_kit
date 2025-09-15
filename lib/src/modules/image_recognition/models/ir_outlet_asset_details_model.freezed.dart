// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_outlet_asset_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrOutletAssetDetailsModel {
  @JsonKey(name: "EquipmentId")
  int get equipmentId;
  @JsonKey(name: "EquipmentName")
  String get equipmentName;
  @JsonKey(name: "Id")
  int get id;
  @JsonKey(name: "AssetDefinitionsId")
  int get assetDefinitionsId;
  @JsonKey(name: "ValueCapacity")
  int get valueCapacity;
  @JsonKey(name: "VolumeCapacity")
  num get volumeCapacity;
  @JsonKey(name: "AssetName")
  String? get assetName;
  @JsonKey(name: "AssetType")
  String? get assetType;
  @JsonKey(name: "AssetReferenceNo")
  String? get assetReferenceNo;
  @JsonKey(name: "AssetState")
  String? get assetState;
  @JsonKey(name: "ImageId")
  String? get imageId;
  @JsonKey(name: "AssetTypeId")
  int? get assetTypeId;
  @JsonKey(name: "beforeAfterStateEnabled")
  bool get beforeAfterStateEnabled;

  /// Create a copy of IrOutletAssetDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrOutletAssetDetailsModelCopyWith<IrOutletAssetDetailsModel> get copyWith =>
      _$IrOutletAssetDetailsModelCopyWithImpl<IrOutletAssetDetailsModel>(
          this as IrOutletAssetDetailsModel, _$identity);

  /// Serializes this IrOutletAssetDetailsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrOutletAssetDetailsModel &&
            (identical(other.equipmentId, equipmentId) ||
                other.equipmentId == equipmentId) &&
            (identical(other.equipmentName, equipmentName) ||
                other.equipmentName == equipmentName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assetDefinitionsId, assetDefinitionsId) ||
                other.assetDefinitionsId == assetDefinitionsId) &&
            (identical(other.valueCapacity, valueCapacity) ||
                other.valueCapacity == valueCapacity) &&
            (identical(other.volumeCapacity, volumeCapacity) ||
                other.volumeCapacity == volumeCapacity) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.assetReferenceNo, assetReferenceNo) ||
                other.assetReferenceNo == assetReferenceNo) &&
            (identical(other.assetState, assetState) ||
                other.assetState == assetState) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.assetTypeId, assetTypeId) ||
                other.assetTypeId == assetTypeId) &&
            (identical(
                    other.beforeAfterStateEnabled, beforeAfterStateEnabled) ||
                other.beforeAfterStateEnabled == beforeAfterStateEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      equipmentId,
      equipmentName,
      id,
      assetDefinitionsId,
      valueCapacity,
      volumeCapacity,
      assetName,
      assetType,
      assetReferenceNo,
      assetState,
      imageId,
      assetTypeId,
      beforeAfterStateEnabled);

  @override
  String toString() {
    return 'IrOutletAssetDetailsModel(equipmentId: $equipmentId, equipmentName: $equipmentName, id: $id, assetDefinitionsId: $assetDefinitionsId, valueCapacity: $valueCapacity, volumeCapacity: $volumeCapacity, assetName: $assetName, assetType: $assetType, assetReferenceNo: $assetReferenceNo, assetState: $assetState, imageId: $imageId, assetTypeId: $assetTypeId, beforeAfterStateEnabled: $beforeAfterStateEnabled)';
  }
}

/// @nodoc
abstract mixin class $IrOutletAssetDetailsModelCopyWith<$Res> {
  factory $IrOutletAssetDetailsModelCopyWith(IrOutletAssetDetailsModel value,
          $Res Function(IrOutletAssetDetailsModel) _then) =
      _$IrOutletAssetDetailsModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "EquipmentId") int equipmentId,
      @JsonKey(name: "EquipmentName") String equipmentName,
      @JsonKey(name: "Id") int id,
      @JsonKey(name: "AssetDefinitionsId") int assetDefinitionsId,
      @JsonKey(name: "ValueCapacity") int valueCapacity,
      @JsonKey(name: "VolumeCapacity") num volumeCapacity,
      @JsonKey(name: "AssetName") String? assetName,
      @JsonKey(name: "AssetType") String? assetType,
      @JsonKey(name: "AssetReferenceNo") String? assetReferenceNo,
      @JsonKey(name: "AssetState") String? assetState,
      @JsonKey(name: "ImageId") String? imageId,
      @JsonKey(name: "AssetTypeId") int? assetTypeId,
      @JsonKey(name: "beforeAfterStateEnabled") bool beforeAfterStateEnabled});
}

/// @nodoc
class _$IrOutletAssetDetailsModelCopyWithImpl<$Res>
    implements $IrOutletAssetDetailsModelCopyWith<$Res> {
  _$IrOutletAssetDetailsModelCopyWithImpl(this._self, this._then);

  final IrOutletAssetDetailsModel _self;
  final $Res Function(IrOutletAssetDetailsModel) _then;

  /// Create a copy of IrOutletAssetDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equipmentId = null,
    Object? equipmentName = null,
    Object? id = null,
    Object? assetDefinitionsId = null,
    Object? valueCapacity = null,
    Object? volumeCapacity = null,
    Object? assetName = freezed,
    Object? assetType = freezed,
    Object? assetReferenceNo = freezed,
    Object? assetState = freezed,
    Object? imageId = freezed,
    Object? assetTypeId = freezed,
    Object? beforeAfterStateEnabled = null,
  }) {
    return _then(_self.copyWith(
      equipmentId: null == equipmentId
          ? _self.equipmentId
          : equipmentId // ignore: cast_nullable_to_non_nullable
              as int,
      equipmentName: null == equipmentName
          ? _self.equipmentName
          : equipmentName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      assetDefinitionsId: null == assetDefinitionsId
          ? _self.assetDefinitionsId
          : assetDefinitionsId // ignore: cast_nullable_to_non_nullable
              as int,
      valueCapacity: null == valueCapacity
          ? _self.valueCapacity
          : valueCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      volumeCapacity: null == volumeCapacity
          ? _self.volumeCapacity
          : volumeCapacity // ignore: cast_nullable_to_non_nullable
              as num,
      assetName: freezed == assetName
          ? _self.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String?,
      assetType: freezed == assetType
          ? _self.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String?,
      assetReferenceNo: freezed == assetReferenceNo
          ? _self.assetReferenceNo
          : assetReferenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      assetState: freezed == assetState
          ? _self.assetState
          : assetState // ignore: cast_nullable_to_non_nullable
              as String?,
      imageId: freezed == imageId
          ? _self.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      assetTypeId: freezed == assetTypeId
          ? _self.assetTypeId
          : assetTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      beforeAfterStateEnabled: null == beforeAfterStateEnabled
          ? _self.beforeAfterStateEnabled
          : beforeAfterStateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [IrOutletAssetDetailsModel].
extension IrOutletAssetDetailsModelPatterns on IrOutletAssetDetailsModel {
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
    TResult Function(_IrOutletAssetDetailsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrOutletAssetDetailsModel() when $default != null:
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
    TResult Function(_IrOutletAssetDetailsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrOutletAssetDetailsModel():
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
    TResult? Function(_IrOutletAssetDetailsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrOutletAssetDetailsModel() when $default != null:
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
            @JsonKey(name: "EquipmentId") int equipmentId,
            @JsonKey(name: "EquipmentName") String equipmentName,
            @JsonKey(name: "Id") int id,
            @JsonKey(name: "AssetDefinitionsId") int assetDefinitionsId,
            @JsonKey(name: "ValueCapacity") int valueCapacity,
            @JsonKey(name: "VolumeCapacity") num volumeCapacity,
            @JsonKey(name: "AssetName") String? assetName,
            @JsonKey(name: "AssetType") String? assetType,
            @JsonKey(name: "AssetReferenceNo") String? assetReferenceNo,
            @JsonKey(name: "AssetState") String? assetState,
            @JsonKey(name: "ImageId") String? imageId,
            @JsonKey(name: "AssetTypeId") int? assetTypeId,
            @JsonKey(name: "beforeAfterStateEnabled")
            bool beforeAfterStateEnabled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrOutletAssetDetailsModel() when $default != null:
        return $default(
            _that.equipmentId,
            _that.equipmentName,
            _that.id,
            _that.assetDefinitionsId,
            _that.valueCapacity,
            _that.volumeCapacity,
            _that.assetName,
            _that.assetType,
            _that.assetReferenceNo,
            _that.assetState,
            _that.imageId,
            _that.assetTypeId,
            _that.beforeAfterStateEnabled);
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
            @JsonKey(name: "EquipmentId") int equipmentId,
            @JsonKey(name: "EquipmentName") String equipmentName,
            @JsonKey(name: "Id") int id,
            @JsonKey(name: "AssetDefinitionsId") int assetDefinitionsId,
            @JsonKey(name: "ValueCapacity") int valueCapacity,
            @JsonKey(name: "VolumeCapacity") num volumeCapacity,
            @JsonKey(name: "AssetName") String? assetName,
            @JsonKey(name: "AssetType") String? assetType,
            @JsonKey(name: "AssetReferenceNo") String? assetReferenceNo,
            @JsonKey(name: "AssetState") String? assetState,
            @JsonKey(name: "ImageId") String? imageId,
            @JsonKey(name: "AssetTypeId") int? assetTypeId,
            @JsonKey(name: "beforeAfterStateEnabled")
            bool beforeAfterStateEnabled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrOutletAssetDetailsModel():
        return $default(
            _that.equipmentId,
            _that.equipmentName,
            _that.id,
            _that.assetDefinitionsId,
            _that.valueCapacity,
            _that.volumeCapacity,
            _that.assetName,
            _that.assetType,
            _that.assetReferenceNo,
            _that.assetState,
            _that.imageId,
            _that.assetTypeId,
            _that.beforeAfterStateEnabled);
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
            @JsonKey(name: "EquipmentId") int equipmentId,
            @JsonKey(name: "EquipmentName") String equipmentName,
            @JsonKey(name: "Id") int id,
            @JsonKey(name: "AssetDefinitionsId") int assetDefinitionsId,
            @JsonKey(name: "ValueCapacity") int valueCapacity,
            @JsonKey(name: "VolumeCapacity") num volumeCapacity,
            @JsonKey(name: "AssetName") String? assetName,
            @JsonKey(name: "AssetType") String? assetType,
            @JsonKey(name: "AssetReferenceNo") String? assetReferenceNo,
            @JsonKey(name: "AssetState") String? assetState,
            @JsonKey(name: "ImageId") String? imageId,
            @JsonKey(name: "AssetTypeId") int? assetTypeId,
            @JsonKey(name: "beforeAfterStateEnabled")
            bool beforeAfterStateEnabled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrOutletAssetDetailsModel() when $default != null:
        return $default(
            _that.equipmentId,
            _that.equipmentName,
            _that.id,
            _that.assetDefinitionsId,
            _that.valueCapacity,
            _that.volumeCapacity,
            _that.assetName,
            _that.assetType,
            _that.assetReferenceNo,
            _that.assetState,
            _that.imageId,
            _that.assetTypeId,
            _that.beforeAfterStateEnabled);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrOutletAssetDetailsModel implements IrOutletAssetDetailsModel {
  _IrOutletAssetDetailsModel(
      {@JsonKey(name: "EquipmentId") required this.equipmentId,
      @JsonKey(name: "EquipmentName") required this.equipmentName,
      @JsonKey(name: "Id") this.id = 0,
      @JsonKey(name: "AssetDefinitionsId") this.assetDefinitionsId = 0,
      @JsonKey(name: "ValueCapacity") this.valueCapacity = 0,
      @JsonKey(name: "VolumeCapacity") this.volumeCapacity = 0,
      @JsonKey(name: "AssetName") this.assetName,
      @JsonKey(name: "AssetType") this.assetType,
      @JsonKey(name: "AssetReferenceNo") this.assetReferenceNo,
      @JsonKey(name: "AssetState") this.assetState,
      @JsonKey(name: "ImageId") this.imageId,
      @JsonKey(name: "AssetTypeId") this.assetTypeId,
      @JsonKey(name: "beforeAfterStateEnabled")
      this.beforeAfterStateEnabled = false});
  factory _IrOutletAssetDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$IrOutletAssetDetailsModelFromJson(json);

  @override
  @JsonKey(name: "EquipmentId")
  final int equipmentId;
  @override
  @JsonKey(name: "EquipmentName")
  final String equipmentName;
  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "AssetDefinitionsId")
  final int assetDefinitionsId;
  @override
  @JsonKey(name: "ValueCapacity")
  final int valueCapacity;
  @override
  @JsonKey(name: "VolumeCapacity")
  final num volumeCapacity;
  @override
  @JsonKey(name: "AssetName")
  final String? assetName;
  @override
  @JsonKey(name: "AssetType")
  final String? assetType;
  @override
  @JsonKey(name: "AssetReferenceNo")
  final String? assetReferenceNo;
  @override
  @JsonKey(name: "AssetState")
  final String? assetState;
  @override
  @JsonKey(name: "ImageId")
  final String? imageId;
  @override
  @JsonKey(name: "AssetTypeId")
  final int? assetTypeId;
  @override
  @JsonKey(name: "beforeAfterStateEnabled")
  final bool beforeAfterStateEnabled;

  /// Create a copy of IrOutletAssetDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrOutletAssetDetailsModelCopyWith<_IrOutletAssetDetailsModel>
      get copyWith =>
          __$IrOutletAssetDetailsModelCopyWithImpl<_IrOutletAssetDetailsModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrOutletAssetDetailsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrOutletAssetDetailsModel &&
            (identical(other.equipmentId, equipmentId) ||
                other.equipmentId == equipmentId) &&
            (identical(other.equipmentName, equipmentName) ||
                other.equipmentName == equipmentName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assetDefinitionsId, assetDefinitionsId) ||
                other.assetDefinitionsId == assetDefinitionsId) &&
            (identical(other.valueCapacity, valueCapacity) ||
                other.valueCapacity == valueCapacity) &&
            (identical(other.volumeCapacity, volumeCapacity) ||
                other.volumeCapacity == volumeCapacity) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.assetReferenceNo, assetReferenceNo) ||
                other.assetReferenceNo == assetReferenceNo) &&
            (identical(other.assetState, assetState) ||
                other.assetState == assetState) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.assetTypeId, assetTypeId) ||
                other.assetTypeId == assetTypeId) &&
            (identical(
                    other.beforeAfterStateEnabled, beforeAfterStateEnabled) ||
                other.beforeAfterStateEnabled == beforeAfterStateEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      equipmentId,
      equipmentName,
      id,
      assetDefinitionsId,
      valueCapacity,
      volumeCapacity,
      assetName,
      assetType,
      assetReferenceNo,
      assetState,
      imageId,
      assetTypeId,
      beforeAfterStateEnabled);

  @override
  String toString() {
    return 'IrOutletAssetDetailsModel(equipmentId: $equipmentId, equipmentName: $equipmentName, id: $id, assetDefinitionsId: $assetDefinitionsId, valueCapacity: $valueCapacity, volumeCapacity: $volumeCapacity, assetName: $assetName, assetType: $assetType, assetReferenceNo: $assetReferenceNo, assetState: $assetState, imageId: $imageId, assetTypeId: $assetTypeId, beforeAfterStateEnabled: $beforeAfterStateEnabled)';
  }
}

/// @nodoc
abstract mixin class _$IrOutletAssetDetailsModelCopyWith<$Res>
    implements $IrOutletAssetDetailsModelCopyWith<$Res> {
  factory _$IrOutletAssetDetailsModelCopyWith(_IrOutletAssetDetailsModel value,
          $Res Function(_IrOutletAssetDetailsModel) _then) =
      __$IrOutletAssetDetailsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "EquipmentId") int equipmentId,
      @JsonKey(name: "EquipmentName") String equipmentName,
      @JsonKey(name: "Id") int id,
      @JsonKey(name: "AssetDefinitionsId") int assetDefinitionsId,
      @JsonKey(name: "ValueCapacity") int valueCapacity,
      @JsonKey(name: "VolumeCapacity") num volumeCapacity,
      @JsonKey(name: "AssetName") String? assetName,
      @JsonKey(name: "AssetType") String? assetType,
      @JsonKey(name: "AssetReferenceNo") String? assetReferenceNo,
      @JsonKey(name: "AssetState") String? assetState,
      @JsonKey(name: "ImageId") String? imageId,
      @JsonKey(name: "AssetTypeId") int? assetTypeId,
      @JsonKey(name: "beforeAfterStateEnabled") bool beforeAfterStateEnabled});
}

/// @nodoc
class __$IrOutletAssetDetailsModelCopyWithImpl<$Res>
    implements _$IrOutletAssetDetailsModelCopyWith<$Res> {
  __$IrOutletAssetDetailsModelCopyWithImpl(this._self, this._then);

  final _IrOutletAssetDetailsModel _self;
  final $Res Function(_IrOutletAssetDetailsModel) _then;

  /// Create a copy of IrOutletAssetDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? equipmentId = null,
    Object? equipmentName = null,
    Object? id = null,
    Object? assetDefinitionsId = null,
    Object? valueCapacity = null,
    Object? volumeCapacity = null,
    Object? assetName = freezed,
    Object? assetType = freezed,
    Object? assetReferenceNo = freezed,
    Object? assetState = freezed,
    Object? imageId = freezed,
    Object? assetTypeId = freezed,
    Object? beforeAfterStateEnabled = null,
  }) {
    return _then(_IrOutletAssetDetailsModel(
      equipmentId: null == equipmentId
          ? _self.equipmentId
          : equipmentId // ignore: cast_nullable_to_non_nullable
              as int,
      equipmentName: null == equipmentName
          ? _self.equipmentName
          : equipmentName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      assetDefinitionsId: null == assetDefinitionsId
          ? _self.assetDefinitionsId
          : assetDefinitionsId // ignore: cast_nullable_to_non_nullable
              as int,
      valueCapacity: null == valueCapacity
          ? _self.valueCapacity
          : valueCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      volumeCapacity: null == volumeCapacity
          ? _self.volumeCapacity
          : volumeCapacity // ignore: cast_nullable_to_non_nullable
              as num,
      assetName: freezed == assetName
          ? _self.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String?,
      assetType: freezed == assetType
          ? _self.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String?,
      assetReferenceNo: freezed == assetReferenceNo
          ? _self.assetReferenceNo
          : assetReferenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      assetState: freezed == assetState
          ? _self.assetState
          : assetState // ignore: cast_nullable_to_non_nullable
              as String?,
      imageId: freezed == imageId
          ? _self.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      assetTypeId: freezed == assetTypeId
          ? _self.assetTypeId
          : assetTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      beforeAfterStateEnabled: null == beforeAfterStateEnabled
          ? _self.beforeAfterStateEnabled
          : beforeAfterStateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
