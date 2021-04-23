// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
class _$AuthResponseTearOff {
  const _$AuthResponseTearOff();

// ignore: unused_element
  _AuthResponse call(
      {@JsonKey(name: 'success', disallowNullValue: true, required: true)
          bool isSuccess,
      @JsonKey(disallowNullValue: true, required: true)
          EmployeeData employee}) {
    return _AuthResponse(
      isSuccess: isSuccess,
      employee: employee,
    );
  }

// ignore: unused_element
  AuthResponse fromJson(Map<String, Object> json) {
    return AuthResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AuthResponse = _$AuthResponseTearOff();

/// @nodoc
mixin _$AuthResponse {
  @JsonKey(name: 'success', disallowNullValue: true, required: true)
  bool get isSuccess;
  @JsonKey(disallowNullValue: true, required: true)
  EmployeeData get employee;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AuthResponseCopyWith<AuthResponse> get copyWith;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
          AuthResponse value, $Res Function(AuthResponse) then) =
      _$AuthResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'success', disallowNullValue: true, required: true)
          bool isSuccess,
      @JsonKey(disallowNullValue: true, required: true)
          EmployeeData employee});

  $EmployeeDataCopyWith<$Res> get employee;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res> implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  final AuthResponse _value;
  // ignore: unused_field
  final $Res Function(AuthResponse) _then;

  @override
  $Res call({
    Object isSuccess = freezed,
    Object employee = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      employee:
          employee == freezed ? _value.employee : employee as EmployeeData,
    ));
  }

  @override
  $EmployeeDataCopyWith<$Res> get employee {
    if (_value.employee == null) {
      return null;
    }
    return $EmployeeDataCopyWith<$Res>(_value.employee, (value) {
      return _then(_value.copyWith(employee: value));
    });
  }
}

/// @nodoc
abstract class _$AuthResponseCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(
          _AuthResponse value, $Res Function(_AuthResponse) then) =
      __$AuthResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'success', disallowNullValue: true, required: true)
          bool isSuccess,
      @JsonKey(disallowNullValue: true, required: true)
          EmployeeData employee});

  @override
  $EmployeeDataCopyWith<$Res> get employee;
}

/// @nodoc
class __$AuthResponseCopyWithImpl<$Res> extends _$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(
      _AuthResponse _value, $Res Function(_AuthResponse) _then)
      : super(_value, (v) => _then(v as _AuthResponse));

  @override
  _AuthResponse get _value => super._value as _AuthResponse;

  @override
  $Res call({
    Object isSuccess = freezed,
    Object employee = freezed,
  }) {
    return _then(_AuthResponse(
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      employee:
          employee == freezed ? _value.employee : employee as EmployeeData,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AuthResponse implements _AuthResponse {
  _$_AuthResponse(
      {@JsonKey(name: 'success', disallowNullValue: true, required: true)
          this.isSuccess,
      @JsonKey(disallowNullValue: true, required: true)
          this.employee});

  factory _$_AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthResponseFromJson(json);

  @override
  @JsonKey(name: 'success', disallowNullValue: true, required: true)
  final bool isSuccess;
  @override
  @JsonKey(disallowNullValue: true, required: true)
  final EmployeeData employee;

  @override
  String toString() {
    return 'AuthResponse(isSuccess: $isSuccess, employee: $employee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthResponse &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.employee, employee) ||
                const DeepCollectionEquality()
                    .equals(other.employee, employee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(employee);

  @JsonKey(ignore: true)
  @override
  _$AuthResponseCopyWith<_AuthResponse> get copyWith =>
      __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthResponseToJson(this);
  }
}

abstract class _AuthResponse implements AuthResponse {
  factory _AuthResponse(
      {@JsonKey(name: 'success', disallowNullValue: true, required: true)
          bool isSuccess,
      @JsonKey(disallowNullValue: true, required: true)
          EmployeeData employee}) = _$_AuthResponse;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$_AuthResponse.fromJson;

  @override
  @JsonKey(name: 'success', disallowNullValue: true, required: true)
  bool get isSuccess;
  @override
  @JsonKey(disallowNullValue: true, required: true)
  EmployeeData get employee;
  @override
  @JsonKey(ignore: true)
  _$AuthResponseCopyWith<_AuthResponse> get copyWith;
}

EmployeeData _$EmployeeDataFromJson(Map<String, dynamic> json) {
  return _EmployeeData.fromJson(json);
}

/// @nodoc
class _$EmployeeDataTearOff {
  const _$EmployeeDataTearOff();

// ignore: unused_element
  _EmployeeData call(
      {@JsonKey(name: 'Name', disallowNullValue: true, required: true)
          String name,
      @JsonKey(name: 'CompanyName', disallowNullValue: true, required: true)
          String companyName,
      @JsonKey(name: 'CompanyId', disallowNullValue: true, required: true)
          int companyId,
      @JsonKey(name: 'AuthToken', disallowNullValue: true, required: true)
          String authToken,
      @JsonKey(name: 'DeviceId', disallowNullValue: true, required: true)
          String deviceId}) {
    return _EmployeeData(
      name: name,
      companyName: companyName,
      companyId: companyId,
      authToken: authToken,
      deviceId: deviceId,
    );
  }

// ignore: unused_element
  EmployeeData fromJson(Map<String, Object> json) {
    return EmployeeData.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $EmployeeData = _$EmployeeDataTearOff();

/// @nodoc
mixin _$EmployeeData {
  @JsonKey(name: 'Name', disallowNullValue: true, required: true)
  String get name;
  @JsonKey(name: 'CompanyName', disallowNullValue: true, required: true)
  String get companyName;
  @JsonKey(name: 'CompanyId', disallowNullValue: true, required: true)
  int get companyId;
  @JsonKey(name: 'AuthToken', disallowNullValue: true, required: true)
  String get authToken;
  @JsonKey(name: 'DeviceId', disallowNullValue: true, required: true)
  String get deviceId;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $EmployeeDataCopyWith<EmployeeData> get copyWith;
}

/// @nodoc
abstract class $EmployeeDataCopyWith<$Res> {
  factory $EmployeeDataCopyWith(
          EmployeeData value, $Res Function(EmployeeData) then) =
      _$EmployeeDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Name', disallowNullValue: true, required: true)
          String name,
      @JsonKey(name: 'CompanyName', disallowNullValue: true, required: true)
          String companyName,
      @JsonKey(name: 'CompanyId', disallowNullValue: true, required: true)
          int companyId,
      @JsonKey(name: 'AuthToken', disallowNullValue: true, required: true)
          String authToken,
      @JsonKey(name: 'DeviceId', disallowNullValue: true, required: true)
          String deviceId});
}

/// @nodoc
class _$EmployeeDataCopyWithImpl<$Res> implements $EmployeeDataCopyWith<$Res> {
  _$EmployeeDataCopyWithImpl(this._value, this._then);

  final EmployeeData _value;
  // ignore: unused_field
  final $Res Function(EmployeeData) _then;

  @override
  $Res call({
    Object name = freezed,
    Object companyName = freezed,
    Object companyId = freezed,
    Object authToken = freezed,
    Object deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      companyName:
          companyName == freezed ? _value.companyName : companyName as String,
      companyId: companyId == freezed ? _value.companyId : companyId as int,
      authToken: authToken == freezed ? _value.authToken : authToken as String,
      deviceId: deviceId == freezed ? _value.deviceId : deviceId as String,
    ));
  }
}

/// @nodoc
abstract class _$EmployeeDataCopyWith<$Res>
    implements $EmployeeDataCopyWith<$Res> {
  factory _$EmployeeDataCopyWith(
          _EmployeeData value, $Res Function(_EmployeeData) then) =
      __$EmployeeDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Name', disallowNullValue: true, required: true)
          String name,
      @JsonKey(name: 'CompanyName', disallowNullValue: true, required: true)
          String companyName,
      @JsonKey(name: 'CompanyId', disallowNullValue: true, required: true)
          int companyId,
      @JsonKey(name: 'AuthToken', disallowNullValue: true, required: true)
          String authToken,
      @JsonKey(name: 'DeviceId', disallowNullValue: true, required: true)
          String deviceId});
}

/// @nodoc
class __$EmployeeDataCopyWithImpl<$Res> extends _$EmployeeDataCopyWithImpl<$Res>
    implements _$EmployeeDataCopyWith<$Res> {
  __$EmployeeDataCopyWithImpl(
      _EmployeeData _value, $Res Function(_EmployeeData) _then)
      : super(_value, (v) => _then(v as _EmployeeData));

  @override
  _EmployeeData get _value => super._value as _EmployeeData;

  @override
  $Res call({
    Object name = freezed,
    Object companyName = freezed,
    Object companyId = freezed,
    Object authToken = freezed,
    Object deviceId = freezed,
  }) {
    return _then(_EmployeeData(
      name: name == freezed ? _value.name : name as String,
      companyName:
          companyName == freezed ? _value.companyName : companyName as String,
      companyId: companyId == freezed ? _value.companyId : companyId as int,
      authToken: authToken == freezed ? _value.authToken : authToken as String,
      deviceId: deviceId == freezed ? _value.deviceId : deviceId as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_EmployeeData implements _EmployeeData {
  _$_EmployeeData(
      {@JsonKey(name: 'Name', disallowNullValue: true, required: true)
          this.name,
      @JsonKey(name: 'CompanyName', disallowNullValue: true, required: true)
          this.companyName,
      @JsonKey(name: 'CompanyId', disallowNullValue: true, required: true)
          this.companyId,
      @JsonKey(name: 'AuthToken', disallowNullValue: true, required: true)
          this.authToken,
      @JsonKey(name: 'DeviceId', disallowNullValue: true, required: true)
          this.deviceId});

  factory _$_EmployeeData.fromJson(Map<String, dynamic> json) =>
      _$_$_EmployeeDataFromJson(json);

  @override
  @JsonKey(name: 'Name', disallowNullValue: true, required: true)
  final String name;
  @override
  @JsonKey(name: 'CompanyName', disallowNullValue: true, required: true)
  final String companyName;
  @override
  @JsonKey(name: 'CompanyId', disallowNullValue: true, required: true)
  final int companyId;
  @override
  @JsonKey(name: 'AuthToken', disallowNullValue: true, required: true)
  final String authToken;
  @override
  @JsonKey(name: 'DeviceId', disallowNullValue: true, required: true)
  final String deviceId;

  @override
  String toString() {
    return 'EmployeeData(name: $name, companyName: $companyName, companyId: $companyId, authToken: $authToken, deviceId: $deviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmployeeData &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.companyName, companyName) ||
                const DeepCollectionEquality()
                    .equals(other.companyName, companyName)) &&
            (identical(other.companyId, companyId) ||
                const DeepCollectionEquality()
                    .equals(other.companyId, companyId)) &&
            (identical(other.authToken, authToken) ||
                const DeepCollectionEquality()
                    .equals(other.authToken, authToken)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(companyName) ^
      const DeepCollectionEquality().hash(companyId) ^
      const DeepCollectionEquality().hash(authToken) ^
      const DeepCollectionEquality().hash(deviceId);

  @JsonKey(ignore: true)
  @override
  _$EmployeeDataCopyWith<_EmployeeData> get copyWith =>
      __$EmployeeDataCopyWithImpl<_EmployeeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EmployeeDataToJson(this);
  }
}

abstract class _EmployeeData implements EmployeeData {
  factory _EmployeeData(
      {@JsonKey(name: 'Name', disallowNullValue: true, required: true)
          String name,
      @JsonKey(name: 'CompanyName', disallowNullValue: true, required: true)
          String companyName,
      @JsonKey(name: 'CompanyId', disallowNullValue: true, required: true)
          int companyId,
      @JsonKey(name: 'AuthToken', disallowNullValue: true, required: true)
          String authToken,
      @JsonKey(name: 'DeviceId', disallowNullValue: true, required: true)
          String deviceId}) = _$_EmployeeData;

  factory _EmployeeData.fromJson(Map<String, dynamic> json) =
      _$_EmployeeData.fromJson;

  @override
  @JsonKey(name: 'Name', disallowNullValue: true, required: true)
  String get name;
  @override
  @JsonKey(name: 'CompanyName', disallowNullValue: true, required: true)
  String get companyName;
  @override
  @JsonKey(name: 'CompanyId', disallowNullValue: true, required: true)
  int get companyId;
  @override
  @JsonKey(name: 'AuthToken', disallowNullValue: true, required: true)
  String get authToken;
  @override
  @JsonKey(name: 'DeviceId', disallowNullValue: true, required: true)
  String get deviceId;
  @override
  @JsonKey(ignore: true)
  _$EmployeeDataCopyWith<_EmployeeData> get copyWith;
}
