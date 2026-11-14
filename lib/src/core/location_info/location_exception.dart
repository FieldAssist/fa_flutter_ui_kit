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
