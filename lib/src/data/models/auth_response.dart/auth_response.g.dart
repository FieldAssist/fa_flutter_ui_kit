// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthResponse _$_$_AuthResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['success', 'employee'],
      disallowNullValues: const ['success', 'employee']);
  return _$_AuthResponse(
    isSuccess: json['success'] as bool,
    employee: json['employee'] == null
        ? null
        : EmployeeData.fromJson(json['employee'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AuthResponseToJson(_$_AuthResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('success', instance.isSuccess);
  writeNotNull('employee', instance.employee);
  return val;
}

_$_EmployeeData _$_$_EmployeeDataFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'Name',
    'CompanyName',
    'CompanyId',
    'AuthToken',
    'DeviceId'
  ], disallowNullValues: const [
    'Name',
    'CompanyName',
    'CompanyId',
    'AuthToken',
    'DeviceId'
  ]);
  return _$_EmployeeData(
    name: json['Name'] as String,
    companyName: json['CompanyName'] as String,
    companyId: json['CompanyId'] as int,
    authToken: json['AuthToken'] as String,
    deviceId: json['DeviceId'] as String,
  );
}

Map<String, dynamic> _$_$_EmployeeDataToJson(_$_EmployeeData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('CompanyName', instance.companyName);
  writeNotNull('CompanyId', instance.companyId);
  writeNotNull('AuthToken', instance.authToken);
  writeNotNull('DeviceId', instance.deviceId);
  return val;
}
