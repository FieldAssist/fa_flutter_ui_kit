import 'package:fa_flutter_core/fa_flutter_core.dart';

part 'place_mark_data.freezed.dart';
part 'place_mark_data.g.dart';

/// This class is copy of Placemark model fields from geocoding package.
@freezed
class PlaceMarkData with _$PlaceMarkData {
  const PlaceMarkData._();

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

  String getFullAddress() {
    final list = <String?>[];
    if (checkIfNotEmpty(name)) {
      list.add(name);
    }
    if (checkIfNotEmpty(subLocality)) {
      list.add(subLocality);
    }
    if (checkIfNotEmpty(locality)) {
      list.add(locality);
    }
    if (checkIfNotEmpty(subAdministrativeArea)) {
      list.add(subAdministrativeArea);
    }
    if (checkIfNotEmpty(administrativeArea)) {
      list.add(administrativeArea);
    }
    if (checkIfNotEmpty(postalCode)) {
      list.add(postalCode);
    }
    if (checkIfNotEmpty(country)) {
      list.add(country);
    }
    return list.join(', ');
  }
}
