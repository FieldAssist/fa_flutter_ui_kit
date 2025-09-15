import 'package:fa_flutter_core/fa_flutter_core.dart';

part 'ir_image_quality.freezed.dart';

part 'ir_image_quality.g.dart';

@freezed
abstract class IrImageQualityModel with _$IrImageQualityModel {
  factory IrImageQualityModel({
    @JsonKey(name: 'IsInvalid') @Default(false) bool isInvalid,
    @JsonKey(name: 'Errors') List<String>? errors,
  }) = _IrImageQualityModel;

  factory IrImageQualityModel.fromJson(Map<String, dynamic> json) =>
      _$IrImageQualityModelFromJson(json);
}
