// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'void_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$VoidResultTearOff {
  const _$VoidResultTearOff();

// ignore: unused_element
  Success success() {
    return const Success();
  }

// ignore: unused_element
  Failure failure({@required String reason}) {
    return Failure(
      reason: reason,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $VoidResult = _$VoidResultTearOff();

/// @nodoc
mixin _$VoidResult {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult success(),
    @required TResult failure(String reason),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult success(),
    TResult failure(String reason),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult success(Success value),
    @required TResult failure(Failure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult success(Success value),
    TResult failure(Failure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $VoidResultCopyWith<$Res> {
  factory $VoidResultCopyWith(
          VoidResult value, $Res Function(VoidResult) then) =
      _$VoidResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$VoidResultCopyWithImpl<$Res> implements $VoidResultCopyWith<$Res> {
  _$VoidResultCopyWithImpl(this._value, this._then);

  final VoidResult _value;
  // ignore: unused_field
  final $Res Function(VoidResult) _then;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$VoidResultCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;
}

/// @nodoc
class _$Success with DiagnosticableTreeMixin implements Success {
  const _$Success();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VoidResult.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'VoidResult.success'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult success(),
    @required TResult failure(String reason),
  }) {
    assert(success != null);
    assert(failure != null);
    return success();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult success(),
    TResult failure(String reason),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult success(Success value),
    @required TResult failure(Failure value),
  }) {
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult success(Success value),
    TResult failure(Failure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements VoidResult {
  const factory Success() = _$Success;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({String reason});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> extends _$VoidResultCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(Failure _value, $Res Function(Failure) _then)
      : super(_value, (v) => _then(v as Failure));

  @override
  Failure get _value => super._value as Failure;

  @override
  $Res call({
    Object reason = freezed,
  }) {
    return _then(Failure(
      reason: reason == freezed ? _value.reason : reason as String,
    ));
  }
}

/// @nodoc
class _$Failure with DiagnosticableTreeMixin implements Failure {
  const _$Failure({@required this.reason}) : assert(reason != null);

  @override
  final String reason;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VoidResult.failure(reason: $reason)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VoidResult.failure'))
      ..add(DiagnosticsProperty('reason', reason));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reason);

  @JsonKey(ignore: true)
  @override
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult success(),
    @required TResult failure(String reason),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult success(),
    TResult failure(String reason),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult success(Success value),
    @required TResult failure(Failure value),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult success(Success value),
    TResult failure(Failure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements VoidResult {
  const factory Failure({@required String reason}) = _$Failure;

  String get reason;
  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith;
}
