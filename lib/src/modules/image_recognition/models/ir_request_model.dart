import 'package:freezed_annotation/freezed_annotation.dart';

part 'ir_request_model.freezed.dart';
part 'ir_request_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class IrRequestModel with _$IrRequestModel {
  factory IrRequestModel({
    @JsonKey(name: "SessionId") @Default("") String sessionId,
    @JsonKey(name: "AttendanceId") @Default("") String attendanceId,
    @JsonKey(name: "OutletId") @Default(0) int outletId,
    @JsonKey(name: "Remarks") @Default("") String remarks,
    @JsonKey(name: "AssetId") @Default(0) int assetId,
    @JsonKey(name: "EquipmentId") int? equipmentId,
    @JsonKey(name: "BeforeSeenEnabled") @Default(0) beforeSeenEnabled,
    @JsonKey(name: "ImageState") @Default(100) int imageState,
    @JsonKey(name: "LogicId") @Default(0) int logicId,
    @JsonKey(name: "MustSellProducts") @Default([]) List<int> mustSellProducts,
    @JsonKey(name: "FocusedProducts") @Default([]) List<int> focusedProducts,
    @JsonKey(name: "PremiumSkuProducts") @Default([]) List<int> premiumSkus,
    @JsonKey(name: 'ImageUrl') String? imageUrl,
  }) = _IrRequestModel;
  factory IrRequestModel.fromJson(Map<String, dynamic> json) =>
      _$IrRequestModelFromJson(json);
}
