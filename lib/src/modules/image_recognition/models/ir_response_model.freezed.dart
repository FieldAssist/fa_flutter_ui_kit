// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrResponseModel {
  @JsonKey(name: "ImageURL")
  String get imageURL;
  @JsonKey(name: "BrandSkuCount")
  int get brandSkuCount;
  @JsonKey(name: "TotalObjectCount")
  int get totalObjectCount;
  @JsonKey(name: "ShelfShare")
  int get shelfShare;
  @JsonKey(name: "ShelfSharePercent")
  double get shelfSharePercent;
  @JsonKey(name: "AssetScore")
  double get assetScore;
  @JsonKey(name: "Data")
  List<IrResponseProductData> get data;
  @JsonKey(name: "Products")
  List<IrResponseProductData> get products;
  @JsonKey(name: "KPIWeightage")
  List<IrKpiWeightage> get kpiWeightage;
  @JsonKey(name: "Planogram")
  IrPlanogram? get planogram;
  @JsonKey(name: "AssetName")
  String? get assetName;
  @JsonKey(name: "EquipmentName")
  String? get equipmentName;

  /// Create a copy of IrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrResponseModelCopyWith<IrResponseModel> get copyWith =>
      _$IrResponseModelCopyWithImpl<IrResponseModel>(
          this as IrResponseModel, _$identity);

  /// Serializes this IrResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrResponseModel &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.brandSkuCount, brandSkuCount) ||
                other.brandSkuCount == brandSkuCount) &&
            (identical(other.totalObjectCount, totalObjectCount) ||
                other.totalObjectCount == totalObjectCount) &&
            (identical(other.shelfShare, shelfShare) ||
                other.shelfShare == shelfShare) &&
            (identical(other.shelfSharePercent, shelfSharePercent) ||
                other.shelfSharePercent == shelfSharePercent) &&
            (identical(other.assetScore, assetScore) ||
                other.assetScore == assetScore) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.kpiWeightage, kpiWeightage) &&
            (identical(other.planogram, planogram) ||
                other.planogram == planogram) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.equipmentName, equipmentName) ||
                other.equipmentName == equipmentName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      imageURL,
      brandSkuCount,
      totalObjectCount,
      shelfShare,
      shelfSharePercent,
      assetScore,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(kpiWeightage),
      planogram,
      assetName,
      equipmentName);

  @override
  String toString() {
    return 'IrResponseModel(imageURL: $imageURL, brandSkuCount: $brandSkuCount, totalObjectCount: $totalObjectCount, shelfShare: $shelfShare, shelfSharePercent: $shelfSharePercent, assetScore: $assetScore, data: $data, products: $products, kpiWeightage: $kpiWeightage, planogram: $planogram, assetName: $assetName, equipmentName: $equipmentName)';
  }
}

/// @nodoc
abstract mixin class $IrResponseModelCopyWith<$Res> {
  factory $IrResponseModelCopyWith(
          IrResponseModel value, $Res Function(IrResponseModel) _then) =
      _$IrResponseModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "ImageURL") String imageURL,
      @JsonKey(name: "BrandSkuCount") int brandSkuCount,
      @JsonKey(name: "TotalObjectCount") int totalObjectCount,
      @JsonKey(name: "ShelfShare") int shelfShare,
      @JsonKey(name: "ShelfSharePercent") double shelfSharePercent,
      @JsonKey(name: "AssetScore") double assetScore,
      @JsonKey(name: "Data") List<IrResponseProductData> data,
      @JsonKey(name: "Products") List<IrResponseProductData> products,
      @JsonKey(name: "KPIWeightage") List<IrKpiWeightage> kpiWeightage,
      @JsonKey(name: "Planogram") IrPlanogram? planogram,
      @JsonKey(name: "AssetName") String? assetName,
      @JsonKey(name: "EquipmentName") String? equipmentName});

  $IrPlanogramCopyWith<$Res>? get planogram;
}

/// @nodoc
class _$IrResponseModelCopyWithImpl<$Res>
    implements $IrResponseModelCopyWith<$Res> {
  _$IrResponseModelCopyWithImpl(this._self, this._then);

  final IrResponseModel _self;
  final $Res Function(IrResponseModel) _then;

  /// Create a copy of IrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageURL = null,
    Object? brandSkuCount = null,
    Object? totalObjectCount = null,
    Object? shelfShare = null,
    Object? shelfSharePercent = null,
    Object? assetScore = null,
    Object? data = null,
    Object? products = null,
    Object? kpiWeightage = null,
    Object? planogram = freezed,
    Object? assetName = freezed,
    Object? equipmentName = freezed,
  }) {
    return _then(_self.copyWith(
      imageURL: null == imageURL
          ? _self.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      brandSkuCount: null == brandSkuCount
          ? _self.brandSkuCount
          : brandSkuCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalObjectCount: null == totalObjectCount
          ? _self.totalObjectCount
          : totalObjectCount // ignore: cast_nullable_to_non_nullable
              as int,
      shelfShare: null == shelfShare
          ? _self.shelfShare
          : shelfShare // ignore: cast_nullable_to_non_nullable
              as int,
      shelfSharePercent: null == shelfSharePercent
          ? _self.shelfSharePercent
          : shelfSharePercent // ignore: cast_nullable_to_non_nullable
              as double,
      assetScore: null == assetScore
          ? _self.assetScore
          : assetScore // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<IrResponseProductData>,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<IrResponseProductData>,
      kpiWeightage: null == kpiWeightage
          ? _self.kpiWeightage
          : kpiWeightage // ignore: cast_nullable_to_non_nullable
              as List<IrKpiWeightage>,
      planogram: freezed == planogram
          ? _self.planogram
          : planogram // ignore: cast_nullable_to_non_nullable
              as IrPlanogram?,
      assetName: freezed == assetName
          ? _self.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String?,
      equipmentName: freezed == equipmentName
          ? _self.equipmentName
          : equipmentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of IrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IrPlanogramCopyWith<$Res>? get planogram {
    if (_self.planogram == null) {
      return null;
    }

    return $IrPlanogramCopyWith<$Res>(_self.planogram!, (value) {
      return _then(_self.copyWith(planogram: value));
    });
  }
}

/// Adds pattern-matching-related methods to [IrResponseModel].
extension IrResponseModelPatterns on IrResponseModel {
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
    TResult Function(_IrResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrResponseModel() when $default != null:
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
    TResult Function(_IrResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseModel():
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
    TResult? Function(_IrResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseModel() when $default != null:
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
            @JsonKey(name: "ImageURL") String imageURL,
            @JsonKey(name: "BrandSkuCount") int brandSkuCount,
            @JsonKey(name: "TotalObjectCount") int totalObjectCount,
            @JsonKey(name: "ShelfShare") int shelfShare,
            @JsonKey(name: "ShelfSharePercent") double shelfSharePercent,
            @JsonKey(name: "AssetScore") double assetScore,
            @JsonKey(name: "Data") List<IrResponseProductData> data,
            @JsonKey(name: "Products") List<IrResponseProductData> products,
            @JsonKey(name: "KPIWeightage") List<IrKpiWeightage> kpiWeightage,
            @JsonKey(name: "Planogram") IrPlanogram? planogram,
            @JsonKey(name: "AssetName") String? assetName,
            @JsonKey(name: "EquipmentName") String? equipmentName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrResponseModel() when $default != null:
        return $default(
            _that.imageURL,
            _that.brandSkuCount,
            _that.totalObjectCount,
            _that.shelfShare,
            _that.shelfSharePercent,
            _that.assetScore,
            _that.data,
            _that.products,
            _that.kpiWeightage,
            _that.planogram,
            _that.assetName,
            _that.equipmentName);
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
            @JsonKey(name: "ImageURL") String imageURL,
            @JsonKey(name: "BrandSkuCount") int brandSkuCount,
            @JsonKey(name: "TotalObjectCount") int totalObjectCount,
            @JsonKey(name: "ShelfShare") int shelfShare,
            @JsonKey(name: "ShelfSharePercent") double shelfSharePercent,
            @JsonKey(name: "AssetScore") double assetScore,
            @JsonKey(name: "Data") List<IrResponseProductData> data,
            @JsonKey(name: "Products") List<IrResponseProductData> products,
            @JsonKey(name: "KPIWeightage") List<IrKpiWeightage> kpiWeightage,
            @JsonKey(name: "Planogram") IrPlanogram? planogram,
            @JsonKey(name: "AssetName") String? assetName,
            @JsonKey(name: "EquipmentName") String? equipmentName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseModel():
        return $default(
            _that.imageURL,
            _that.brandSkuCount,
            _that.totalObjectCount,
            _that.shelfShare,
            _that.shelfSharePercent,
            _that.assetScore,
            _that.data,
            _that.products,
            _that.kpiWeightage,
            _that.planogram,
            _that.assetName,
            _that.equipmentName);
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
            @JsonKey(name: "ImageURL") String imageURL,
            @JsonKey(name: "BrandSkuCount") int brandSkuCount,
            @JsonKey(name: "TotalObjectCount") int totalObjectCount,
            @JsonKey(name: "ShelfShare") int shelfShare,
            @JsonKey(name: "ShelfSharePercent") double shelfSharePercent,
            @JsonKey(name: "AssetScore") double assetScore,
            @JsonKey(name: "Data") List<IrResponseProductData> data,
            @JsonKey(name: "Products") List<IrResponseProductData> products,
            @JsonKey(name: "KPIWeightage") List<IrKpiWeightage> kpiWeightage,
            @JsonKey(name: "Planogram") IrPlanogram? planogram,
            @JsonKey(name: "AssetName") String? assetName,
            @JsonKey(name: "EquipmentName") String? equipmentName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrResponseModel() when $default != null:
        return $default(
            _that.imageURL,
            _that.brandSkuCount,
            _that.totalObjectCount,
            _that.shelfShare,
            _that.shelfSharePercent,
            _that.assetScore,
            _that.data,
            _that.products,
            _that.kpiWeightage,
            _that.planogram,
            _that.assetName,
            _that.equipmentName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrResponseModel implements IrResponseModel {
  _IrResponseModel(
      {@JsonKey(name: "ImageURL") this.imageURL = "",
      @JsonKey(name: "BrandSkuCount") this.brandSkuCount = 0,
      @JsonKey(name: "TotalObjectCount") this.totalObjectCount = 0,
      @JsonKey(name: "ShelfShare") this.shelfShare = 0,
      @JsonKey(name: "ShelfSharePercent") this.shelfSharePercent = 0,
      @JsonKey(name: "AssetScore") this.assetScore = 0,
      @JsonKey(name: "Data") this.data = const [],
      @JsonKey(name: "Products") this.products = const [],
      @JsonKey(name: "KPIWeightage") this.kpiWeightage = const [],
      @JsonKey(name: "Planogram") this.planogram,
      @JsonKey(name: "AssetName") this.assetName,
      @JsonKey(name: "EquipmentName") this.equipmentName});
  factory _IrResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IrResponseModelFromJson(json);

  @override
  @JsonKey(name: "ImageURL")
  final String imageURL;
  @override
  @JsonKey(name: "BrandSkuCount")
  final int brandSkuCount;
  @override
  @JsonKey(name: "TotalObjectCount")
  final int totalObjectCount;
  @override
  @JsonKey(name: "ShelfShare")
  final int shelfShare;
  @override
  @JsonKey(name: "ShelfSharePercent")
  final double shelfSharePercent;
  @override
  @JsonKey(name: "AssetScore")
  final double assetScore;
  @override
  @JsonKey(name: "Data")
  final List<IrResponseProductData> data;
  @override
  @JsonKey(name: "Products")
  final List<IrResponseProductData> products;
  @override
  @JsonKey(name: "KPIWeightage")
  final List<IrKpiWeightage> kpiWeightage;
  @override
  @JsonKey(name: "Planogram")
  final IrPlanogram? planogram;
  @override
  @JsonKey(name: "AssetName")
  final String? assetName;
  @override
  @JsonKey(name: "EquipmentName")
  final String? equipmentName;

  /// Create a copy of IrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrResponseModelCopyWith<_IrResponseModel> get copyWith =>
      __$IrResponseModelCopyWithImpl<_IrResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrResponseModel &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.brandSkuCount, brandSkuCount) ||
                other.brandSkuCount == brandSkuCount) &&
            (identical(other.totalObjectCount, totalObjectCount) ||
                other.totalObjectCount == totalObjectCount) &&
            (identical(other.shelfShare, shelfShare) ||
                other.shelfShare == shelfShare) &&
            (identical(other.shelfSharePercent, shelfSharePercent) ||
                other.shelfSharePercent == shelfSharePercent) &&
            (identical(other.assetScore, assetScore) ||
                other.assetScore == assetScore) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.kpiWeightage, kpiWeightage) &&
            (identical(other.planogram, planogram) ||
                other.planogram == planogram) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.equipmentName, equipmentName) ||
                other.equipmentName == equipmentName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      imageURL,
      brandSkuCount,
      totalObjectCount,
      shelfShare,
      shelfSharePercent,
      assetScore,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(kpiWeightage),
      planogram,
      assetName,
      equipmentName);

  @override
  String toString() {
    return 'IrResponseModel(imageURL: $imageURL, brandSkuCount: $brandSkuCount, totalObjectCount: $totalObjectCount, shelfShare: $shelfShare, shelfSharePercent: $shelfSharePercent, assetScore: $assetScore, data: $data, products: $products, kpiWeightage: $kpiWeightage, planogram: $planogram, assetName: $assetName, equipmentName: $equipmentName)';
  }
}

/// @nodoc
abstract mixin class _$IrResponseModelCopyWith<$Res>
    implements $IrResponseModelCopyWith<$Res> {
  factory _$IrResponseModelCopyWith(
          _IrResponseModel value, $Res Function(_IrResponseModel) _then) =
      __$IrResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ImageURL") String imageURL,
      @JsonKey(name: "BrandSkuCount") int brandSkuCount,
      @JsonKey(name: "TotalObjectCount") int totalObjectCount,
      @JsonKey(name: "ShelfShare") int shelfShare,
      @JsonKey(name: "ShelfSharePercent") double shelfSharePercent,
      @JsonKey(name: "AssetScore") double assetScore,
      @JsonKey(name: "Data") List<IrResponseProductData> data,
      @JsonKey(name: "Products") List<IrResponseProductData> products,
      @JsonKey(name: "KPIWeightage") List<IrKpiWeightage> kpiWeightage,
      @JsonKey(name: "Planogram") IrPlanogram? planogram,
      @JsonKey(name: "AssetName") String? assetName,
      @JsonKey(name: "EquipmentName") String? equipmentName});

  @override
  $IrPlanogramCopyWith<$Res>? get planogram;
}

/// @nodoc
class __$IrResponseModelCopyWithImpl<$Res>
    implements _$IrResponseModelCopyWith<$Res> {
  __$IrResponseModelCopyWithImpl(this._self, this._then);

  final _IrResponseModel _self;
  final $Res Function(_IrResponseModel) _then;

  /// Create a copy of IrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageURL = null,
    Object? brandSkuCount = null,
    Object? totalObjectCount = null,
    Object? shelfShare = null,
    Object? shelfSharePercent = null,
    Object? assetScore = null,
    Object? data = null,
    Object? products = null,
    Object? kpiWeightage = null,
    Object? planogram = freezed,
    Object? assetName = freezed,
    Object? equipmentName = freezed,
  }) {
    return _then(_IrResponseModel(
      imageURL: null == imageURL
          ? _self.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      brandSkuCount: null == brandSkuCount
          ? _self.brandSkuCount
          : brandSkuCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalObjectCount: null == totalObjectCount
          ? _self.totalObjectCount
          : totalObjectCount // ignore: cast_nullable_to_non_nullable
              as int,
      shelfShare: null == shelfShare
          ? _self.shelfShare
          : shelfShare // ignore: cast_nullable_to_non_nullable
              as int,
      shelfSharePercent: null == shelfSharePercent
          ? _self.shelfSharePercent
          : shelfSharePercent // ignore: cast_nullable_to_non_nullable
              as double,
      assetScore: null == assetScore
          ? _self.assetScore
          : assetScore // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<IrResponseProductData>,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<IrResponseProductData>,
      kpiWeightage: null == kpiWeightage
          ? _self.kpiWeightage
          : kpiWeightage // ignore: cast_nullable_to_non_nullable
              as List<IrKpiWeightage>,
      planogram: freezed == planogram
          ? _self.planogram
          : planogram // ignore: cast_nullable_to_non_nullable
              as IrPlanogram?,
      assetName: freezed == assetName
          ? _self.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String?,
      equipmentName: freezed == equipmentName
          ? _self.equipmentName
          : equipmentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of IrResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IrPlanogramCopyWith<$Res>? get planogram {
    if (_self.planogram == null) {
      return null;
    }

    return $IrPlanogramCopyWith<$Res>(_self.planogram!, (value) {
      return _then(_self.copyWith(planogram: value));
    });
  }
}

// dart format on
