import 'package:fa_flutter_core/fa_flutter_core.dart';

part 'place_mark_data.freezed.dart';
part 'place_mark_data.g.dart';

/// This class is copy of Placemark model fields from geocoding package.
@freezed
class PlaceMarkData with _$PlaceMarkData {
  factory PlaceMarkData({
    String? name,
    String? street,
    String? isoCountryCode,
    String? country,
    String? postalCode,
    String? administrativeArea,
    String? subAdministrativeArea,
    String? locality,
    String? subLocality,
    String? thoroughfare,
    String? subThoroughfare,
  }) = _PlaceMarkData;

  factory PlaceMarkData.fromJson(Map<String, dynamic> json) =>
      _$PlaceMarkDataFromJson(json);

  factory PlaceMarkData.fromPlacemark(Placemark placemark) {
    return PlaceMarkData(
      name: placemark.name,
      street: placemark.street,
      isoCountryCode: placemark.isoCountryCode,
      country: placemark.country,
      postalCode: placemark.postalCode,
      administrativeArea: placemark.administrativeArea,
      subAdministrativeArea: placemark.subAdministrativeArea,
      locality: placemark.locality,
      subLocality: placemark.subLocality,
      thoroughfare: placemark.thoroughfare,
      subThoroughfare: placemark.subThoroughfare,
    );
  }
}
