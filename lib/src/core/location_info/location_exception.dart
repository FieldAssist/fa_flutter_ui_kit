import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/constants/constants.dart';

class LocationException extends MyException {
  const LocationException(String msg) : super(msg);
}

/// No fix arrived while the app was in front: GPS gave none in time and the
/// device had no fallback position. A condition of where the user is, not a
/// setting they got wrong, so a crash reporter can tell it apart by type.
/// The message is unchanged, so users see the same text as before.
class LocationTimeoutException extends LocationException {
  const LocationTimeoutException() : super(Constants.locationNotAvailable);
}

/// Device location is switched off, or the app may not use it. A setting the
/// user controls, not a fault in the app, so a crash reporter can report it
/// as non-fatal by type. The messages are the ones users already see.
class LocationSettingException extends LocationException {
  /// Location is switched off on the device.
  const LocationSettingException.off() : super('Oops! Location is turned off');

  /// The app is not allowed to read the location.
  const LocationSettingException.denied()
      : super('Please Allow Location Permission');

  /// The app may read only an approximate location.
  const LocationSettingException.imprecise()
      : super('Please Enable Precise Location');
}
