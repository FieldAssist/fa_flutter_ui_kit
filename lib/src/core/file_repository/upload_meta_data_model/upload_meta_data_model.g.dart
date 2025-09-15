// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_meta_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadMetaDataModel _$UploadMetaDataModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_UploadMetaDataModel',
      json,
      ($checkedConvert) {
        final val = _UploadMetaDataModel(
          container: $checkedConvert('Container', (v) => (v as num).toInt()),
          contentType: $checkedConvert('ContentType', (v) => v as String),
          fileName: $checkedConvert('FileName', (v) => v as String?),
          sessionId: $checkedConvert('SessionId', (v) => v as String?),
          attendanceGuid:
              $checkedConvert('AttendanceGuid', (v) => v as String?),
          outletId: $checkedConvert('OutletId', (v) => v as String?),
          promotionalType:
              $checkedConvert('PromotionalType', (v) => v as String?),
          employeeId: $checkedConvert('EmployeeId', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'container': 'Container',
        'contentType': 'ContentType',
        'fileName': 'FileName',
        'sessionId': 'SessionId',
        'attendanceGuid': 'AttendanceGuid',
        'outletId': 'OutletId',
        'promotionalType': 'PromotionalType',
        'employeeId': 'EmployeeId'
      },
    );

Map<String, dynamic> _$UploadMetaDataModelToJson(
        _UploadMetaDataModel instance) =>
    <String, dynamic>{
      'Container': instance.container,
      'ContentType': instance.contentType,
      'FileName': instance.fileName,
      'SessionId': instance.sessionId,
      'AttendanceGuid': instance.attendanceGuid,
      'OutletId': instance.outletId,
      'PromotionalType': instance.promotionalType,
      'EmployeeId': instance.employeeId,
    };
