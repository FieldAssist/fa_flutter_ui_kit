// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compliance_score_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComplianceScoreData {
  num? get mustSellSkuPercentage;
  num? get sosPercentage;
  num? get premiumSkuPercentage;
  num? get coolerPurityPercentage;
  num? get mustSellSkuScore;
  num? get sosScore;
  num? get premiumSkuScore;
  num? get outletScore;
  num? get posmScore;
  num? get coolerPurityScore;
  num? get eoeScore;
  num? get sosVisibilityScore;
  @JsonKey(name: "AttendanceGuid")
  String? get attendanceGuid;
  @JsonKey(name: 'AssetLevelScoreData')
  List<AssetLevelScoreData>? get assetLevelScoreData;
  @JsonKey(name: 'UserType')
  int? get userType;
  @JsonKey(name: 'OutletId')
  int? get outletId;

  /// Create a copy of ComplianceScoreData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComplianceScoreDataCopyWith<ComplianceScoreData> get copyWith =>
      _$ComplianceScoreDataCopyWithImpl<ComplianceScoreData>(
          this as ComplianceScoreData, _$identity);

  /// Serializes this ComplianceScoreData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComplianceScoreData &&
            (identical(other.mustSellSkuPercentage, mustSellSkuPercentage) ||
                other.mustSellSkuPercentage == mustSellSkuPercentage) &&
            (identical(other.sosPercentage, sosPercentage) ||
                other.sosPercentage == sosPercentage) &&
            (identical(other.premiumSkuPercentage, premiumSkuPercentage) ||
                other.premiumSkuPercentage == premiumSkuPercentage) &&
            (identical(other.coolerPurityPercentage, coolerPurityPercentage) ||
                other.coolerPurityPercentage == coolerPurityPercentage) &&
            (identical(other.mustSellSkuScore, mustSellSkuScore) ||
                other.mustSellSkuScore == mustSellSkuScore) &&
            (identical(other.sosScore, sosScore) ||
                other.sosScore == sosScore) &&
            (identical(other.premiumSkuScore, premiumSkuScore) ||
                other.premiumSkuScore == premiumSkuScore) &&
            (identical(other.outletScore, outletScore) ||
                other.outletScore == outletScore) &&
            (identical(other.posmScore, posmScore) ||
                other.posmScore == posmScore) &&
            (identical(other.coolerPurityScore, coolerPurityScore) ||
                other.coolerPurityScore == coolerPurityScore) &&
            (identical(other.eoeScore, eoeScore) ||
                other.eoeScore == eoeScore) &&
            (identical(other.sosVisibilityScore, sosVisibilityScore) ||
                other.sosVisibilityScore == sosVisibilityScore) &&
            (identical(other.attendanceGuid, attendanceGuid) ||
                other.attendanceGuid == attendanceGuid) &&
            const DeepCollectionEquality()
                .equals(other.assetLevelScoreData, assetLevelScoreData) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mustSellSkuPercentage,
      sosPercentage,
      premiumSkuPercentage,
      coolerPurityPercentage,
      mustSellSkuScore,
      sosScore,
      premiumSkuScore,
      outletScore,
      posmScore,
      coolerPurityScore,
      eoeScore,
      sosVisibilityScore,
      attendanceGuid,
      const DeepCollectionEquality().hash(assetLevelScoreData),
      userType,
      outletId);

  @override
  String toString() {
    return 'ComplianceScoreData(mustSellSkuPercentage: $mustSellSkuPercentage, sosPercentage: $sosPercentage, premiumSkuPercentage: $premiumSkuPercentage, coolerPurityPercentage: $coolerPurityPercentage, mustSellSkuScore: $mustSellSkuScore, sosScore: $sosScore, premiumSkuScore: $premiumSkuScore, outletScore: $outletScore, posmScore: $posmScore, coolerPurityScore: $coolerPurityScore, eoeScore: $eoeScore, sosVisibilityScore: $sosVisibilityScore, attendanceGuid: $attendanceGuid, assetLevelScoreData: $assetLevelScoreData, userType: $userType, outletId: $outletId)';
  }
}

/// @nodoc
abstract mixin class $ComplianceScoreDataCopyWith<$Res> {
  factory $ComplianceScoreDataCopyWith(
          ComplianceScoreData value, $Res Function(ComplianceScoreData) _then) =
      _$ComplianceScoreDataCopyWithImpl;
  @useResult
  $Res call(
      {num? mustSellSkuPercentage,
      num? sosPercentage,
      num? premiumSkuPercentage,
      num? coolerPurityPercentage,
      num? mustSellSkuScore,
      num? sosScore,
      num? premiumSkuScore,
      num? outletScore,
      num? posmScore,
      num? coolerPurityScore,
      num? eoeScore,
      num? sosVisibilityScore,
      @JsonKey(name: "AttendanceGuid") String? attendanceGuid,
      @JsonKey(name: 'AssetLevelScoreData')
      List<AssetLevelScoreData>? assetLevelScoreData,
      @JsonKey(name: 'UserType') int? userType,
      @JsonKey(name: 'OutletId') int? outletId});
}

/// @nodoc
class _$ComplianceScoreDataCopyWithImpl<$Res>
    implements $ComplianceScoreDataCopyWith<$Res> {
  _$ComplianceScoreDataCopyWithImpl(this._self, this._then);

  final ComplianceScoreData _self;
  final $Res Function(ComplianceScoreData) _then;

  /// Create a copy of ComplianceScoreData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mustSellSkuPercentage = freezed,
    Object? sosPercentage = freezed,
    Object? premiumSkuPercentage = freezed,
    Object? coolerPurityPercentage = freezed,
    Object? mustSellSkuScore = freezed,
    Object? sosScore = freezed,
    Object? premiumSkuScore = freezed,
    Object? outletScore = freezed,
    Object? posmScore = freezed,
    Object? coolerPurityScore = freezed,
    Object? eoeScore = freezed,
    Object? sosVisibilityScore = freezed,
    Object? attendanceGuid = freezed,
    Object? assetLevelScoreData = freezed,
    Object? userType = freezed,
    Object? outletId = freezed,
  }) {
    return _then(_self.copyWith(
      mustSellSkuPercentage: freezed == mustSellSkuPercentage
          ? _self.mustSellSkuPercentage
          : mustSellSkuPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      sosPercentage: freezed == sosPercentage
          ? _self.sosPercentage
          : sosPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      premiumSkuPercentage: freezed == premiumSkuPercentage
          ? _self.premiumSkuPercentage
          : premiumSkuPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      coolerPurityPercentage: freezed == coolerPurityPercentage
          ? _self.coolerPurityPercentage
          : coolerPurityPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      mustSellSkuScore: freezed == mustSellSkuScore
          ? _self.mustSellSkuScore
          : mustSellSkuScore // ignore: cast_nullable_to_non_nullable
              as num?,
      sosScore: freezed == sosScore
          ? _self.sosScore
          : sosScore // ignore: cast_nullable_to_non_nullable
              as num?,
      premiumSkuScore: freezed == premiumSkuScore
          ? _self.premiumSkuScore
          : premiumSkuScore // ignore: cast_nullable_to_non_nullable
              as num?,
      outletScore: freezed == outletScore
          ? _self.outletScore
          : outletScore // ignore: cast_nullable_to_non_nullable
              as num?,
      posmScore: freezed == posmScore
          ? _self.posmScore
          : posmScore // ignore: cast_nullable_to_non_nullable
              as num?,
      coolerPurityScore: freezed == coolerPurityScore
          ? _self.coolerPurityScore
          : coolerPurityScore // ignore: cast_nullable_to_non_nullable
              as num?,
      eoeScore: freezed == eoeScore
          ? _self.eoeScore
          : eoeScore // ignore: cast_nullable_to_non_nullable
              as num?,
      sosVisibilityScore: freezed == sosVisibilityScore
          ? _self.sosVisibilityScore
          : sosVisibilityScore // ignore: cast_nullable_to_non_nullable
              as num?,
      attendanceGuid: freezed == attendanceGuid
          ? _self.attendanceGuid
          : attendanceGuid // ignore: cast_nullable_to_non_nullable
              as String?,
      assetLevelScoreData: freezed == assetLevelScoreData
          ? _self.assetLevelScoreData
          : assetLevelScoreData // ignore: cast_nullable_to_non_nullable
              as List<AssetLevelScoreData>?,
      userType: freezed == userType
          ? _self.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int?,
      outletId: freezed == outletId
          ? _self.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ComplianceScoreData].
extension ComplianceScoreDataPatterns on ComplianceScoreData {
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
    TResult Function(_ComplianceScoreData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ComplianceScoreData() when $default != null:
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
    TResult Function(_ComplianceScoreData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComplianceScoreData():
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
    TResult? Function(_ComplianceScoreData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComplianceScoreData() when $default != null:
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
            num? mustSellSkuPercentage,
            num? sosPercentage,
            num? premiumSkuPercentage,
            num? coolerPurityPercentage,
            num? mustSellSkuScore,
            num? sosScore,
            num? premiumSkuScore,
            num? outletScore,
            num? posmScore,
            num? coolerPurityScore,
            num? eoeScore,
            num? sosVisibilityScore,
            @JsonKey(name: "AttendanceGuid") String? attendanceGuid,
            @JsonKey(name: 'AssetLevelScoreData')
            List<AssetLevelScoreData>? assetLevelScoreData,
            @JsonKey(name: 'UserType') int? userType,
            @JsonKey(name: 'OutletId') int? outletId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ComplianceScoreData() when $default != null:
        return $default(
            _that.mustSellSkuPercentage,
            _that.sosPercentage,
            _that.premiumSkuPercentage,
            _that.coolerPurityPercentage,
            _that.mustSellSkuScore,
            _that.sosScore,
            _that.premiumSkuScore,
            _that.outletScore,
            _that.posmScore,
            _that.coolerPurityScore,
            _that.eoeScore,
            _that.sosVisibilityScore,
            _that.attendanceGuid,
            _that.assetLevelScoreData,
            _that.userType,
            _that.outletId);
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
            num? mustSellSkuPercentage,
            num? sosPercentage,
            num? premiumSkuPercentage,
            num? coolerPurityPercentage,
            num? mustSellSkuScore,
            num? sosScore,
            num? premiumSkuScore,
            num? outletScore,
            num? posmScore,
            num? coolerPurityScore,
            num? eoeScore,
            num? sosVisibilityScore,
            @JsonKey(name: "AttendanceGuid") String? attendanceGuid,
            @JsonKey(name: 'AssetLevelScoreData')
            List<AssetLevelScoreData>? assetLevelScoreData,
            @JsonKey(name: 'UserType') int? userType,
            @JsonKey(name: 'OutletId') int? outletId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComplianceScoreData():
        return $default(
            _that.mustSellSkuPercentage,
            _that.sosPercentage,
            _that.premiumSkuPercentage,
            _that.coolerPurityPercentage,
            _that.mustSellSkuScore,
            _that.sosScore,
            _that.premiumSkuScore,
            _that.outletScore,
            _that.posmScore,
            _that.coolerPurityScore,
            _that.eoeScore,
            _that.sosVisibilityScore,
            _that.attendanceGuid,
            _that.assetLevelScoreData,
            _that.userType,
            _that.outletId);
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
            num? mustSellSkuPercentage,
            num? sosPercentage,
            num? premiumSkuPercentage,
            num? coolerPurityPercentage,
            num? mustSellSkuScore,
            num? sosScore,
            num? premiumSkuScore,
            num? outletScore,
            num? posmScore,
            num? coolerPurityScore,
            num? eoeScore,
            num? sosVisibilityScore,
            @JsonKey(name: "AttendanceGuid") String? attendanceGuid,
            @JsonKey(name: 'AssetLevelScoreData')
            List<AssetLevelScoreData>? assetLevelScoreData,
            @JsonKey(name: 'UserType') int? userType,
            @JsonKey(name: 'OutletId') int? outletId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComplianceScoreData() when $default != null:
        return $default(
            _that.mustSellSkuPercentage,
            _that.sosPercentage,
            _that.premiumSkuPercentage,
            _that.coolerPurityPercentage,
            _that.mustSellSkuScore,
            _that.sosScore,
            _that.premiumSkuScore,
            _that.outletScore,
            _that.posmScore,
            _that.coolerPurityScore,
            _that.eoeScore,
            _that.sosVisibilityScore,
            _that.attendanceGuid,
            _that.assetLevelScoreData,
            _that.userType,
            _that.outletId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ComplianceScoreData implements ComplianceScoreData {
  _ComplianceScoreData(
      {this.mustSellSkuPercentage,
      this.sosPercentage,
      this.premiumSkuPercentage,
      this.coolerPurityPercentage,
      this.mustSellSkuScore,
      this.sosScore,
      this.premiumSkuScore,
      this.outletScore,
      this.posmScore,
      this.coolerPurityScore,
      this.eoeScore,
      this.sosVisibilityScore,
      @JsonKey(name: "AttendanceGuid") this.attendanceGuid,
      @JsonKey(name: 'AssetLevelScoreData') this.assetLevelScoreData,
      @JsonKey(name: 'UserType') this.userType,
      @JsonKey(name: 'OutletId') this.outletId});
  factory _ComplianceScoreData.fromJson(Map<String, dynamic> json) =>
      _$ComplianceScoreDataFromJson(json);

  @override
  final num? mustSellSkuPercentage;
  @override
  final num? sosPercentage;
  @override
  final num? premiumSkuPercentage;
  @override
  final num? coolerPurityPercentage;
  @override
  final num? mustSellSkuScore;
  @override
  final num? sosScore;
  @override
  final num? premiumSkuScore;
  @override
  final num? outletScore;
  @override
  final num? posmScore;
  @override
  final num? coolerPurityScore;
  @override
  final num? eoeScore;
  @override
  final num? sosVisibilityScore;
  @override
  @JsonKey(name: "AttendanceGuid")
  final String? attendanceGuid;
  @override
  @JsonKey(name: 'AssetLevelScoreData')
  final List<AssetLevelScoreData>? assetLevelScoreData;
  @override
  @JsonKey(name: 'UserType')
  final int? userType;
  @override
  @JsonKey(name: 'OutletId')
  final int? outletId;

  /// Create a copy of ComplianceScoreData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ComplianceScoreDataCopyWith<_ComplianceScoreData> get copyWith =>
      __$ComplianceScoreDataCopyWithImpl<_ComplianceScoreData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ComplianceScoreDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ComplianceScoreData &&
            (identical(other.mustSellSkuPercentage, mustSellSkuPercentage) ||
                other.mustSellSkuPercentage == mustSellSkuPercentage) &&
            (identical(other.sosPercentage, sosPercentage) ||
                other.sosPercentage == sosPercentage) &&
            (identical(other.premiumSkuPercentage, premiumSkuPercentage) ||
                other.premiumSkuPercentage == premiumSkuPercentage) &&
            (identical(other.coolerPurityPercentage, coolerPurityPercentage) ||
                other.coolerPurityPercentage == coolerPurityPercentage) &&
            (identical(other.mustSellSkuScore, mustSellSkuScore) ||
                other.mustSellSkuScore == mustSellSkuScore) &&
            (identical(other.sosScore, sosScore) ||
                other.sosScore == sosScore) &&
            (identical(other.premiumSkuScore, premiumSkuScore) ||
                other.premiumSkuScore == premiumSkuScore) &&
            (identical(other.outletScore, outletScore) ||
                other.outletScore == outletScore) &&
            (identical(other.posmScore, posmScore) ||
                other.posmScore == posmScore) &&
            (identical(other.coolerPurityScore, coolerPurityScore) ||
                other.coolerPurityScore == coolerPurityScore) &&
            (identical(other.eoeScore, eoeScore) ||
                other.eoeScore == eoeScore) &&
            (identical(other.sosVisibilityScore, sosVisibilityScore) ||
                other.sosVisibilityScore == sosVisibilityScore) &&
            (identical(other.attendanceGuid, attendanceGuid) ||
                other.attendanceGuid == attendanceGuid) &&
            const DeepCollectionEquality()
                .equals(other.assetLevelScoreData, assetLevelScoreData) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mustSellSkuPercentage,
      sosPercentage,
      premiumSkuPercentage,
      coolerPurityPercentage,
      mustSellSkuScore,
      sosScore,
      premiumSkuScore,
      outletScore,
      posmScore,
      coolerPurityScore,
      eoeScore,
      sosVisibilityScore,
      attendanceGuid,
      const DeepCollectionEquality().hash(assetLevelScoreData),
      userType,
      outletId);

  @override
  String toString() {
    return 'ComplianceScoreData(mustSellSkuPercentage: $mustSellSkuPercentage, sosPercentage: $sosPercentage, premiumSkuPercentage: $premiumSkuPercentage, coolerPurityPercentage: $coolerPurityPercentage, mustSellSkuScore: $mustSellSkuScore, sosScore: $sosScore, premiumSkuScore: $premiumSkuScore, outletScore: $outletScore, posmScore: $posmScore, coolerPurityScore: $coolerPurityScore, eoeScore: $eoeScore, sosVisibilityScore: $sosVisibilityScore, attendanceGuid: $attendanceGuid, assetLevelScoreData: $assetLevelScoreData, userType: $userType, outletId: $outletId)';
  }
}

/// @nodoc
abstract mixin class _$ComplianceScoreDataCopyWith<$Res>
    implements $ComplianceScoreDataCopyWith<$Res> {
  factory _$ComplianceScoreDataCopyWith(_ComplianceScoreData value,
          $Res Function(_ComplianceScoreData) _then) =
      __$ComplianceScoreDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {num? mustSellSkuPercentage,
      num? sosPercentage,
      num? premiumSkuPercentage,
      num? coolerPurityPercentage,
      num? mustSellSkuScore,
      num? sosScore,
      num? premiumSkuScore,
      num? outletScore,
      num? posmScore,
      num? coolerPurityScore,
      num? eoeScore,
      num? sosVisibilityScore,
      @JsonKey(name: "AttendanceGuid") String? attendanceGuid,
      @JsonKey(name: 'AssetLevelScoreData')
      List<AssetLevelScoreData>? assetLevelScoreData,
      @JsonKey(name: 'UserType') int? userType,
      @JsonKey(name: 'OutletId') int? outletId});
}

/// @nodoc
class __$ComplianceScoreDataCopyWithImpl<$Res>
    implements _$ComplianceScoreDataCopyWith<$Res> {
  __$ComplianceScoreDataCopyWithImpl(this._self, this._then);

  final _ComplianceScoreData _self;
  final $Res Function(_ComplianceScoreData) _then;

  /// Create a copy of ComplianceScoreData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mustSellSkuPercentage = freezed,
    Object? sosPercentage = freezed,
    Object? premiumSkuPercentage = freezed,
    Object? coolerPurityPercentage = freezed,
    Object? mustSellSkuScore = freezed,
    Object? sosScore = freezed,
    Object? premiumSkuScore = freezed,
    Object? outletScore = freezed,
    Object? posmScore = freezed,
    Object? coolerPurityScore = freezed,
    Object? eoeScore = freezed,
    Object? sosVisibilityScore = freezed,
    Object? attendanceGuid = freezed,
    Object? assetLevelScoreData = freezed,
    Object? userType = freezed,
    Object? outletId = freezed,
  }) {
    return _then(_ComplianceScoreData(
      mustSellSkuPercentage: freezed == mustSellSkuPercentage
          ? _self.mustSellSkuPercentage
          : mustSellSkuPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      sosPercentage: freezed == sosPercentage
          ? _self.sosPercentage
          : sosPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      premiumSkuPercentage: freezed == premiumSkuPercentage
          ? _self.premiumSkuPercentage
          : premiumSkuPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      coolerPurityPercentage: freezed == coolerPurityPercentage
          ? _self.coolerPurityPercentage
          : coolerPurityPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      mustSellSkuScore: freezed == mustSellSkuScore
          ? _self.mustSellSkuScore
          : mustSellSkuScore // ignore: cast_nullable_to_non_nullable
              as num?,
      sosScore: freezed == sosScore
          ? _self.sosScore
          : sosScore // ignore: cast_nullable_to_non_nullable
              as num?,
      premiumSkuScore: freezed == premiumSkuScore
          ? _self.premiumSkuScore
          : premiumSkuScore // ignore: cast_nullable_to_non_nullable
              as num?,
      outletScore: freezed == outletScore
          ? _self.outletScore
          : outletScore // ignore: cast_nullable_to_non_nullable
              as num?,
      posmScore: freezed == posmScore
          ? _self.posmScore
          : posmScore // ignore: cast_nullable_to_non_nullable
              as num?,
      coolerPurityScore: freezed == coolerPurityScore
          ? _self.coolerPurityScore
          : coolerPurityScore // ignore: cast_nullable_to_non_nullable
              as num?,
      eoeScore: freezed == eoeScore
          ? _self.eoeScore
          : eoeScore // ignore: cast_nullable_to_non_nullable
              as num?,
      sosVisibilityScore: freezed == sosVisibilityScore
          ? _self.sosVisibilityScore
          : sosVisibilityScore // ignore: cast_nullable_to_non_nullable
              as num?,
      attendanceGuid: freezed == attendanceGuid
          ? _self.attendanceGuid
          : attendanceGuid // ignore: cast_nullable_to_non_nullable
              as String?,
      assetLevelScoreData: freezed == assetLevelScoreData
          ? _self.assetLevelScoreData
          : assetLevelScoreData // ignore: cast_nullable_to_non_nullable
              as List<AssetLevelScoreData>?,
      userType: freezed == userType
          ? _self.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int?,
      outletId: freezed == outletId
          ? _self.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$AssetLevelScoreData {
  @JsonKey(name: 'AssetId')
  int? get assetId;
  @JsonKey(name: 'EquipmentId')
  int? get equipmentId;
  @JsonKey(name: 'PlanogramComplianceStatus')
  int? get planogramComplianceStatus;
  @JsonKey(name: 'PlanogramCompliancePercentage')
  double? get planogramCompliancePercentage;
  @JsonKey(name: 'AssetScore')
  double? get assetScore;

  /// Create a copy of AssetLevelScoreData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssetLevelScoreDataCopyWith<AssetLevelScoreData> get copyWith =>
      _$AssetLevelScoreDataCopyWithImpl<AssetLevelScoreData>(
          this as AssetLevelScoreData, _$identity);

  /// Serializes this AssetLevelScoreData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetLevelScoreData &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.equipmentId, equipmentId) ||
                other.equipmentId == equipmentId) &&
            (identical(other.planogramComplianceStatus,
                    planogramComplianceStatus) ||
                other.planogramComplianceStatus == planogramComplianceStatus) &&
            (identical(other.planogramCompliancePercentage,
                    planogramCompliancePercentage) ||
                other.planogramCompliancePercentage ==
                    planogramCompliancePercentage) &&
            (identical(other.assetScore, assetScore) ||
                other.assetScore == assetScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, assetId, equipmentId,
      planogramComplianceStatus, planogramCompliancePercentage, assetScore);

  @override
  String toString() {
    return 'AssetLevelScoreData(assetId: $assetId, equipmentId: $equipmentId, planogramComplianceStatus: $planogramComplianceStatus, planogramCompliancePercentage: $planogramCompliancePercentage, assetScore: $assetScore)';
  }
}

/// @nodoc
abstract mixin class $AssetLevelScoreDataCopyWith<$Res> {
  factory $AssetLevelScoreDataCopyWith(
          AssetLevelScoreData value, $Res Function(AssetLevelScoreData) _then) =
      _$AssetLevelScoreDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'AssetId') int? assetId,
      @JsonKey(name: 'EquipmentId') int? equipmentId,
      @JsonKey(name: 'PlanogramComplianceStatus')
      int? planogramComplianceStatus,
      @JsonKey(name: 'PlanogramCompliancePercentage')
      double? planogramCompliancePercentage,
      @JsonKey(name: 'AssetScore') double? assetScore});
}

/// @nodoc
class _$AssetLevelScoreDataCopyWithImpl<$Res>
    implements $AssetLevelScoreDataCopyWith<$Res> {
  _$AssetLevelScoreDataCopyWithImpl(this._self, this._then);

  final AssetLevelScoreData _self;
  final $Res Function(AssetLevelScoreData) _then;

  /// Create a copy of AssetLevelScoreData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetId = freezed,
    Object? equipmentId = freezed,
    Object? planogramComplianceStatus = freezed,
    Object? planogramCompliancePercentage = freezed,
    Object? assetScore = freezed,
  }) {
    return _then(_self.copyWith(
      assetId: freezed == assetId
          ? _self.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int?,
      equipmentId: freezed == equipmentId
          ? _self.equipmentId
          : equipmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      planogramComplianceStatus: freezed == planogramComplianceStatus
          ? _self.planogramComplianceStatus
          : planogramComplianceStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      planogramCompliancePercentage: freezed == planogramCompliancePercentage
          ? _self.planogramCompliancePercentage
          : planogramCompliancePercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      assetScore: freezed == assetScore
          ? _self.assetScore
          : assetScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssetLevelScoreData].
extension AssetLevelScoreDataPatterns on AssetLevelScoreData {
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
    TResult Function(_AssetLevelScoreData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssetLevelScoreData() when $default != null:
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
    TResult Function(_AssetLevelScoreData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetLevelScoreData():
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
    TResult? Function(_AssetLevelScoreData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetLevelScoreData() when $default != null:
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
            @JsonKey(name: 'AssetId') int? assetId,
            @JsonKey(name: 'EquipmentId') int? equipmentId,
            @JsonKey(name: 'PlanogramComplianceStatus')
            int? planogramComplianceStatus,
            @JsonKey(name: 'PlanogramCompliancePercentage')
            double? planogramCompliancePercentage,
            @JsonKey(name: 'AssetScore') double? assetScore)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssetLevelScoreData() when $default != null:
        return $default(
            _that.assetId,
            _that.equipmentId,
            _that.planogramComplianceStatus,
            _that.planogramCompliancePercentage,
            _that.assetScore);
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
            @JsonKey(name: 'AssetId') int? assetId,
            @JsonKey(name: 'EquipmentId') int? equipmentId,
            @JsonKey(name: 'PlanogramComplianceStatus')
            int? planogramComplianceStatus,
            @JsonKey(name: 'PlanogramCompliancePercentage')
            double? planogramCompliancePercentage,
            @JsonKey(name: 'AssetScore') double? assetScore)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetLevelScoreData():
        return $default(
            _that.assetId,
            _that.equipmentId,
            _that.planogramComplianceStatus,
            _that.planogramCompliancePercentage,
            _that.assetScore);
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
            @JsonKey(name: 'AssetId') int? assetId,
            @JsonKey(name: 'EquipmentId') int? equipmentId,
            @JsonKey(name: 'PlanogramComplianceStatus')
            int? planogramComplianceStatus,
            @JsonKey(name: 'PlanogramCompliancePercentage')
            double? planogramCompliancePercentage,
            @JsonKey(name: 'AssetScore') double? assetScore)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetLevelScoreData() when $default != null:
        return $default(
            _that.assetId,
            _that.equipmentId,
            _that.planogramComplianceStatus,
            _that.planogramCompliancePercentage,
            _that.assetScore);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AssetLevelScoreData implements AssetLevelScoreData {
  _AssetLevelScoreData(
      {@JsonKey(name: 'AssetId') this.assetId,
      @JsonKey(name: 'EquipmentId') this.equipmentId,
      @JsonKey(name: 'PlanogramComplianceStatus')
      this.planogramComplianceStatus,
      @JsonKey(name: 'PlanogramCompliancePercentage')
      this.planogramCompliancePercentage,
      @JsonKey(name: 'AssetScore') this.assetScore});
  factory _AssetLevelScoreData.fromJson(Map<String, dynamic> json) =>
      _$AssetLevelScoreDataFromJson(json);

  @override
  @JsonKey(name: 'AssetId')
  final int? assetId;
  @override
  @JsonKey(name: 'EquipmentId')
  final int? equipmentId;
  @override
  @JsonKey(name: 'PlanogramComplianceStatus')
  final int? planogramComplianceStatus;
  @override
  @JsonKey(name: 'PlanogramCompliancePercentage')
  final double? planogramCompliancePercentage;
  @override
  @JsonKey(name: 'AssetScore')
  final double? assetScore;

  /// Create a copy of AssetLevelScoreData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssetLevelScoreDataCopyWith<_AssetLevelScoreData> get copyWith =>
      __$AssetLevelScoreDataCopyWithImpl<_AssetLevelScoreData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AssetLevelScoreDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssetLevelScoreData &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.equipmentId, equipmentId) ||
                other.equipmentId == equipmentId) &&
            (identical(other.planogramComplianceStatus,
                    planogramComplianceStatus) ||
                other.planogramComplianceStatus == planogramComplianceStatus) &&
            (identical(other.planogramCompliancePercentage,
                    planogramCompliancePercentage) ||
                other.planogramCompliancePercentage ==
                    planogramCompliancePercentage) &&
            (identical(other.assetScore, assetScore) ||
                other.assetScore == assetScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, assetId, equipmentId,
      planogramComplianceStatus, planogramCompliancePercentage, assetScore);

  @override
  String toString() {
    return 'AssetLevelScoreData(assetId: $assetId, equipmentId: $equipmentId, planogramComplianceStatus: $planogramComplianceStatus, planogramCompliancePercentage: $planogramCompliancePercentage, assetScore: $assetScore)';
  }
}

/// @nodoc
abstract mixin class _$AssetLevelScoreDataCopyWith<$Res>
    implements $AssetLevelScoreDataCopyWith<$Res> {
  factory _$AssetLevelScoreDataCopyWith(_AssetLevelScoreData value,
          $Res Function(_AssetLevelScoreData) _then) =
      __$AssetLevelScoreDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AssetId') int? assetId,
      @JsonKey(name: 'EquipmentId') int? equipmentId,
      @JsonKey(name: 'PlanogramComplianceStatus')
      int? planogramComplianceStatus,
      @JsonKey(name: 'PlanogramCompliancePercentage')
      double? planogramCompliancePercentage,
      @JsonKey(name: 'AssetScore') double? assetScore});
}

/// @nodoc
class __$AssetLevelScoreDataCopyWithImpl<$Res>
    implements _$AssetLevelScoreDataCopyWith<$Res> {
  __$AssetLevelScoreDataCopyWithImpl(this._self, this._then);

  final _AssetLevelScoreData _self;
  final $Res Function(_AssetLevelScoreData) _then;

  /// Create a copy of AssetLevelScoreData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? assetId = freezed,
    Object? equipmentId = freezed,
    Object? planogramComplianceStatus = freezed,
    Object? planogramCompliancePercentage = freezed,
    Object? assetScore = freezed,
  }) {
    return _then(_AssetLevelScoreData(
      assetId: freezed == assetId
          ? _self.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int?,
      equipmentId: freezed == equipmentId
          ? _self.equipmentId
          : equipmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      planogramComplianceStatus: freezed == planogramComplianceStatus
          ? _self.planogramComplianceStatus
          : planogramComplianceStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      planogramCompliancePercentage: freezed == planogramCompliancePercentage
          ? _self.planogramCompliancePercentage
          : planogramCompliancePercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      assetScore: freezed == assetScore
          ? _self.assetScore
          : assetScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
