// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_master_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrMasterModel {
  @JsonKey(name: "UniqueId")
  String get uniqueId;
  @JsonKey(name: "AssetName")
  String get assetName;
  @JsonKey(name: "AssetId")
  int get assetId;
  @JsonKey(name: "EquipmentId")
  int? get equipmentId;
  @JsonKey(name: "OutletId")
  int get outletId;
  @JsonKey(name: "RouteId")
  int get routeId;
  @JsonKey(name: "BeatId")
  int get beatId;
  @JsonKey(name: "FileName")
  String get fileName;
  @JsonKey(name: "DetectionId")
  String get detectionId;
  @JsonKey(name: "ResultPreviewed")
  bool get resultPreviewed;
  @JsonKey(
      name: 'SyncStatus',
      fromJson: taskStatusfromJson,
      toJson: taskStatusToJson)
  TaskStatus get syncStatus;
  @JsonKey(name: "SyncRetryCount")
  int get syncRetryCount;
  @JsonKey(name: "InternetAvailable")
  bool get internetAvailable;
  @JsonKey(name: "ImageIndex")
  int get imageIndex;
  @JsonKey(name: "LocalFilePath")
  String get localFilePath;
  @JsonKey(name: "IrRequestModel")
  IrRequestModel? get irRequestModel;
  @JsonKey(name: "IrResponseModel")
  IrResponseModel? get irResponseModel;
  @JsonKey(name: "UploadImageFailedReason")
  String get uploadImageFailedReason;
  @JsonKey(
      name: 'ImageUploadState',
      fromJson: irImageUploadStateFromInt,
      toJson: irImageUploadStateToInt)
  IrImageUploadStateEnum get imageUploadState;
  @JsonKey(name: "InstanceNumber")
  int get instanceNumber;
  bool get isForPlanogram;

  /// Create a copy of IrMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrMasterModelCopyWith<IrMasterModel> get copyWith =>
      _$IrMasterModelCopyWithImpl<IrMasterModel>(
          this as IrMasterModel, _$identity);

  /// Serializes this IrMasterModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrMasterModel &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.equipmentId, equipmentId) ||
                other.equipmentId == equipmentId) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.beatId, beatId) || other.beatId == beatId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.detectionId, detectionId) ||
                other.detectionId == detectionId) &&
            (identical(other.resultPreviewed, resultPreviewed) ||
                other.resultPreviewed == resultPreviewed) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.syncRetryCount, syncRetryCount) ||
                other.syncRetryCount == syncRetryCount) &&
            (identical(other.internetAvailable, internetAvailable) ||
                other.internetAvailable == internetAvailable) &&
            (identical(other.imageIndex, imageIndex) ||
                other.imageIndex == imageIndex) &&
            (identical(other.localFilePath, localFilePath) ||
                other.localFilePath == localFilePath) &&
            (identical(other.irRequestModel, irRequestModel) ||
                other.irRequestModel == irRequestModel) &&
            (identical(other.irResponseModel, irResponseModel) ||
                other.irResponseModel == irResponseModel) &&
            (identical(
                    other.uploadImageFailedReason, uploadImageFailedReason) ||
                other.uploadImageFailedReason == uploadImageFailedReason) &&
            (identical(other.imageUploadState, imageUploadState) ||
                other.imageUploadState == imageUploadState) &&
            (identical(other.instanceNumber, instanceNumber) ||
                other.instanceNumber == instanceNumber) &&
            (identical(other.isForPlanogram, isForPlanogram) ||
                other.isForPlanogram == isForPlanogram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uniqueId,
        assetName,
        assetId,
        equipmentId,
        outletId,
        routeId,
        beatId,
        fileName,
        detectionId,
        resultPreviewed,
        syncStatus,
        syncRetryCount,
        internetAvailable,
        imageIndex,
        localFilePath,
        irRequestModel,
        irResponseModel,
        uploadImageFailedReason,
        imageUploadState,
        instanceNumber,
        isForPlanogram
      ]);

  @override
  String toString() {
    return 'IrMasterModel(uniqueId: $uniqueId, assetName: $assetName, assetId: $assetId, equipmentId: $equipmentId, outletId: $outletId, routeId: $routeId, beatId: $beatId, fileName: $fileName, detectionId: $detectionId, resultPreviewed: $resultPreviewed, syncStatus: $syncStatus, syncRetryCount: $syncRetryCount, internetAvailable: $internetAvailable, imageIndex: $imageIndex, localFilePath: $localFilePath, irRequestModel: $irRequestModel, irResponseModel: $irResponseModel, uploadImageFailedReason: $uploadImageFailedReason, imageUploadState: $imageUploadState, instanceNumber: $instanceNumber, isForPlanogram: $isForPlanogram)';
  }
}

/// @nodoc
abstract mixin class $IrMasterModelCopyWith<$Res> {
  factory $IrMasterModelCopyWith(
          IrMasterModel value, $Res Function(IrMasterModel) _then) =
      _$IrMasterModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "UniqueId") String uniqueId,
      @JsonKey(name: "AssetName") String assetName,
      @JsonKey(name: "AssetId") int assetId,
      @JsonKey(name: "EquipmentId") int? equipmentId,
      @JsonKey(name: "OutletId") int outletId,
      @JsonKey(name: "RouteId") int routeId,
      @JsonKey(name: "BeatId") int beatId,
      @JsonKey(name: "FileName") String fileName,
      @JsonKey(name: "DetectionId") String detectionId,
      @JsonKey(name: "ResultPreviewed") bool resultPreviewed,
      @JsonKey(
          name: 'SyncStatus',
          fromJson: taskStatusfromJson,
          toJson: taskStatusToJson)
      TaskStatus syncStatus,
      @JsonKey(name: "SyncRetryCount") int syncRetryCount,
      @JsonKey(name: "InternetAvailable") bool internetAvailable,
      @JsonKey(name: "ImageIndex") int imageIndex,
      @JsonKey(name: "LocalFilePath") String localFilePath,
      @JsonKey(name: "IrRequestModel") IrRequestModel? irRequestModel,
      @JsonKey(name: "IrResponseModel") IrResponseModel? irResponseModel,
      @JsonKey(name: "UploadImageFailedReason") String uploadImageFailedReason,
      @JsonKey(
          name: 'ImageUploadState',
          fromJson: irImageUploadStateFromInt,
          toJson: irImageUploadStateToInt)
      IrImageUploadStateEnum imageUploadState,
      @JsonKey(name: "InstanceNumber") int instanceNumber,
      bool isForPlanogram});

  $IrRequestModelCopyWith<$Res>? get irRequestModel;
  $IrResponseModelCopyWith<$Res>? get irResponseModel;
}

/// @nodoc
class _$IrMasterModelCopyWithImpl<$Res>
    implements $IrMasterModelCopyWith<$Res> {
  _$IrMasterModelCopyWithImpl(this._self, this._then);

  final IrMasterModel _self;
  final $Res Function(IrMasterModel) _then;

  /// Create a copy of IrMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueId = null,
    Object? assetName = null,
    Object? assetId = null,
    Object? equipmentId = freezed,
    Object? outletId = null,
    Object? routeId = null,
    Object? beatId = null,
    Object? fileName = null,
    Object? detectionId = null,
    Object? resultPreviewed = null,
    Object? syncStatus = null,
    Object? syncRetryCount = null,
    Object? internetAvailable = null,
    Object? imageIndex = null,
    Object? localFilePath = null,
    Object? irRequestModel = freezed,
    Object? irResponseModel = freezed,
    Object? uploadImageFailedReason = null,
    Object? imageUploadState = null,
    Object? instanceNumber = null,
    Object? isForPlanogram = null,
  }) {
    return _then(_self.copyWith(
      uniqueId: null == uniqueId
          ? _self.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _self.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _self.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      equipmentId: freezed == equipmentId
          ? _self.equipmentId
          : equipmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      outletId: null == outletId
          ? _self.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as int,
      routeId: null == routeId
          ? _self.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int,
      beatId: null == beatId
          ? _self.beatId
          : beatId // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      detectionId: null == detectionId
          ? _self.detectionId
          : detectionId // ignore: cast_nullable_to_non_nullable
              as String,
      resultPreviewed: null == resultPreviewed
          ? _self.resultPreviewed
          : resultPreviewed // ignore: cast_nullable_to_non_nullable
              as bool,
      syncStatus: null == syncStatus
          ? _self.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      syncRetryCount: null == syncRetryCount
          ? _self.syncRetryCount
          : syncRetryCount // ignore: cast_nullable_to_non_nullable
              as int,
      internetAvailable: null == internetAvailable
          ? _self.internetAvailable
          : internetAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      imageIndex: null == imageIndex
          ? _self.imageIndex
          : imageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      localFilePath: null == localFilePath
          ? _self.localFilePath
          : localFilePath // ignore: cast_nullable_to_non_nullable
              as String,
      irRequestModel: freezed == irRequestModel
          ? _self.irRequestModel
          : irRequestModel // ignore: cast_nullable_to_non_nullable
              as IrRequestModel?,
      irResponseModel: freezed == irResponseModel
          ? _self.irResponseModel
          : irResponseModel // ignore: cast_nullable_to_non_nullable
              as IrResponseModel?,
      uploadImageFailedReason: null == uploadImageFailedReason
          ? _self.uploadImageFailedReason
          : uploadImageFailedReason // ignore: cast_nullable_to_non_nullable
              as String,
      imageUploadState: null == imageUploadState
          ? _self.imageUploadState
          : imageUploadState // ignore: cast_nullable_to_non_nullable
              as IrImageUploadStateEnum,
      instanceNumber: null == instanceNumber
          ? _self.instanceNumber
          : instanceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isForPlanogram: null == isForPlanogram
          ? _self.isForPlanogram
          : isForPlanogram // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of IrMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IrRequestModelCopyWith<$Res>? get irRequestModel {
    if (_self.irRequestModel == null) {
      return null;
    }

    return $IrRequestModelCopyWith<$Res>(_self.irRequestModel!, (value) {
      return _then(_self.copyWith(irRequestModel: value));
    });
  }

  /// Create a copy of IrMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IrResponseModelCopyWith<$Res>? get irResponseModel {
    if (_self.irResponseModel == null) {
      return null;
    }

    return $IrResponseModelCopyWith<$Res>(_self.irResponseModel!, (value) {
      return _then(_self.copyWith(irResponseModel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [IrMasterModel].
extension IrMasterModelPatterns on IrMasterModel {
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
    TResult Function(_IrMasterModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrMasterModel() when $default != null:
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
    TResult Function(_IrMasterModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrMasterModel():
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
    TResult? Function(_IrMasterModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrMasterModel() when $default != null:
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
            @JsonKey(name: "UniqueId") String uniqueId,
            @JsonKey(name: "AssetName") String assetName,
            @JsonKey(name: "AssetId") int assetId,
            @JsonKey(name: "EquipmentId") int? equipmentId,
            @JsonKey(name: "OutletId") int outletId,
            @JsonKey(name: "RouteId") int routeId,
            @JsonKey(name: "BeatId") int beatId,
            @JsonKey(name: "FileName") String fileName,
            @JsonKey(name: "DetectionId") String detectionId,
            @JsonKey(name: "ResultPreviewed") bool resultPreviewed,
            @JsonKey(
                name: 'SyncStatus',
                fromJson: taskStatusfromJson,
                toJson: taskStatusToJson)
            TaskStatus syncStatus,
            @JsonKey(name: "SyncRetryCount") int syncRetryCount,
            @JsonKey(name: "InternetAvailable") bool internetAvailable,
            @JsonKey(name: "ImageIndex") int imageIndex,
            @JsonKey(name: "LocalFilePath") String localFilePath,
            @JsonKey(name: "IrRequestModel") IrRequestModel? irRequestModel,
            @JsonKey(name: "IrResponseModel") IrResponseModel? irResponseModel,
            @JsonKey(name: "UploadImageFailedReason")
            String uploadImageFailedReason,
            @JsonKey(
                name: 'ImageUploadState',
                fromJson: irImageUploadStateFromInt,
                toJson: irImageUploadStateToInt)
            IrImageUploadStateEnum imageUploadState,
            @JsonKey(name: "InstanceNumber") int instanceNumber,
            bool isForPlanogram)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrMasterModel() when $default != null:
        return $default(
            _that.uniqueId,
            _that.assetName,
            _that.assetId,
            _that.equipmentId,
            _that.outletId,
            _that.routeId,
            _that.beatId,
            _that.fileName,
            _that.detectionId,
            _that.resultPreviewed,
            _that.syncStatus,
            _that.syncRetryCount,
            _that.internetAvailable,
            _that.imageIndex,
            _that.localFilePath,
            _that.irRequestModel,
            _that.irResponseModel,
            _that.uploadImageFailedReason,
            _that.imageUploadState,
            _that.instanceNumber,
            _that.isForPlanogram);
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
            @JsonKey(name: "UniqueId") String uniqueId,
            @JsonKey(name: "AssetName") String assetName,
            @JsonKey(name: "AssetId") int assetId,
            @JsonKey(name: "EquipmentId") int? equipmentId,
            @JsonKey(name: "OutletId") int outletId,
            @JsonKey(name: "RouteId") int routeId,
            @JsonKey(name: "BeatId") int beatId,
            @JsonKey(name: "FileName") String fileName,
            @JsonKey(name: "DetectionId") String detectionId,
            @JsonKey(name: "ResultPreviewed") bool resultPreviewed,
            @JsonKey(
                name: 'SyncStatus',
                fromJson: taskStatusfromJson,
                toJson: taskStatusToJson)
            TaskStatus syncStatus,
            @JsonKey(name: "SyncRetryCount") int syncRetryCount,
            @JsonKey(name: "InternetAvailable") bool internetAvailable,
            @JsonKey(name: "ImageIndex") int imageIndex,
            @JsonKey(name: "LocalFilePath") String localFilePath,
            @JsonKey(name: "IrRequestModel") IrRequestModel? irRequestModel,
            @JsonKey(name: "IrResponseModel") IrResponseModel? irResponseModel,
            @JsonKey(name: "UploadImageFailedReason")
            String uploadImageFailedReason,
            @JsonKey(
                name: 'ImageUploadState',
                fromJson: irImageUploadStateFromInt,
                toJson: irImageUploadStateToInt)
            IrImageUploadStateEnum imageUploadState,
            @JsonKey(name: "InstanceNumber") int instanceNumber,
            bool isForPlanogram)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrMasterModel():
        return $default(
            _that.uniqueId,
            _that.assetName,
            _that.assetId,
            _that.equipmentId,
            _that.outletId,
            _that.routeId,
            _that.beatId,
            _that.fileName,
            _that.detectionId,
            _that.resultPreviewed,
            _that.syncStatus,
            _that.syncRetryCount,
            _that.internetAvailable,
            _that.imageIndex,
            _that.localFilePath,
            _that.irRequestModel,
            _that.irResponseModel,
            _that.uploadImageFailedReason,
            _that.imageUploadState,
            _that.instanceNumber,
            _that.isForPlanogram);
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
            @JsonKey(name: "UniqueId") String uniqueId,
            @JsonKey(name: "AssetName") String assetName,
            @JsonKey(name: "AssetId") int assetId,
            @JsonKey(name: "EquipmentId") int? equipmentId,
            @JsonKey(name: "OutletId") int outletId,
            @JsonKey(name: "RouteId") int routeId,
            @JsonKey(name: "BeatId") int beatId,
            @JsonKey(name: "FileName") String fileName,
            @JsonKey(name: "DetectionId") String detectionId,
            @JsonKey(name: "ResultPreviewed") bool resultPreviewed,
            @JsonKey(
                name: 'SyncStatus',
                fromJson: taskStatusfromJson,
                toJson: taskStatusToJson)
            TaskStatus syncStatus,
            @JsonKey(name: "SyncRetryCount") int syncRetryCount,
            @JsonKey(name: "InternetAvailable") bool internetAvailable,
            @JsonKey(name: "ImageIndex") int imageIndex,
            @JsonKey(name: "LocalFilePath") String localFilePath,
            @JsonKey(name: "IrRequestModel") IrRequestModel? irRequestModel,
            @JsonKey(name: "IrResponseModel") IrResponseModel? irResponseModel,
            @JsonKey(name: "UploadImageFailedReason")
            String uploadImageFailedReason,
            @JsonKey(
                name: 'ImageUploadState',
                fromJson: irImageUploadStateFromInt,
                toJson: irImageUploadStateToInt)
            IrImageUploadStateEnum imageUploadState,
            @JsonKey(name: "InstanceNumber") int instanceNumber,
            bool isForPlanogram)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrMasterModel() when $default != null:
        return $default(
            _that.uniqueId,
            _that.assetName,
            _that.assetId,
            _that.equipmentId,
            _that.outletId,
            _that.routeId,
            _that.beatId,
            _that.fileName,
            _that.detectionId,
            _that.resultPreviewed,
            _that.syncStatus,
            _that.syncRetryCount,
            _that.internetAvailable,
            _that.imageIndex,
            _that.localFilePath,
            _that.irRequestModel,
            _that.irResponseModel,
            _that.uploadImageFailedReason,
            _that.imageUploadState,
            _that.instanceNumber,
            _that.isForPlanogram);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrMasterModel implements IrMasterModel {
  _IrMasterModel(
      {@JsonKey(name: "UniqueId") this.uniqueId = "",
      @JsonKey(name: "AssetName") this.assetName = "",
      @JsonKey(name: "AssetId") this.assetId = 0,
      @JsonKey(name: "EquipmentId") this.equipmentId,
      @JsonKey(name: "OutletId") this.outletId = 0,
      @JsonKey(name: "RouteId") this.routeId = 0,
      @JsonKey(name: "BeatId") this.beatId = 0,
      @JsonKey(name: "FileName") this.fileName = "",
      @JsonKey(name: "DetectionId") this.detectionId = "",
      @JsonKey(name: "ResultPreviewed") this.resultPreviewed = false,
      @JsonKey(
          name: 'SyncStatus',
          fromJson: taskStatusfromJson,
          toJson: taskStatusToJson)
      this.syncStatus = TaskStatus.draft,
      @JsonKey(name: "SyncRetryCount") this.syncRetryCount = 0,
      @JsonKey(name: "InternetAvailable") this.internetAvailable = false,
      @JsonKey(name: "ImageIndex") this.imageIndex = 0,
      @JsonKey(name: "LocalFilePath") this.localFilePath = "",
      @JsonKey(name: "IrRequestModel") this.irRequestModel,
      @JsonKey(name: "IrResponseModel") this.irResponseModel,
      @JsonKey(name: "UploadImageFailedReason")
      this.uploadImageFailedReason = "",
      @JsonKey(
          name: 'ImageUploadState',
          fromJson: irImageUploadStateFromInt,
          toJson: irImageUploadStateToInt)
      this.imageUploadState = IrImageUploadStateEnum.singleImage,
      @JsonKey(name: "InstanceNumber") this.instanceNumber = 1,
      this.isForPlanogram = false});
  factory _IrMasterModel.fromJson(Map<String, dynamic> json) =>
      _$IrMasterModelFromJson(json);

  @override
  @JsonKey(name: "UniqueId")
  final String uniqueId;
  @override
  @JsonKey(name: "AssetName")
  final String assetName;
  @override
  @JsonKey(name: "AssetId")
  final int assetId;
  @override
  @JsonKey(name: "EquipmentId")
  final int? equipmentId;
  @override
  @JsonKey(name: "OutletId")
  final int outletId;
  @override
  @JsonKey(name: "RouteId")
  final int routeId;
  @override
  @JsonKey(name: "BeatId")
  final int beatId;
  @override
  @JsonKey(name: "FileName")
  final String fileName;
  @override
  @JsonKey(name: "DetectionId")
  final String detectionId;
  @override
  @JsonKey(name: "ResultPreviewed")
  final bool resultPreviewed;
  @override
  @JsonKey(
      name: 'SyncStatus',
      fromJson: taskStatusfromJson,
      toJson: taskStatusToJson)
  final TaskStatus syncStatus;
  @override
  @JsonKey(name: "SyncRetryCount")
  final int syncRetryCount;
  @override
  @JsonKey(name: "InternetAvailable")
  final bool internetAvailable;
  @override
  @JsonKey(name: "ImageIndex")
  final int imageIndex;
  @override
  @JsonKey(name: "LocalFilePath")
  final String localFilePath;
  @override
  @JsonKey(name: "IrRequestModel")
  final IrRequestModel? irRequestModel;
  @override
  @JsonKey(name: "IrResponseModel")
  final IrResponseModel? irResponseModel;
  @override
  @JsonKey(name: "UploadImageFailedReason")
  final String uploadImageFailedReason;
  @override
  @JsonKey(
      name: 'ImageUploadState',
      fromJson: irImageUploadStateFromInt,
      toJson: irImageUploadStateToInt)
  final IrImageUploadStateEnum imageUploadState;
  @override
  @JsonKey(name: "InstanceNumber")
  final int instanceNumber;
  @override
  @JsonKey()
  final bool isForPlanogram;

  /// Create a copy of IrMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrMasterModelCopyWith<_IrMasterModel> get copyWith =>
      __$IrMasterModelCopyWithImpl<_IrMasterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrMasterModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrMasterModel &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.equipmentId, equipmentId) ||
                other.equipmentId == equipmentId) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.beatId, beatId) || other.beatId == beatId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.detectionId, detectionId) ||
                other.detectionId == detectionId) &&
            (identical(other.resultPreviewed, resultPreviewed) ||
                other.resultPreviewed == resultPreviewed) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.syncRetryCount, syncRetryCount) ||
                other.syncRetryCount == syncRetryCount) &&
            (identical(other.internetAvailable, internetAvailable) ||
                other.internetAvailable == internetAvailable) &&
            (identical(other.imageIndex, imageIndex) ||
                other.imageIndex == imageIndex) &&
            (identical(other.localFilePath, localFilePath) ||
                other.localFilePath == localFilePath) &&
            (identical(other.irRequestModel, irRequestModel) ||
                other.irRequestModel == irRequestModel) &&
            (identical(other.irResponseModel, irResponseModel) ||
                other.irResponseModel == irResponseModel) &&
            (identical(
                    other.uploadImageFailedReason, uploadImageFailedReason) ||
                other.uploadImageFailedReason == uploadImageFailedReason) &&
            (identical(other.imageUploadState, imageUploadState) ||
                other.imageUploadState == imageUploadState) &&
            (identical(other.instanceNumber, instanceNumber) ||
                other.instanceNumber == instanceNumber) &&
            (identical(other.isForPlanogram, isForPlanogram) ||
                other.isForPlanogram == isForPlanogram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uniqueId,
        assetName,
        assetId,
        equipmentId,
        outletId,
        routeId,
        beatId,
        fileName,
        detectionId,
        resultPreviewed,
        syncStatus,
        syncRetryCount,
        internetAvailable,
        imageIndex,
        localFilePath,
        irRequestModel,
        irResponseModel,
        uploadImageFailedReason,
        imageUploadState,
        instanceNumber,
        isForPlanogram
      ]);

  @override
  String toString() {
    return 'IrMasterModel(uniqueId: $uniqueId, assetName: $assetName, assetId: $assetId, equipmentId: $equipmentId, outletId: $outletId, routeId: $routeId, beatId: $beatId, fileName: $fileName, detectionId: $detectionId, resultPreviewed: $resultPreviewed, syncStatus: $syncStatus, syncRetryCount: $syncRetryCount, internetAvailable: $internetAvailable, imageIndex: $imageIndex, localFilePath: $localFilePath, irRequestModel: $irRequestModel, irResponseModel: $irResponseModel, uploadImageFailedReason: $uploadImageFailedReason, imageUploadState: $imageUploadState, instanceNumber: $instanceNumber, isForPlanogram: $isForPlanogram)';
  }
}

/// @nodoc
abstract mixin class _$IrMasterModelCopyWith<$Res>
    implements $IrMasterModelCopyWith<$Res> {
  factory _$IrMasterModelCopyWith(
          _IrMasterModel value, $Res Function(_IrMasterModel) _then) =
      __$IrMasterModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "UniqueId") String uniqueId,
      @JsonKey(name: "AssetName") String assetName,
      @JsonKey(name: "AssetId") int assetId,
      @JsonKey(name: "EquipmentId") int? equipmentId,
      @JsonKey(name: "OutletId") int outletId,
      @JsonKey(name: "RouteId") int routeId,
      @JsonKey(name: "BeatId") int beatId,
      @JsonKey(name: "FileName") String fileName,
      @JsonKey(name: "DetectionId") String detectionId,
      @JsonKey(name: "ResultPreviewed") bool resultPreviewed,
      @JsonKey(
          name: 'SyncStatus',
          fromJson: taskStatusfromJson,
          toJson: taskStatusToJson)
      TaskStatus syncStatus,
      @JsonKey(name: "SyncRetryCount") int syncRetryCount,
      @JsonKey(name: "InternetAvailable") bool internetAvailable,
      @JsonKey(name: "ImageIndex") int imageIndex,
      @JsonKey(name: "LocalFilePath") String localFilePath,
      @JsonKey(name: "IrRequestModel") IrRequestModel? irRequestModel,
      @JsonKey(name: "IrResponseModel") IrResponseModel? irResponseModel,
      @JsonKey(name: "UploadImageFailedReason") String uploadImageFailedReason,
      @JsonKey(
          name: 'ImageUploadState',
          fromJson: irImageUploadStateFromInt,
          toJson: irImageUploadStateToInt)
      IrImageUploadStateEnum imageUploadState,
      @JsonKey(name: "InstanceNumber") int instanceNumber,
      bool isForPlanogram});

  @override
  $IrRequestModelCopyWith<$Res>? get irRequestModel;
  @override
  $IrResponseModelCopyWith<$Res>? get irResponseModel;
}

/// @nodoc
class __$IrMasterModelCopyWithImpl<$Res>
    implements _$IrMasterModelCopyWith<$Res> {
  __$IrMasterModelCopyWithImpl(this._self, this._then);

  final _IrMasterModel _self;
  final $Res Function(_IrMasterModel) _then;

  /// Create a copy of IrMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uniqueId = null,
    Object? assetName = null,
    Object? assetId = null,
    Object? equipmentId = freezed,
    Object? outletId = null,
    Object? routeId = null,
    Object? beatId = null,
    Object? fileName = null,
    Object? detectionId = null,
    Object? resultPreviewed = null,
    Object? syncStatus = null,
    Object? syncRetryCount = null,
    Object? internetAvailable = null,
    Object? imageIndex = null,
    Object? localFilePath = null,
    Object? irRequestModel = freezed,
    Object? irResponseModel = freezed,
    Object? uploadImageFailedReason = null,
    Object? imageUploadState = null,
    Object? instanceNumber = null,
    Object? isForPlanogram = null,
  }) {
    return _then(_IrMasterModel(
      uniqueId: null == uniqueId
          ? _self.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _self.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _self.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      equipmentId: freezed == equipmentId
          ? _self.equipmentId
          : equipmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      outletId: null == outletId
          ? _self.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as int,
      routeId: null == routeId
          ? _self.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int,
      beatId: null == beatId
          ? _self.beatId
          : beatId // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      detectionId: null == detectionId
          ? _self.detectionId
          : detectionId // ignore: cast_nullable_to_non_nullable
              as String,
      resultPreviewed: null == resultPreviewed
          ? _self.resultPreviewed
          : resultPreviewed // ignore: cast_nullable_to_non_nullable
              as bool,
      syncStatus: null == syncStatus
          ? _self.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      syncRetryCount: null == syncRetryCount
          ? _self.syncRetryCount
          : syncRetryCount // ignore: cast_nullable_to_non_nullable
              as int,
      internetAvailable: null == internetAvailable
          ? _self.internetAvailable
          : internetAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      imageIndex: null == imageIndex
          ? _self.imageIndex
          : imageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      localFilePath: null == localFilePath
          ? _self.localFilePath
          : localFilePath // ignore: cast_nullable_to_non_nullable
              as String,
      irRequestModel: freezed == irRequestModel
          ? _self.irRequestModel
          : irRequestModel // ignore: cast_nullable_to_non_nullable
              as IrRequestModel?,
      irResponseModel: freezed == irResponseModel
          ? _self.irResponseModel
          : irResponseModel // ignore: cast_nullable_to_non_nullable
              as IrResponseModel?,
      uploadImageFailedReason: null == uploadImageFailedReason
          ? _self.uploadImageFailedReason
          : uploadImageFailedReason // ignore: cast_nullable_to_non_nullable
              as String,
      imageUploadState: null == imageUploadState
          ? _self.imageUploadState
          : imageUploadState // ignore: cast_nullable_to_non_nullable
              as IrImageUploadStateEnum,
      instanceNumber: null == instanceNumber
          ? _self.instanceNumber
          : instanceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isForPlanogram: null == isForPlanogram
          ? _self.isForPlanogram
          : isForPlanogram // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of IrMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IrRequestModelCopyWith<$Res>? get irRequestModel {
    if (_self.irRequestModel == null) {
      return null;
    }

    return $IrRequestModelCopyWith<$Res>(_self.irRequestModel!, (value) {
      return _then(_self.copyWith(irRequestModel: value));
    });
  }

  /// Create a copy of IrMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IrResponseModelCopyWith<$Res>? get irResponseModel {
    if (_self.irResponseModel == null) {
      return null;
    }

    return $IrResponseModelCopyWith<$Res>(_self.irResponseModel!, (value) {
      return _then(_self.copyWith(irResponseModel: value));
    });
  }
}

// dart format on
