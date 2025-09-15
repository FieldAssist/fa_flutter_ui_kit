// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrRequestModel {
  @JsonKey(name: "SessionId")
  String get sessionId;
  @JsonKey(name: "AttendanceId")
  String get attendanceId;
  @JsonKey(name: "OutletId")
  int get outletId;
  @JsonKey(name: "Remarks")
  String get remarks;
  @JsonKey(name: "AssetId")
  int get assetId;
  @JsonKey(name: "EquipmentId")
  int? get equipmentId;
  @JsonKey(name: "BeforeSeenEnabled")
  dynamic get beforeSeenEnabled;
  @JsonKey(name: "ImageState")
  int get imageState;
  @JsonKey(name: "LogicId")
  int get logicId;
  @JsonKey(name: "MustSellProducts")
  List<int> get mustSellProducts;
  @JsonKey(name: "FocusedProducts")
  List<int> get focusedProducts;
  @JsonKey(name: "PremiumSkuProducts")
  List<int> get premiumSkus;
  @JsonKey(name: 'ImageUrl')
  String? get imageUrl;

  /// Create a copy of IrRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrRequestModelCopyWith<IrRequestModel> get copyWith =>
      _$IrRequestModelCopyWithImpl<IrRequestModel>(
          this as IrRequestModel, _$identity);

  /// Serializes this IrRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrRequestModel &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.attendanceId, attendanceId) ||
                other.attendanceId == attendanceId) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.equipmentId, equipmentId) ||
                other.equipmentId == equipmentId) &&
            const DeepCollectionEquality()
                .equals(other.beforeSeenEnabled, beforeSeenEnabled) &&
            (identical(other.imageState, imageState) ||
                other.imageState == imageState) &&
            (identical(other.logicId, logicId) || other.logicId == logicId) &&
            const DeepCollectionEquality()
                .equals(other.mustSellProducts, mustSellProducts) &&
            const DeepCollectionEquality()
                .equals(other.focusedProducts, focusedProducts) &&
            const DeepCollectionEquality()
                .equals(other.premiumSkus, premiumSkus) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      attendanceId,
      outletId,
      remarks,
      assetId,
      equipmentId,
      const DeepCollectionEquality().hash(beforeSeenEnabled),
      imageState,
      logicId,
      const DeepCollectionEquality().hash(mustSellProducts),
      const DeepCollectionEquality().hash(focusedProducts),
      const DeepCollectionEquality().hash(premiumSkus),
      imageUrl);

  @override
  String toString() {
    return 'IrRequestModel(sessionId: $sessionId, attendanceId: $attendanceId, outletId: $outletId, remarks: $remarks, assetId: $assetId, equipmentId: $equipmentId, beforeSeenEnabled: $beforeSeenEnabled, imageState: $imageState, logicId: $logicId, mustSellProducts: $mustSellProducts, focusedProducts: $focusedProducts, premiumSkus: $premiumSkus, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $IrRequestModelCopyWith<$Res> {
  factory $IrRequestModelCopyWith(
          IrRequestModel value, $Res Function(IrRequestModel) _then) =
      _$IrRequestModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "SessionId") String sessionId,
      @JsonKey(name: "AttendanceId") String attendanceId,
      @JsonKey(name: "OutletId") int outletId,
      @JsonKey(name: "Remarks") String remarks,
      @JsonKey(name: "AssetId") int assetId,
      @JsonKey(name: "EquipmentId") int? equipmentId,
      @JsonKey(name: "BeforeSeenEnabled") dynamic beforeSeenEnabled,
      @JsonKey(name: "ImageState") int imageState,
      @JsonKey(name: "LogicId") int logicId,
      @JsonKey(name: "MustSellProducts") List<int> mustSellProducts,
      @JsonKey(name: "FocusedProducts") List<int> focusedProducts,
      @JsonKey(name: "PremiumSkuProducts") List<int> premiumSkus,
      @JsonKey(name: 'ImageUrl') String? imageUrl});
}

/// @nodoc
class _$IrRequestModelCopyWithImpl<$Res>
    implements $IrRequestModelCopyWith<$Res> {
  _$IrRequestModelCopyWithImpl(this._self, this._then);

  final IrRequestModel _self;
  final $Res Function(IrRequestModel) _then;

  /// Create a copy of IrRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? attendanceId = null,
    Object? outletId = null,
    Object? remarks = null,
    Object? assetId = null,
    Object? equipmentId = freezed,
    Object? beforeSeenEnabled = freezed,
    Object? imageState = null,
    Object? logicId = null,
    Object? mustSellProducts = null,
    Object? focusedProducts = null,
    Object? premiumSkus = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      attendanceId: null == attendanceId
          ? _self.attendanceId
          : attendanceId // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _self.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _self.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      equipmentId: freezed == equipmentId
          ? _self.equipmentId
          : equipmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      beforeSeenEnabled: freezed == beforeSeenEnabled
          ? _self.beforeSeenEnabled
          : beforeSeenEnabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
      imageState: null == imageState
          ? _self.imageState
          : imageState // ignore: cast_nullable_to_non_nullable
              as int,
      logicId: null == logicId
          ? _self.logicId
          : logicId // ignore: cast_nullable_to_non_nullable
              as int,
      mustSellProducts: null == mustSellProducts
          ? _self.mustSellProducts
          : mustSellProducts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      focusedProducts: null == focusedProducts
          ? _self.focusedProducts
          : focusedProducts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      premiumSkus: null == premiumSkus
          ? _self.premiumSkus
          : premiumSkus // ignore: cast_nullable_to_non_nullable
              as List<int>,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [IrRequestModel].
extension IrRequestModelPatterns on IrRequestModel {
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
    TResult Function(_IrRequestModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrRequestModel() when $default != null:
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
    TResult Function(_IrRequestModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrRequestModel():
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
    TResult? Function(_IrRequestModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrRequestModel() when $default != null:
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
            @JsonKey(name: "SessionId") String sessionId,
            @JsonKey(name: "AttendanceId") String attendanceId,
            @JsonKey(name: "OutletId") int outletId,
            @JsonKey(name: "Remarks") String remarks,
            @JsonKey(name: "AssetId") int assetId,
            @JsonKey(name: "EquipmentId") int? equipmentId,
            @JsonKey(name: "BeforeSeenEnabled") dynamic beforeSeenEnabled,
            @JsonKey(name: "ImageState") int imageState,
            @JsonKey(name: "LogicId") int logicId,
            @JsonKey(name: "MustSellProducts") List<int> mustSellProducts,
            @JsonKey(name: "FocusedProducts") List<int> focusedProducts,
            @JsonKey(name: "PremiumSkuProducts") List<int> premiumSkus,
            @JsonKey(name: 'ImageUrl') String? imageUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrRequestModel() when $default != null:
        return $default(
            _that.sessionId,
            _that.attendanceId,
            _that.outletId,
            _that.remarks,
            _that.assetId,
            _that.equipmentId,
            _that.beforeSeenEnabled,
            _that.imageState,
            _that.logicId,
            _that.mustSellProducts,
            _that.focusedProducts,
            _that.premiumSkus,
            _that.imageUrl);
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
            @JsonKey(name: "SessionId") String sessionId,
            @JsonKey(name: "AttendanceId") String attendanceId,
            @JsonKey(name: "OutletId") int outletId,
            @JsonKey(name: "Remarks") String remarks,
            @JsonKey(name: "AssetId") int assetId,
            @JsonKey(name: "EquipmentId") int? equipmentId,
            @JsonKey(name: "BeforeSeenEnabled") dynamic beforeSeenEnabled,
            @JsonKey(name: "ImageState") int imageState,
            @JsonKey(name: "LogicId") int logicId,
            @JsonKey(name: "MustSellProducts") List<int> mustSellProducts,
            @JsonKey(name: "FocusedProducts") List<int> focusedProducts,
            @JsonKey(name: "PremiumSkuProducts") List<int> premiumSkus,
            @JsonKey(name: 'ImageUrl') String? imageUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrRequestModel():
        return $default(
            _that.sessionId,
            _that.attendanceId,
            _that.outletId,
            _that.remarks,
            _that.assetId,
            _that.equipmentId,
            _that.beforeSeenEnabled,
            _that.imageState,
            _that.logicId,
            _that.mustSellProducts,
            _that.focusedProducts,
            _that.premiumSkus,
            _that.imageUrl);
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
            @JsonKey(name: "SessionId") String sessionId,
            @JsonKey(name: "AttendanceId") String attendanceId,
            @JsonKey(name: "OutletId") int outletId,
            @JsonKey(name: "Remarks") String remarks,
            @JsonKey(name: "AssetId") int assetId,
            @JsonKey(name: "EquipmentId") int? equipmentId,
            @JsonKey(name: "BeforeSeenEnabled") dynamic beforeSeenEnabled,
            @JsonKey(name: "ImageState") int imageState,
            @JsonKey(name: "LogicId") int logicId,
            @JsonKey(name: "MustSellProducts") List<int> mustSellProducts,
            @JsonKey(name: "FocusedProducts") List<int> focusedProducts,
            @JsonKey(name: "PremiumSkuProducts") List<int> premiumSkus,
            @JsonKey(name: 'ImageUrl') String? imageUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrRequestModel() when $default != null:
        return $default(
            _that.sessionId,
            _that.attendanceId,
            _that.outletId,
            _that.remarks,
            _that.assetId,
            _that.equipmentId,
            _that.beforeSeenEnabled,
            _that.imageState,
            _that.logicId,
            _that.mustSellProducts,
            _that.focusedProducts,
            _that.premiumSkus,
            _that.imageUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrRequestModel implements IrRequestModel {
  _IrRequestModel(
      {@JsonKey(name: "SessionId") this.sessionId = "",
      @JsonKey(name: "AttendanceId") this.attendanceId = "",
      @JsonKey(name: "OutletId") this.outletId = 0,
      @JsonKey(name: "Remarks") this.remarks = "",
      @JsonKey(name: "AssetId") this.assetId = 0,
      @JsonKey(name: "EquipmentId") this.equipmentId,
      @JsonKey(name: "BeforeSeenEnabled") this.beforeSeenEnabled = 0,
      @JsonKey(name: "ImageState") this.imageState = 100,
      @JsonKey(name: "LogicId") this.logicId = 0,
      @JsonKey(name: "MustSellProducts") this.mustSellProducts = const [],
      @JsonKey(name: "FocusedProducts") this.focusedProducts = const [],
      @JsonKey(name: "PremiumSkuProducts") this.premiumSkus = const [],
      @JsonKey(name: 'ImageUrl') this.imageUrl});
  factory _IrRequestModel.fromJson(Map<String, dynamic> json) =>
      _$IrRequestModelFromJson(json);

  @override
  @JsonKey(name: "SessionId")
  final String sessionId;
  @override
  @JsonKey(name: "AttendanceId")
  final String attendanceId;
  @override
  @JsonKey(name: "OutletId")
  final int outletId;
  @override
  @JsonKey(name: "Remarks")
  final String remarks;
  @override
  @JsonKey(name: "AssetId")
  final int assetId;
  @override
  @JsonKey(name: "EquipmentId")
  final int? equipmentId;
  @override
  @JsonKey(name: "BeforeSeenEnabled")
  final dynamic beforeSeenEnabled;
  @override
  @JsonKey(name: "ImageState")
  final int imageState;
  @override
  @JsonKey(name: "LogicId")
  final int logicId;
  @override
  @JsonKey(name: "MustSellProducts")
  final List<int> mustSellProducts;
  @override
  @JsonKey(name: "FocusedProducts")
  final List<int> focusedProducts;
  @override
  @JsonKey(name: "PremiumSkuProducts")
  final List<int> premiumSkus;
  @override
  @JsonKey(name: 'ImageUrl')
  final String? imageUrl;

  /// Create a copy of IrRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrRequestModelCopyWith<_IrRequestModel> get copyWith =>
      __$IrRequestModelCopyWithImpl<_IrRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrRequestModel &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.attendanceId, attendanceId) ||
                other.attendanceId == attendanceId) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.equipmentId, equipmentId) ||
                other.equipmentId == equipmentId) &&
            const DeepCollectionEquality()
                .equals(other.beforeSeenEnabled, beforeSeenEnabled) &&
            (identical(other.imageState, imageState) ||
                other.imageState == imageState) &&
            (identical(other.logicId, logicId) || other.logicId == logicId) &&
            const DeepCollectionEquality()
                .equals(other.mustSellProducts, mustSellProducts) &&
            const DeepCollectionEquality()
                .equals(other.focusedProducts, focusedProducts) &&
            const DeepCollectionEquality()
                .equals(other.premiumSkus, premiumSkus) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      attendanceId,
      outletId,
      remarks,
      assetId,
      equipmentId,
      const DeepCollectionEquality().hash(beforeSeenEnabled),
      imageState,
      logicId,
      const DeepCollectionEquality().hash(mustSellProducts),
      const DeepCollectionEquality().hash(focusedProducts),
      const DeepCollectionEquality().hash(premiumSkus),
      imageUrl);

  @override
  String toString() {
    return 'IrRequestModel(sessionId: $sessionId, attendanceId: $attendanceId, outletId: $outletId, remarks: $remarks, assetId: $assetId, equipmentId: $equipmentId, beforeSeenEnabled: $beforeSeenEnabled, imageState: $imageState, logicId: $logicId, mustSellProducts: $mustSellProducts, focusedProducts: $focusedProducts, premiumSkus: $premiumSkus, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$IrRequestModelCopyWith<$Res>
    implements $IrRequestModelCopyWith<$Res> {
  factory _$IrRequestModelCopyWith(
          _IrRequestModel value, $Res Function(_IrRequestModel) _then) =
      __$IrRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "SessionId") String sessionId,
      @JsonKey(name: "AttendanceId") String attendanceId,
      @JsonKey(name: "OutletId") int outletId,
      @JsonKey(name: "Remarks") String remarks,
      @JsonKey(name: "AssetId") int assetId,
      @JsonKey(name: "EquipmentId") int? equipmentId,
      @JsonKey(name: "BeforeSeenEnabled") dynamic beforeSeenEnabled,
      @JsonKey(name: "ImageState") int imageState,
      @JsonKey(name: "LogicId") int logicId,
      @JsonKey(name: "MustSellProducts") List<int> mustSellProducts,
      @JsonKey(name: "FocusedProducts") List<int> focusedProducts,
      @JsonKey(name: "PremiumSkuProducts") List<int> premiumSkus,
      @JsonKey(name: 'ImageUrl') String? imageUrl});
}

/// @nodoc
class __$IrRequestModelCopyWithImpl<$Res>
    implements _$IrRequestModelCopyWith<$Res> {
  __$IrRequestModelCopyWithImpl(this._self, this._then);

  final _IrRequestModel _self;
  final $Res Function(_IrRequestModel) _then;

  /// Create a copy of IrRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? attendanceId = null,
    Object? outletId = null,
    Object? remarks = null,
    Object? assetId = null,
    Object? equipmentId = freezed,
    Object? beforeSeenEnabled = freezed,
    Object? imageState = null,
    Object? logicId = null,
    Object? mustSellProducts = null,
    Object? focusedProducts = null,
    Object? premiumSkus = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_IrRequestModel(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      attendanceId: null == attendanceId
          ? _self.attendanceId
          : attendanceId // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _self.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _self.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      equipmentId: freezed == equipmentId
          ? _self.equipmentId
          : equipmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      beforeSeenEnabled: freezed == beforeSeenEnabled
          ? _self.beforeSeenEnabled
          : beforeSeenEnabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
      imageState: null == imageState
          ? _self.imageState
          : imageState // ignore: cast_nullable_to_non_nullable
              as int,
      logicId: null == logicId
          ? _self.logicId
          : logicId // ignore: cast_nullable_to_non_nullable
              as int,
      mustSellProducts: null == mustSellProducts
          ? _self.mustSellProducts
          : mustSellProducts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      focusedProducts: null == focusedProducts
          ? _self.focusedProducts
          : focusedProducts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      premiumSkus: null == premiumSkus
          ? _self.premiumSkus
          : premiumSkus // ignore: cast_nullable_to_non_nullable
              as List<int>,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
