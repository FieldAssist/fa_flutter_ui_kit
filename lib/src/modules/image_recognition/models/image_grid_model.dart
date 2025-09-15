import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_grid_model.freezed.dart';
part 'image_grid_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ImageGridModel with _$ImageGridModel {
  factory ImageGridModel({
    @JsonKey(name: "vertical_index") required int colIndex,
    @JsonKey(name: "horizontal_index") @Default(0) int rowIndex,
    @JsonKey(name: "localPath") @Default("") String localPath,
  }) = _ImageGridModel;
  factory ImageGridModel.fromJson(Map<String, dynamic> json) =>
      _$ImageGridModelFromJson(json);
}
