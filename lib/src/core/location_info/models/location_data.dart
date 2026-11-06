import 'package:fa_flutter_ui_kit/src/core/location_info/models/place_mark_data/place_mark_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_data.freezed.dart';
part 'location_data.g.dart';

@freezed
abstract class LocationData with _$LocationData {
  factory LocationData({
    @JsonKey(name: 'Longitude', required: true) double? longitude,
    @JsonKey(name: 'Latitude', required: true) double? latitude,
    @JsonKey(defaultValue: 0) int? accuracy,
    @JsonKey(defaultValue: "NA") String? source,
    PlaceMarkData? placeMarkData,
    int? captureTime,
    String? capturedAddress,
    String? captureLocationTime,
  }) = _LocationData;

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);
}
