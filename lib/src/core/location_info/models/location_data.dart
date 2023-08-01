import 'package:fa_flutter_ui_kit/src/core/location_info/models/place_mark_data/place_mark_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_data.freezed.dart';
part 'location_data.g.dart';

@freezed
abstract class LocationData with _$LocationData {
  factory LocationData({
    @JsonKey(name: 'Longitude', required: true) final double? longitude,
    @JsonKey(name: 'Latitude', required: true) final double? latitude,
    @JsonKey(defaultValue: 0) final int? accuracy,
    @JsonKey(defaultValue: "NA") final String? source,
    final PlaceMarkData? placeMarkData,
    final int? captureTime,
    final String? capturedAddress,
    final String? captureLocationTime,
  }) = _LocationData;

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);
}
