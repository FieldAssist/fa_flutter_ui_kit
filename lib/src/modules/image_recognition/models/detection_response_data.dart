import 'package:freezed_annotation/freezed_annotation.dart';

part 'detection_response_data.freezed.dart';
part 'detection_response_data.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class DetectionResponseData with _$DetectionResponseData {
  factory DetectionResponseData({
    @JsonKey(name: "Success") @Default(false) bool success,
    @JsonKey(name: "Data") @Default("") String data,
    @JsonKey(name: "Message") @Default("") String message,
  }) = _DetectionResponseData;
  factory DetectionResponseData.fromJson(Map<String, dynamic> json) =>
      _$DetectionResponseDataFromJson(json);
}
