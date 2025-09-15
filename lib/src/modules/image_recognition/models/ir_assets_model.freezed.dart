// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_assets_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrAssetsModel {
  @JsonKey(name: "Id")
  int get id;
  @JsonKey(name: "CompanyId")
  int get companyId;
  @JsonKey(name: "IsActive")
  bool get isActive;
  @JsonKey(name: "Name")
  String get name;
  @JsonKey(name: "AssetType")
  String get assetType;
  @JsonKey(name: "ValueCapacity")
  int get valueCapacity;
  @JsonKey(name: "VolumeCapacity")
  num get volumeCapacity;
  @JsonKey(name: "ShortName")
  String? get shortName;
  @JsonKey(name: "ValidationRegex")
  String? get validationRegex;
  @JsonKey(name: "EntityType")
  int? get entityType;
  @JsonKey(name: "EntityIds")
  String? get entityIds;
  @JsonKey(name: "IsIRAsset")
  bool get isIRAsset;
  @JsonKey(name: "IsAssetRefNoScannable")
  bool get isAssetRefNoScannable;
  @JsonKey(name: "AssetTypeId")
  int? get assetTypeId;
  @JsonKey(name: "IsOutletAsset")
  bool get isOutletAsset;
  @JsonKey(name: "app_specific_beforeStateEnabledForAsset")
  bool? get beforeAfterStateEnabled;
  @JsonKey(name: "app_specific_instanceNumber")
  int get instanceNumber;
  @JsonKey(name: "MappedEquipments")
  List<IrOutletAssetDetailsModel>? get mappedEquipments;

  /// Create a copy of IrAssetsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrAssetsModelCopyWith<IrAssetsModel> get copyWith =>
      _$IrAssetsModelCopyWithImpl<IrAssetsModel>(
          this as IrAssetsModel, _$identity);

  /// Serializes this IrAssetsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrAssetsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.valueCapacity, valueCapacity) ||
                other.valueCapacity == valueCapacity) &&
            (identical(other.volumeCapacity, volumeCapacity) ||
                other.volumeCapacity == volumeCapacity) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.validationRegex, validationRegex) ||
                other.validationRegex == validationRegex) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityIds, entityIds) ||
                other.entityIds == entityIds) &&
            (identical(other.isIRAsset, isIRAsset) ||
                other.isIRAsset == isIRAsset) &&
            (identical(other.isAssetRefNoScannable, isAssetRefNoScannable) ||
                other.isAssetRefNoScannable == isAssetRefNoScannable) &&
            (identical(other.assetTypeId, assetTypeId) ||
                other.assetTypeId == assetTypeId) &&
            (identical(other.isOutletAsset, isOutletAsset) ||
                other.isOutletAsset == isOutletAsset) &&
            (identical(
                    other.beforeAfterStateEnabled, beforeAfterStateEnabled) ||
                other.beforeAfterStateEnabled == beforeAfterStateEnabled) &&
            (identical(other.instanceNumber, instanceNumber) ||
                other.instanceNumber == instanceNumber) &&
            const DeepCollectionEquality()
                .equals(other.mappedEquipments, mappedEquipments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      companyId,
      isActive,
      name,
      assetType,
      valueCapacity,
      volumeCapacity,
      shortName,
      validationRegex,
      entityType,
      entityIds,
      isIRAsset,
      isAssetRefNoScannable,
      assetTypeId,
      isOutletAsset,
      beforeAfterStateEnabled,
      instanceNumber,
      const DeepCollectionEquality().hash(mappedEquipments));

  @override
  String toString() {
    return 'IrAssetsModel(id: $id, companyId: $companyId, isActive: $isActive, name: $name, assetType: $assetType, valueCapacity: $valueCapacity, volumeCapacity: $volumeCapacity, shortName: $shortName, validationRegex: $validationRegex, entityType: $entityType, entityIds: $entityIds, isIRAsset: $isIRAsset, isAssetRefNoScannable: $isAssetRefNoScannable, assetTypeId: $assetTypeId, isOutletAsset: $isOutletAsset, beforeAfterStateEnabled: $beforeAfterStateEnabled, instanceNumber: $instanceNumber, mappedEquipments: $mappedEquipments)';
  }
}

/// @nodoc
abstract mixin class $IrAssetsModelCopyWith<$Res> {
  factory $IrAssetsModelCopyWith(
          IrAssetsModel value, $Res Function(IrAssetsModel) _then) =
      _$IrAssetsModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "CompanyId") int companyId,
      @JsonKey(name: "IsActive") bool isActive,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "AssetType") String assetType,
      @JsonKey(name: "ValueCapacity") int valueCapacity,
      @JsonKey(name: "VolumeCapacity") num volumeCapacity,
      @JsonKey(name: "ShortName") String? shortName,
      @JsonKey(name: "ValidationRegex") String? validationRegex,
      @JsonKey(name: "EntityType") int? entityType,
      @JsonKey(name: "EntityIds") String? entityIds,
      @JsonKey(name: "IsIRAsset") bool isIRAsset,
      @JsonKey(name: "IsAssetRefNoScannable") bool isAssetRefNoScannable,
      @JsonKey(name: "AssetTypeId") int? assetTypeId,
      @JsonKey(name: "IsOutletAsset") bool isOutletAsset,
      @JsonKey(name: "app_specific_beforeStateEnabledForAsset")
      bool? beforeAfterStateEnabled,
      @JsonKey(name: "app_specific_instanceNumber") int instanceNumber,
      @JsonKey(name: "MappedEquipments")
      List<IrOutletAssetDetailsModel>? mappedEquipments});
}

/// @nodoc
class _$IrAssetsModelCopyWithImpl<$Res>
    implements $IrAssetsModelCopyWith<$Res> {
  _$IrAssetsModelCopyWithImpl(this._self, this._then);

  final IrAssetsModel _self;
  final $Res Function(IrAssetsModel) _then;

  /// Create a copy of IrAssetsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? isActive = null,
    Object? name = null,
    Object? assetType = null,
    Object? valueCapacity = null,
    Object? volumeCapacity = null,
    Object? shortName = freezed,
    Object? validationRegex = freezed,
    Object? entityType = freezed,
    Object? entityIds = freezed,
    Object? isIRAsset = null,
    Object? isAssetRefNoScannable = null,
    Object? assetTypeId = freezed,
    Object? isOutletAsset = null,
    Object? beforeAfterStateEnabled = freezed,
    Object? instanceNumber = null,
    Object? mappedEquipments = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: null == companyId
          ? _self.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assetType: null == assetType
          ? _self.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String,
      valueCapacity: null == valueCapacity
          ? _self.valueCapacity
          : valueCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      volumeCapacity: null == volumeCapacity
          ? _self.volumeCapacity
          : volumeCapacity // ignore: cast_nullable_to_non_nullable
              as num,
      shortName: freezed == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      validationRegex: freezed == validationRegex
          ? _self.validationRegex
          : validationRegex // ignore: cast_nullable_to_non_nullable
              as String?,
      entityType: freezed == entityType
          ? _self.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as int?,
      entityIds: freezed == entityIds
          ? _self.entityIds
          : entityIds // ignore: cast_nullable_to_non_nullable
              as String?,
      isIRAsset: null == isIRAsset
          ? _self.isIRAsset
          : isIRAsset // ignore: cast_nullable_to_non_nullable
              as bool,
      isAssetRefNoScannable: null == isAssetRefNoScannable
          ? _self.isAssetRefNoScannable
          : isAssetRefNoScannable // ignore: cast_nullable_to_non_nullable
              as bool,
      assetTypeId: freezed == assetTypeId
          ? _self.assetTypeId
          : assetTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isOutletAsset: null == isOutletAsset
          ? _self.isOutletAsset
          : isOutletAsset // ignore: cast_nullable_to_non_nullable
              as bool,
      beforeAfterStateEnabled: freezed == beforeAfterStateEnabled
          ? _self.beforeAfterStateEnabled
          : beforeAfterStateEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      instanceNumber: null == instanceNumber
          ? _self.instanceNumber
          : instanceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      mappedEquipments: freezed == mappedEquipments
          ? _self.mappedEquipments
          : mappedEquipments // ignore: cast_nullable_to_non_nullable
              as List<IrOutletAssetDetailsModel>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [IrAssetsModel].
extension IrAssetsModelPatterns on IrAssetsModel {
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
    TResult Function(_IrAssetsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrAssetsModel() when $default != null:
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
    TResult Function(_IrAssetsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrAssetsModel():
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
    TResult? Function(_IrAssetsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrAssetsModel() when $default != null:
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
            @JsonKey(name: "Id") int id,
            @JsonKey(name: "CompanyId") int companyId,
            @JsonKey(name: "IsActive") bool isActive,
            @JsonKey(name: "Name") String name,
            @JsonKey(name: "AssetType") String assetType,
            @JsonKey(name: "ValueCapacity") int valueCapacity,
            @JsonKey(name: "VolumeCapacity") num volumeCapacity,
            @JsonKey(name: "ShortName") String? shortName,
            @JsonKey(name: "ValidationRegex") String? validationRegex,
            @JsonKey(name: "EntityType") int? entityType,
            @JsonKey(name: "EntityIds") String? entityIds,
            @JsonKey(name: "IsIRAsset") bool isIRAsset,
            @JsonKey(name: "IsAssetRefNoScannable") bool isAssetRefNoScannable,
            @JsonKey(name: "AssetTypeId") int? assetTypeId,
            @JsonKey(name: "IsOutletAsset") bool isOutletAsset,
            @JsonKey(name: "app_specific_beforeStateEnabledForAsset")
            bool? beforeAfterStateEnabled,
            @JsonKey(name: "app_specific_instanceNumber") int instanceNumber,
            @JsonKey(name: "MappedEquipments")
            List<IrOutletAssetDetailsModel>? mappedEquipments)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrAssetsModel() when $default != null:
        return $default(
            _that.id,
            _that.companyId,
            _that.isActive,
            _that.name,
            _that.assetType,
            _that.valueCapacity,
            _that.volumeCapacity,
            _that.shortName,
            _that.validationRegex,
            _that.entityType,
            _that.entityIds,
            _that.isIRAsset,
            _that.isAssetRefNoScannable,
            _that.assetTypeId,
            _that.isOutletAsset,
            _that.beforeAfterStateEnabled,
            _that.instanceNumber,
            _that.mappedEquipments);
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
            @JsonKey(name: "Id") int id,
            @JsonKey(name: "CompanyId") int companyId,
            @JsonKey(name: "IsActive") bool isActive,
            @JsonKey(name: "Name") String name,
            @JsonKey(name: "AssetType") String assetType,
            @JsonKey(name: "ValueCapacity") int valueCapacity,
            @JsonKey(name: "VolumeCapacity") num volumeCapacity,
            @JsonKey(name: "ShortName") String? shortName,
            @JsonKey(name: "ValidationRegex") String? validationRegex,
            @JsonKey(name: "EntityType") int? entityType,
            @JsonKey(name: "EntityIds") String? entityIds,
            @JsonKey(name: "IsIRAsset") bool isIRAsset,
            @JsonKey(name: "IsAssetRefNoScannable") bool isAssetRefNoScannable,
            @JsonKey(name: "AssetTypeId") int? assetTypeId,
            @JsonKey(name: "IsOutletAsset") bool isOutletAsset,
            @JsonKey(name: "app_specific_beforeStateEnabledForAsset")
            bool? beforeAfterStateEnabled,
            @JsonKey(name: "app_specific_instanceNumber") int instanceNumber,
            @JsonKey(name: "MappedEquipments")
            List<IrOutletAssetDetailsModel>? mappedEquipments)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrAssetsModel():
        return $default(
            _that.id,
            _that.companyId,
            _that.isActive,
            _that.name,
            _that.assetType,
            _that.valueCapacity,
            _that.volumeCapacity,
            _that.shortName,
            _that.validationRegex,
            _that.entityType,
            _that.entityIds,
            _that.isIRAsset,
            _that.isAssetRefNoScannable,
            _that.assetTypeId,
            _that.isOutletAsset,
            _that.beforeAfterStateEnabled,
            _that.instanceNumber,
            _that.mappedEquipments);
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
            @JsonKey(name: "Id") int id,
            @JsonKey(name: "CompanyId") int companyId,
            @JsonKey(name: "IsActive") bool isActive,
            @JsonKey(name: "Name") String name,
            @JsonKey(name: "AssetType") String assetType,
            @JsonKey(name: "ValueCapacity") int valueCapacity,
            @JsonKey(name: "VolumeCapacity") num volumeCapacity,
            @JsonKey(name: "ShortName") String? shortName,
            @JsonKey(name: "ValidationRegex") String? validationRegex,
            @JsonKey(name: "EntityType") int? entityType,
            @JsonKey(name: "EntityIds") String? entityIds,
            @JsonKey(name: "IsIRAsset") bool isIRAsset,
            @JsonKey(name: "IsAssetRefNoScannable") bool isAssetRefNoScannable,
            @JsonKey(name: "AssetTypeId") int? assetTypeId,
            @JsonKey(name: "IsOutletAsset") bool isOutletAsset,
            @JsonKey(name: "app_specific_beforeStateEnabledForAsset")
            bool? beforeAfterStateEnabled,
            @JsonKey(name: "app_specific_instanceNumber") int instanceNumber,
            @JsonKey(name: "MappedEquipments")
            List<IrOutletAssetDetailsModel>? mappedEquipments)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrAssetsModel() when $default != null:
        return $default(
            _that.id,
            _that.companyId,
            _that.isActive,
            _that.name,
            _that.assetType,
            _that.valueCapacity,
            _that.volumeCapacity,
            _that.shortName,
            _that.validationRegex,
            _that.entityType,
            _that.entityIds,
            _that.isIRAsset,
            _that.isAssetRefNoScannable,
            _that.assetTypeId,
            _that.isOutletAsset,
            _that.beforeAfterStateEnabled,
            _that.instanceNumber,
            _that.mappedEquipments);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrAssetsModel implements IrAssetsModel {
  _IrAssetsModel(
      {@JsonKey(name: "Id") this.id = 0,
      @JsonKey(name: "CompanyId") this.companyId = 0,
      @JsonKey(name: "IsActive") this.isActive = true,
      @JsonKey(name: "Name") this.name = "",
      @JsonKey(name: "AssetType") this.assetType = "",
      @JsonKey(name: "ValueCapacity") this.valueCapacity = 0,
      @JsonKey(name: "VolumeCapacity") this.volumeCapacity = 0,
      @JsonKey(name: "ShortName") this.shortName,
      @JsonKey(name: "ValidationRegex") this.validationRegex,
      @JsonKey(name: "EntityType") this.entityType,
      @JsonKey(name: "EntityIds") this.entityIds,
      @JsonKey(name: "IsIRAsset") this.isIRAsset = true,
      @JsonKey(name: "IsAssetRefNoScannable")
      this.isAssetRefNoScannable = false,
      @JsonKey(name: "AssetTypeId") this.assetTypeId,
      @JsonKey(name: "IsOutletAsset") this.isOutletAsset = false,
      @JsonKey(name: "app_specific_beforeStateEnabledForAsset")
      this.beforeAfterStateEnabled,
      @JsonKey(name: "app_specific_instanceNumber") this.instanceNumber = 1,
      @JsonKey(name: "MappedEquipments") this.mappedEquipments});
  factory _IrAssetsModel.fromJson(Map<String, dynamic> json) =>
      _$IrAssetsModelFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "CompanyId")
  final int companyId;
  @override
  @JsonKey(name: "IsActive")
  final bool isActive;
  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "AssetType")
  final String assetType;
  @override
  @JsonKey(name: "ValueCapacity")
  final int valueCapacity;
  @override
  @JsonKey(name: "VolumeCapacity")
  final num volumeCapacity;
  @override
  @JsonKey(name: "ShortName")
  final String? shortName;
  @override
  @JsonKey(name: "ValidationRegex")
  final String? validationRegex;
  @override
  @JsonKey(name: "EntityType")
  final int? entityType;
  @override
  @JsonKey(name: "EntityIds")
  final String? entityIds;
  @override
  @JsonKey(name: "IsIRAsset")
  final bool isIRAsset;
  @override
  @JsonKey(name: "IsAssetRefNoScannable")
  final bool isAssetRefNoScannable;
  @override
  @JsonKey(name: "AssetTypeId")
  final int? assetTypeId;
  @override
  @JsonKey(name: "IsOutletAsset")
  final bool isOutletAsset;
  @override
  @JsonKey(name: "app_specific_beforeStateEnabledForAsset")
  final bool? beforeAfterStateEnabled;
  @override
  @JsonKey(name: "app_specific_instanceNumber")
  final int instanceNumber;
  @override
  @JsonKey(name: "MappedEquipments")
  final List<IrOutletAssetDetailsModel>? mappedEquipments;

  /// Create a copy of IrAssetsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrAssetsModelCopyWith<_IrAssetsModel> get copyWith =>
      __$IrAssetsModelCopyWithImpl<_IrAssetsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrAssetsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrAssetsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.valueCapacity, valueCapacity) ||
                other.valueCapacity == valueCapacity) &&
            (identical(other.volumeCapacity, volumeCapacity) ||
                other.volumeCapacity == volumeCapacity) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.validationRegex, validationRegex) ||
                other.validationRegex == validationRegex) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityIds, entityIds) ||
                other.entityIds == entityIds) &&
            (identical(other.isIRAsset, isIRAsset) ||
                other.isIRAsset == isIRAsset) &&
            (identical(other.isAssetRefNoScannable, isAssetRefNoScannable) ||
                other.isAssetRefNoScannable == isAssetRefNoScannable) &&
            (identical(other.assetTypeId, assetTypeId) ||
                other.assetTypeId == assetTypeId) &&
            (identical(other.isOutletAsset, isOutletAsset) ||
                other.isOutletAsset == isOutletAsset) &&
            (identical(
                    other.beforeAfterStateEnabled, beforeAfterStateEnabled) ||
                other.beforeAfterStateEnabled == beforeAfterStateEnabled) &&
            (identical(other.instanceNumber, instanceNumber) ||
                other.instanceNumber == instanceNumber) &&
            const DeepCollectionEquality()
                .equals(other.mappedEquipments, mappedEquipments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      companyId,
      isActive,
      name,
      assetType,
      valueCapacity,
      volumeCapacity,
      shortName,
      validationRegex,
      entityType,
      entityIds,
      isIRAsset,
      isAssetRefNoScannable,
      assetTypeId,
      isOutletAsset,
      beforeAfterStateEnabled,
      instanceNumber,
      const DeepCollectionEquality().hash(mappedEquipments));

  @override
  String toString() {
    return 'IrAssetsModel(id: $id, companyId: $companyId, isActive: $isActive, name: $name, assetType: $assetType, valueCapacity: $valueCapacity, volumeCapacity: $volumeCapacity, shortName: $shortName, validationRegex: $validationRegex, entityType: $entityType, entityIds: $entityIds, isIRAsset: $isIRAsset, isAssetRefNoScannable: $isAssetRefNoScannable, assetTypeId: $assetTypeId, isOutletAsset: $isOutletAsset, beforeAfterStateEnabled: $beforeAfterStateEnabled, instanceNumber: $instanceNumber, mappedEquipments: $mappedEquipments)';
  }
}

/// @nodoc
abstract mixin class _$IrAssetsModelCopyWith<$Res>
    implements $IrAssetsModelCopyWith<$Res> {
  factory _$IrAssetsModelCopyWith(
          _IrAssetsModel value, $Res Function(_IrAssetsModel) _then) =
      __$IrAssetsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "CompanyId") int companyId,
      @JsonKey(name: "IsActive") bool isActive,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "AssetType") String assetType,
      @JsonKey(name: "ValueCapacity") int valueCapacity,
      @JsonKey(name: "VolumeCapacity") num volumeCapacity,
      @JsonKey(name: "ShortName") String? shortName,
      @JsonKey(name: "ValidationRegex") String? validationRegex,
      @JsonKey(name: "EntityType") int? entityType,
      @JsonKey(name: "EntityIds") String? entityIds,
      @JsonKey(name: "IsIRAsset") bool isIRAsset,
      @JsonKey(name: "IsAssetRefNoScannable") bool isAssetRefNoScannable,
      @JsonKey(name: "AssetTypeId") int? assetTypeId,
      @JsonKey(name: "IsOutletAsset") bool isOutletAsset,
      @JsonKey(name: "app_specific_beforeStateEnabledForAsset")
      bool? beforeAfterStateEnabled,
      @JsonKey(name: "app_specific_instanceNumber") int instanceNumber,
      @JsonKey(name: "MappedEquipments")
      List<IrOutletAssetDetailsModel>? mappedEquipments});
}

/// @nodoc
class __$IrAssetsModelCopyWithImpl<$Res>
    implements _$IrAssetsModelCopyWith<$Res> {
  __$IrAssetsModelCopyWithImpl(this._self, this._then);

  final _IrAssetsModel _self;
  final $Res Function(_IrAssetsModel) _then;

  /// Create a copy of IrAssetsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? isActive = null,
    Object? name = null,
    Object? assetType = null,
    Object? valueCapacity = null,
    Object? volumeCapacity = null,
    Object? shortName = freezed,
    Object? validationRegex = freezed,
    Object? entityType = freezed,
    Object? entityIds = freezed,
    Object? isIRAsset = null,
    Object? isAssetRefNoScannable = null,
    Object? assetTypeId = freezed,
    Object? isOutletAsset = null,
    Object? beforeAfterStateEnabled = freezed,
    Object? instanceNumber = null,
    Object? mappedEquipments = freezed,
  }) {
    return _then(_IrAssetsModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: null == companyId
          ? _self.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assetType: null == assetType
          ? _self.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String,
      valueCapacity: null == valueCapacity
          ? _self.valueCapacity
          : valueCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      volumeCapacity: null == volumeCapacity
          ? _self.volumeCapacity
          : volumeCapacity // ignore: cast_nullable_to_non_nullable
              as num,
      shortName: freezed == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      validationRegex: freezed == validationRegex
          ? _self.validationRegex
          : validationRegex // ignore: cast_nullable_to_non_nullable
              as String?,
      entityType: freezed == entityType
          ? _self.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as int?,
      entityIds: freezed == entityIds
          ? _self.entityIds
          : entityIds // ignore: cast_nullable_to_non_nullable
              as String?,
      isIRAsset: null == isIRAsset
          ? _self.isIRAsset
          : isIRAsset // ignore: cast_nullable_to_non_nullable
              as bool,
      isAssetRefNoScannable: null == isAssetRefNoScannable
          ? _self.isAssetRefNoScannable
          : isAssetRefNoScannable // ignore: cast_nullable_to_non_nullable
              as bool,
      assetTypeId: freezed == assetTypeId
          ? _self.assetTypeId
          : assetTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isOutletAsset: null == isOutletAsset
          ? _self.isOutletAsset
          : isOutletAsset // ignore: cast_nullable_to_non_nullable
              as bool,
      beforeAfterStateEnabled: freezed == beforeAfterStateEnabled
          ? _self.beforeAfterStateEnabled
          : beforeAfterStateEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      instanceNumber: null == instanceNumber
          ? _self.instanceNumber
          : instanceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      mappedEquipments: freezed == mappedEquipments
          ? _self.mappedEquipments
          : mappedEquipments // ignore: cast_nullable_to_non_nullable
              as List<IrOutletAssetDetailsModel>?,
    ));
  }
}

// dart format on
