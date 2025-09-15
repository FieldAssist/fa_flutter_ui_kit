import 'package:freezed_annotation/freezed_annotation.dart';

import 'ir_response_model.dart';

part 'ir_response_master_model.freezed.dart';
part 'ir_response_master_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class IrResponseMasterModel with _$IrResponseMasterModel {
  factory IrResponseMasterModel({
    @JsonKey(name: "Success") @Default(false) bool success,
    @JsonKey(name: "Data") IrResponseModel? irResponseMasterModel,
  }) = _IrResponseMasterModel;
  factory IrResponseMasterModel.fromJson(Map<String, dynamic> json) =>
      _$IrResponseMasterModelFromJson(json);
}
