// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_response_master_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IrResponseMasterModel _$IrResponseMasterModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      '_IrResponseMasterModel',
      json,
      ($checkedConvert) {
        final val = _IrResponseMasterModel(
          success: $checkedConvert('Success', (v) => v as bool? ?? false),
          irResponseMasterModel: $checkedConvert(
              'Data',
              (v) => v == null
                  ? null
                  : IrResponseModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'success': 'Success',
        'irResponseMasterModel': 'Data'
      },
    );

Map<String, dynamic> _$IrResponseMasterModelToJson(
        _IrResponseMasterModel instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Data': instance.irResponseMasterModel?.toJson(),
    };
