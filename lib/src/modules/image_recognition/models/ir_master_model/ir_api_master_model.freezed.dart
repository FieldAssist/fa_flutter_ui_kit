// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ir_api_master_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IrApiMasterModel {
  @JsonKey(name: 'Id')
  int get id;
  @JsonKey(name: 'RuleName')
  String get ruleName;
  @JsonKey(name: 'IsMandatory')
  bool get isMandatory;
  @JsonKey(name: 'AssetList')
  List<int> get assetList;
  @JsonKey(name: 'Outlets')
  List<int> get outlets;
  @JsonKey(name: 'BeforeSeenEnabled')
  bool get beforeStateEnabled;
  @JsonKey(name: 'KPIWeightageList')
  List<KPIWeightage>? get kpiWeightageList;

  /// Create a copy of IrApiMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IrApiMasterModelCopyWith<IrApiMasterModel> get copyWith =>
      _$IrApiMasterModelCopyWithImpl<IrApiMasterModel>(
          this as IrApiMasterModel, _$identity);

  /// Serializes this IrApiMasterModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IrApiMasterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ruleName, ruleName) ||
                other.ruleName == ruleName) &&
            (identical(other.isMandatory, isMandatory) ||
                other.isMandatory == isMandatory) &&
            const DeepCollectionEquality().equals(other.assetList, assetList) &&
            const DeepCollectionEquality().equals(other.outlets, outlets) &&
            (identical(other.beforeStateEnabled, beforeStateEnabled) ||
                other.beforeStateEnabled == beforeStateEnabled) &&
            const DeepCollectionEquality()
                .equals(other.kpiWeightageList, kpiWeightageList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ruleName,
      isMandatory,
      const DeepCollectionEquality().hash(assetList),
      const DeepCollectionEquality().hash(outlets),
      beforeStateEnabled,
      const DeepCollectionEquality().hash(kpiWeightageList));

  @override
  String toString() {
    return 'IrApiMasterModel(id: $id, ruleName: $ruleName, isMandatory: $isMandatory, assetList: $assetList, outlets: $outlets, beforeStateEnabled: $beforeStateEnabled, kpiWeightageList: $kpiWeightageList)';
  }
}

/// @nodoc
abstract mixin class $IrApiMasterModelCopyWith<$Res> {
  factory $IrApiMasterModelCopyWith(
          IrApiMasterModel value, $Res Function(IrApiMasterModel) _then) =
      _$IrApiMasterModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'RuleName') String ruleName,
      @JsonKey(name: 'IsMandatory') bool isMandatory,
      @JsonKey(name: 'AssetList') List<int> assetList,
      @JsonKey(name: 'Outlets') List<int> outlets,
      @JsonKey(name: 'BeforeSeenEnabled') bool beforeStateEnabled,
      @JsonKey(name: 'KPIWeightageList') List<KPIWeightage>? kpiWeightageList});
}

/// @nodoc
class _$IrApiMasterModelCopyWithImpl<$Res>
    implements $IrApiMasterModelCopyWith<$Res> {
  _$IrApiMasterModelCopyWithImpl(this._self, this._then);

  final IrApiMasterModel _self;
  final $Res Function(IrApiMasterModel) _then;

  /// Create a copy of IrApiMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ruleName = null,
    Object? isMandatory = null,
    Object? assetList = null,
    Object? outlets = null,
    Object? beforeStateEnabled = null,
    Object? kpiWeightageList = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ruleName: null == ruleName
          ? _self.ruleName
          : ruleName // ignore: cast_nullable_to_non_nullable
              as String,
      isMandatory: null == isMandatory
          ? _self.isMandatory
          : isMandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      assetList: null == assetList
          ? _self.assetList
          : assetList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      outlets: null == outlets
          ? _self.outlets
          : outlets // ignore: cast_nullable_to_non_nullable
              as List<int>,
      beforeStateEnabled: null == beforeStateEnabled
          ? _self.beforeStateEnabled
          : beforeStateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      kpiWeightageList: freezed == kpiWeightageList
          ? _self.kpiWeightageList
          : kpiWeightageList // ignore: cast_nullable_to_non_nullable
              as List<KPIWeightage>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [IrApiMasterModel].
extension IrApiMasterModelPatterns on IrApiMasterModel {
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
    TResult Function(_IrApiMasterModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrApiMasterModel() when $default != null:
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
    TResult Function(_IrApiMasterModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrApiMasterModel():
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
    TResult? Function(_IrApiMasterModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrApiMasterModel() when $default != null:
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
            @JsonKey(name: 'Id') int id,
            @JsonKey(name: 'RuleName') String ruleName,
            @JsonKey(name: 'IsMandatory') bool isMandatory,
            @JsonKey(name: 'AssetList') List<int> assetList,
            @JsonKey(name: 'Outlets') List<int> outlets,
            @JsonKey(name: 'BeforeSeenEnabled') bool beforeStateEnabled,
            @JsonKey(name: 'KPIWeightageList')
            List<KPIWeightage>? kpiWeightageList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IrApiMasterModel() when $default != null:
        return $default(
            _that.id,
            _that.ruleName,
            _that.isMandatory,
            _that.assetList,
            _that.outlets,
            _that.beforeStateEnabled,
            _that.kpiWeightageList);
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
            @JsonKey(name: 'Id') int id,
            @JsonKey(name: 'RuleName') String ruleName,
            @JsonKey(name: 'IsMandatory') bool isMandatory,
            @JsonKey(name: 'AssetList') List<int> assetList,
            @JsonKey(name: 'Outlets') List<int> outlets,
            @JsonKey(name: 'BeforeSeenEnabled') bool beforeStateEnabled,
            @JsonKey(name: 'KPIWeightageList')
            List<KPIWeightage>? kpiWeightageList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrApiMasterModel():
        return $default(
            _that.id,
            _that.ruleName,
            _that.isMandatory,
            _that.assetList,
            _that.outlets,
            _that.beforeStateEnabled,
            _that.kpiWeightageList);
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
            @JsonKey(name: 'Id') int id,
            @JsonKey(name: 'RuleName') String ruleName,
            @JsonKey(name: 'IsMandatory') bool isMandatory,
            @JsonKey(name: 'AssetList') List<int> assetList,
            @JsonKey(name: 'Outlets') List<int> outlets,
            @JsonKey(name: 'BeforeSeenEnabled') bool beforeStateEnabled,
            @JsonKey(name: 'KPIWeightageList')
            List<KPIWeightage>? kpiWeightageList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IrApiMasterModel() when $default != null:
        return $default(
            _that.id,
            _that.ruleName,
            _that.isMandatory,
            _that.assetList,
            _that.outlets,
            _that.beforeStateEnabled,
            _that.kpiWeightageList);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IrApiMasterModel implements IrApiMasterModel {
  _IrApiMasterModel(
      {@JsonKey(name: 'Id') this.id = -1,
      @JsonKey(name: 'RuleName') this.ruleName = "",
      @JsonKey(name: 'IsMandatory') this.isMandatory = false,
      @JsonKey(name: 'AssetList') this.assetList = const [],
      @JsonKey(name: 'Outlets') this.outlets = const [],
      @JsonKey(name: 'BeforeSeenEnabled') this.beforeStateEnabled = false,
      @JsonKey(name: 'KPIWeightageList') this.kpiWeightageList});
  factory _IrApiMasterModel.fromJson(Map<String, dynamic> json) =>
      _$IrApiMasterModelFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'RuleName')
  final String ruleName;
  @override
  @JsonKey(name: 'IsMandatory')
  final bool isMandatory;
  @override
  @JsonKey(name: 'AssetList')
  final List<int> assetList;
  @override
  @JsonKey(name: 'Outlets')
  final List<int> outlets;
  @override
  @JsonKey(name: 'BeforeSeenEnabled')
  final bool beforeStateEnabled;
  @override
  @JsonKey(name: 'KPIWeightageList')
  final List<KPIWeightage>? kpiWeightageList;

  /// Create a copy of IrApiMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IrApiMasterModelCopyWith<_IrApiMasterModel> get copyWith =>
      __$IrApiMasterModelCopyWithImpl<_IrApiMasterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IrApiMasterModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IrApiMasterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ruleName, ruleName) ||
                other.ruleName == ruleName) &&
            (identical(other.isMandatory, isMandatory) ||
                other.isMandatory == isMandatory) &&
            const DeepCollectionEquality().equals(other.assetList, assetList) &&
            const DeepCollectionEquality().equals(other.outlets, outlets) &&
            (identical(other.beforeStateEnabled, beforeStateEnabled) ||
                other.beforeStateEnabled == beforeStateEnabled) &&
            const DeepCollectionEquality()
                .equals(other.kpiWeightageList, kpiWeightageList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ruleName,
      isMandatory,
      const DeepCollectionEquality().hash(assetList),
      const DeepCollectionEquality().hash(outlets),
      beforeStateEnabled,
      const DeepCollectionEquality().hash(kpiWeightageList));

  @override
  String toString() {
    return 'IrApiMasterModel(id: $id, ruleName: $ruleName, isMandatory: $isMandatory, assetList: $assetList, outlets: $outlets, beforeStateEnabled: $beforeStateEnabled, kpiWeightageList: $kpiWeightageList)';
  }
}

/// @nodoc
abstract mixin class _$IrApiMasterModelCopyWith<$Res>
    implements $IrApiMasterModelCopyWith<$Res> {
  factory _$IrApiMasterModelCopyWith(
          _IrApiMasterModel value, $Res Function(_IrApiMasterModel) _then) =
      __$IrApiMasterModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'RuleName') String ruleName,
      @JsonKey(name: 'IsMandatory') bool isMandatory,
      @JsonKey(name: 'AssetList') List<int> assetList,
      @JsonKey(name: 'Outlets') List<int> outlets,
      @JsonKey(name: 'BeforeSeenEnabled') bool beforeStateEnabled,
      @JsonKey(name: 'KPIWeightageList') List<KPIWeightage>? kpiWeightageList});
}

/// @nodoc
class __$IrApiMasterModelCopyWithImpl<$Res>
    implements _$IrApiMasterModelCopyWith<$Res> {
  __$IrApiMasterModelCopyWithImpl(this._self, this._then);

  final _IrApiMasterModel _self;
  final $Res Function(_IrApiMasterModel) _then;

  /// Create a copy of IrApiMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? ruleName = null,
    Object? isMandatory = null,
    Object? assetList = null,
    Object? outlets = null,
    Object? beforeStateEnabled = null,
    Object? kpiWeightageList = freezed,
  }) {
    return _then(_IrApiMasterModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ruleName: null == ruleName
          ? _self.ruleName
          : ruleName // ignore: cast_nullable_to_non_nullable
              as String,
      isMandatory: null == isMandatory
          ? _self.isMandatory
          : isMandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      assetList: null == assetList
          ? _self.assetList
          : assetList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      outlets: null == outlets
          ? _self.outlets
          : outlets // ignore: cast_nullable_to_non_nullable
              as List<int>,
      beforeStateEnabled: null == beforeStateEnabled
          ? _self.beforeStateEnabled
          : beforeStateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      kpiWeightageList: freezed == kpiWeightageList
          ? _self.kpiWeightageList
          : kpiWeightageList // ignore: cast_nullable_to_non_nullable
              as List<KPIWeightage>?,
    ));
  }
}

/// @nodoc
mixin _$KPIWeightage {
  @JsonKey(
      name: 'KPIEnum', fromJson: irKpiEnumFromJson, toJson: irKpiEnumToJson)
  IrKpiEnum? get kpiEnum;
  @JsonKey(name: 'Weightage')
  double? get weightage;
  @JsonKey(name: 'Target')
  double? get target;
  @JsonKey(name: 'Planogram')
  List<Planogram>? get planogram;

  /// Create a copy of KPIWeightage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KPIWeightageCopyWith<KPIWeightage> get copyWith =>
      _$KPIWeightageCopyWithImpl<KPIWeightage>(
          this as KPIWeightage, _$identity);

  /// Serializes this KPIWeightage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KPIWeightage &&
            (identical(other.kpiEnum, kpiEnum) || other.kpiEnum == kpiEnum) &&
            (identical(other.weightage, weightage) ||
                other.weightage == weightage) &&
            (identical(other.target, target) || other.target == target) &&
            const DeepCollectionEquality().equals(other.planogram, planogram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kpiEnum, weightage, target,
      const DeepCollectionEquality().hash(planogram));

  @override
  String toString() {
    return 'KPIWeightage(kpiEnum: $kpiEnum, weightage: $weightage, target: $target, planogram: $planogram)';
  }
}

/// @nodoc
abstract mixin class $KPIWeightageCopyWith<$Res> {
  factory $KPIWeightageCopyWith(
          KPIWeightage value, $Res Function(KPIWeightage) _then) =
      _$KPIWeightageCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'KPIEnum', fromJson: irKpiEnumFromJson, toJson: irKpiEnumToJson)
      IrKpiEnum? kpiEnum,
      @JsonKey(name: 'Weightage') double? weightage,
      @JsonKey(name: 'Target') double? target,
      @JsonKey(name: 'Planogram') List<Planogram>? planogram});
}

/// @nodoc
class _$KPIWeightageCopyWithImpl<$Res> implements $KPIWeightageCopyWith<$Res> {
  _$KPIWeightageCopyWithImpl(this._self, this._then);

  final KPIWeightage _self;
  final $Res Function(KPIWeightage) _then;

  /// Create a copy of KPIWeightage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kpiEnum = freezed,
    Object? weightage = freezed,
    Object? target = freezed,
    Object? planogram = freezed,
  }) {
    return _then(_self.copyWith(
      kpiEnum: freezed == kpiEnum
          ? _self.kpiEnum
          : kpiEnum // ignore: cast_nullable_to_non_nullable
              as IrKpiEnum?,
      weightage: freezed == weightage
          ? _self.weightage
          : weightage // ignore: cast_nullable_to_non_nullable
              as double?,
      target: freezed == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as double?,
      planogram: freezed == planogram
          ? _self.planogram
          : planogram // ignore: cast_nullable_to_non_nullable
              as List<Planogram>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [KPIWeightage].
extension KPIWeightagePatterns on KPIWeightage {
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
    TResult Function(_KPIWeightage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KPIWeightage() when $default != null:
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
    TResult Function(_KPIWeightage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KPIWeightage():
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
    TResult? Function(_KPIWeightage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KPIWeightage() when $default != null:
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
            @JsonKey(
                name: 'KPIEnum',
                fromJson: irKpiEnumFromJson,
                toJson: irKpiEnumToJson)
            IrKpiEnum? kpiEnum,
            @JsonKey(name: 'Weightage') double? weightage,
            @JsonKey(name: 'Target') double? target,
            @JsonKey(name: 'Planogram') List<Planogram>? planogram)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KPIWeightage() when $default != null:
        return $default(
            _that.kpiEnum, _that.weightage, _that.target, _that.planogram);
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
            @JsonKey(
                name: 'KPIEnum',
                fromJson: irKpiEnumFromJson,
                toJson: irKpiEnumToJson)
            IrKpiEnum? kpiEnum,
            @JsonKey(name: 'Weightage') double? weightage,
            @JsonKey(name: 'Target') double? target,
            @JsonKey(name: 'Planogram') List<Planogram>? planogram)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KPIWeightage():
        return $default(
            _that.kpiEnum, _that.weightage, _that.target, _that.planogram);
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
            @JsonKey(
                name: 'KPIEnum',
                fromJson: irKpiEnumFromJson,
                toJson: irKpiEnumToJson)
            IrKpiEnum? kpiEnum,
            @JsonKey(name: 'Weightage') double? weightage,
            @JsonKey(name: 'Target') double? target,
            @JsonKey(name: 'Planogram') List<Planogram>? planogram)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KPIWeightage() when $default != null:
        return $default(
            _that.kpiEnum, _that.weightage, _that.target, _that.planogram);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KPIWeightage implements KPIWeightage {
  _KPIWeightage(
      {@JsonKey(
          name: 'KPIEnum', fromJson: irKpiEnumFromJson, toJson: irKpiEnumToJson)
      this.kpiEnum,
      @JsonKey(name: 'Weightage') this.weightage,
      @JsonKey(name: 'Target') this.target,
      @JsonKey(name: 'Planogram') final List<Planogram>? planogram})
      : _planogram = planogram;
  factory _KPIWeightage.fromJson(Map<String, dynamic> json) =>
      _$KPIWeightageFromJson(json);

  @override
  @JsonKey(
      name: 'KPIEnum', fromJson: irKpiEnumFromJson, toJson: irKpiEnumToJson)
  final IrKpiEnum? kpiEnum;
  @override
  @JsonKey(name: 'Weightage')
  final double? weightage;
  @override
  @JsonKey(name: 'Target')
  final double? target;
  final List<Planogram>? _planogram;
  @override
  @JsonKey(name: 'Planogram')
  List<Planogram>? get planogram {
    final value = _planogram;
    if (value == null) return null;
    if (_planogram is EqualUnmodifiableListView) return _planogram;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of KPIWeightage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KPIWeightageCopyWith<_KPIWeightage> get copyWith =>
      __$KPIWeightageCopyWithImpl<_KPIWeightage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KPIWeightageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KPIWeightage &&
            (identical(other.kpiEnum, kpiEnum) || other.kpiEnum == kpiEnum) &&
            (identical(other.weightage, weightage) ||
                other.weightage == weightage) &&
            (identical(other.target, target) || other.target == target) &&
            const DeepCollectionEquality()
                .equals(other._planogram, _planogram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kpiEnum, weightage, target,
      const DeepCollectionEquality().hash(_planogram));

  @override
  String toString() {
    return 'KPIWeightage(kpiEnum: $kpiEnum, weightage: $weightage, target: $target, planogram: $planogram)';
  }
}

/// @nodoc
abstract mixin class _$KPIWeightageCopyWith<$Res>
    implements $KPIWeightageCopyWith<$Res> {
  factory _$KPIWeightageCopyWith(
          _KPIWeightage value, $Res Function(_KPIWeightage) _then) =
      __$KPIWeightageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'KPIEnum', fromJson: irKpiEnumFromJson, toJson: irKpiEnumToJson)
      IrKpiEnum? kpiEnum,
      @JsonKey(name: 'Weightage') double? weightage,
      @JsonKey(name: 'Target') double? target,
      @JsonKey(name: 'Planogram') List<Planogram>? planogram});
}

/// @nodoc
class __$KPIWeightageCopyWithImpl<$Res>
    implements _$KPIWeightageCopyWith<$Res> {
  __$KPIWeightageCopyWithImpl(this._self, this._then);

  final _KPIWeightage _self;
  final $Res Function(_KPIWeightage) _then;

  /// Create a copy of KPIWeightage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kpiEnum = freezed,
    Object? weightage = freezed,
    Object? target = freezed,
    Object? planogram = freezed,
  }) {
    return _then(_KPIWeightage(
      kpiEnum: freezed == kpiEnum
          ? _self.kpiEnum
          : kpiEnum // ignore: cast_nullable_to_non_nullable
              as IrKpiEnum?,
      weightage: freezed == weightage
          ? _self.weightage
          : weightage // ignore: cast_nullable_to_non_nullable
              as double?,
      target: freezed == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as double?,
      planogram: freezed == planogram
          ? _self._planogram
          : planogram // ignore: cast_nullable_to_non_nullable
              as List<Planogram>?,
    ));
  }
}

/// @nodoc
mixin _$Planogram {
  @JsonKey(name: 'IdealPlanogramImageUrl')
  String? get idealPlanogramImageUrl;
  @JsonKey(name: 'AssetDefinitionIds')
  List<int>? get assetDefinitionIds;
  @JsonKey(name: 'Compliance')
  double? get compliance;

  /// Create a copy of Planogram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlanogramCopyWith<Planogram> get copyWith =>
      _$PlanogramCopyWithImpl<Planogram>(this as Planogram, _$identity);

  /// Serializes this Planogram to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Planogram &&
            (identical(other.idealPlanogramImageUrl, idealPlanogramImageUrl) ||
                other.idealPlanogramImageUrl == idealPlanogramImageUrl) &&
            const DeepCollectionEquality()
                .equals(other.assetDefinitionIds, assetDefinitionIds) &&
            (identical(other.compliance, compliance) ||
                other.compliance == compliance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idealPlanogramImageUrl,
      const DeepCollectionEquality().hash(assetDefinitionIds), compliance);

  @override
  String toString() {
    return 'Planogram(idealPlanogramImageUrl: $idealPlanogramImageUrl, assetDefinitionIds: $assetDefinitionIds, compliance: $compliance)';
  }
}

/// @nodoc
abstract mixin class $PlanogramCopyWith<$Res> {
  factory $PlanogramCopyWith(Planogram value, $Res Function(Planogram) _then) =
      _$PlanogramCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'IdealPlanogramImageUrl') String? idealPlanogramImageUrl,
      @JsonKey(name: 'AssetDefinitionIds') List<int>? assetDefinitionIds,
      @JsonKey(name: 'Compliance') double? compliance});
}

/// @nodoc
class _$PlanogramCopyWithImpl<$Res> implements $PlanogramCopyWith<$Res> {
  _$PlanogramCopyWithImpl(this._self, this._then);

  final Planogram _self;
  final $Res Function(Planogram) _then;

  /// Create a copy of Planogram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idealPlanogramImageUrl = freezed,
    Object? assetDefinitionIds = freezed,
    Object? compliance = freezed,
  }) {
    return _then(_self.copyWith(
      idealPlanogramImageUrl: freezed == idealPlanogramImageUrl
          ? _self.idealPlanogramImageUrl
          : idealPlanogramImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      assetDefinitionIds: freezed == assetDefinitionIds
          ? _self.assetDefinitionIds
          : assetDefinitionIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      compliance: freezed == compliance
          ? _self.compliance
          : compliance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Planogram].
extension PlanogramPatterns on Planogram {
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
    TResult Function(_Planogram value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Planogram() when $default != null:
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
    TResult Function(_Planogram value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Planogram():
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
    TResult? Function(_Planogram value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Planogram() when $default != null:
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
            @JsonKey(name: 'IdealPlanogramImageUrl')
            String? idealPlanogramImageUrl,
            @JsonKey(name: 'AssetDefinitionIds') List<int>? assetDefinitionIds,
            @JsonKey(name: 'Compliance') double? compliance)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Planogram() when $default != null:
        return $default(_that.idealPlanogramImageUrl, _that.assetDefinitionIds,
            _that.compliance);
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
            @JsonKey(name: 'IdealPlanogramImageUrl')
            String? idealPlanogramImageUrl,
            @JsonKey(name: 'AssetDefinitionIds') List<int>? assetDefinitionIds,
            @JsonKey(name: 'Compliance') double? compliance)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Planogram():
        return $default(_that.idealPlanogramImageUrl, _that.assetDefinitionIds,
            _that.compliance);
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
            @JsonKey(name: 'IdealPlanogramImageUrl')
            String? idealPlanogramImageUrl,
            @JsonKey(name: 'AssetDefinitionIds') List<int>? assetDefinitionIds,
            @JsonKey(name: 'Compliance') double? compliance)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Planogram() when $default != null:
        return $default(_that.idealPlanogramImageUrl, _that.assetDefinitionIds,
            _that.compliance);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Planogram implements Planogram {
  _Planogram(
      {@JsonKey(name: 'IdealPlanogramImageUrl') this.idealPlanogramImageUrl,
      @JsonKey(name: 'AssetDefinitionIds') final List<int>? assetDefinitionIds,
      @JsonKey(name: 'Compliance') this.compliance})
      : _assetDefinitionIds = assetDefinitionIds;
  factory _Planogram.fromJson(Map<String, dynamic> json) =>
      _$PlanogramFromJson(json);

  @override
  @JsonKey(name: 'IdealPlanogramImageUrl')
  final String? idealPlanogramImageUrl;
  final List<int>? _assetDefinitionIds;
  @override
  @JsonKey(name: 'AssetDefinitionIds')
  List<int>? get assetDefinitionIds {
    final value = _assetDefinitionIds;
    if (value == null) return null;
    if (_assetDefinitionIds is EqualUnmodifiableListView)
      return _assetDefinitionIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Compliance')
  final double? compliance;

  /// Create a copy of Planogram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlanogramCopyWith<_Planogram> get copyWith =>
      __$PlanogramCopyWithImpl<_Planogram>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlanogramToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Planogram &&
            (identical(other.idealPlanogramImageUrl, idealPlanogramImageUrl) ||
                other.idealPlanogramImageUrl == idealPlanogramImageUrl) &&
            const DeepCollectionEquality()
                .equals(other._assetDefinitionIds, _assetDefinitionIds) &&
            (identical(other.compliance, compliance) ||
                other.compliance == compliance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idealPlanogramImageUrl,
      const DeepCollectionEquality().hash(_assetDefinitionIds), compliance);

  @override
  String toString() {
    return 'Planogram(idealPlanogramImageUrl: $idealPlanogramImageUrl, assetDefinitionIds: $assetDefinitionIds, compliance: $compliance)';
  }
}

/// @nodoc
abstract mixin class _$PlanogramCopyWith<$Res>
    implements $PlanogramCopyWith<$Res> {
  factory _$PlanogramCopyWith(
          _Planogram value, $Res Function(_Planogram) _then) =
      __$PlanogramCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'IdealPlanogramImageUrl') String? idealPlanogramImageUrl,
      @JsonKey(name: 'AssetDefinitionIds') List<int>? assetDefinitionIds,
      @JsonKey(name: 'Compliance') double? compliance});
}

/// @nodoc
class __$PlanogramCopyWithImpl<$Res> implements _$PlanogramCopyWith<$Res> {
  __$PlanogramCopyWithImpl(this._self, this._then);

  final _Planogram _self;
  final $Res Function(_Planogram) _then;

  /// Create a copy of Planogram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idealPlanogramImageUrl = freezed,
    Object? assetDefinitionIds = freezed,
    Object? compliance = freezed,
  }) {
    return _then(_Planogram(
      idealPlanogramImageUrl: freezed == idealPlanogramImageUrl
          ? _self.idealPlanogramImageUrl
          : idealPlanogramImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      assetDefinitionIds: freezed == assetDefinitionIds
          ? _self._assetDefinitionIds
          : assetDefinitionIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      compliance: freezed == compliance
          ? _self.compliance
          : compliance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
