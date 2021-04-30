// main.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({
    @JsonKey(name: 'success', disallowNullValue: true, required: true)
        final bool? isSuccess,
    @JsonKey(disallowNullValue: true, required: true)
        final EmployeeData? employee,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class EmployeeData with _$EmployeeData {
  factory EmployeeData({
    @JsonKey(name: 'Name', disallowNullValue: true, required: true)
        final String? name,
    @JsonKey(name: 'CompanyName', disallowNullValue: true, required: true)
        final String? companyName,
    @JsonKey(name: 'CompanyId', disallowNullValue: true, required: true)
        final int? companyId,
    @JsonKey(name: 'AuthToken', disallowNullValue: true, required: true)
        final String? authToken,
    @JsonKey(name: 'DeviceId', disallowNullValue: true, required: true)
        final String? deviceId,
  }) = _EmployeeData;

  factory EmployeeData.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDataFromJson(json);
}
