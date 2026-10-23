import 'package:csv_localizations/csv_localizations.dart';

/// User-visible strings of this package. Keys match the tenant CSV the host
/// loads, so translations carry over from the host unchanged.
class UiCommonTexts {
  factory UiCommonTexts() => _instance;

  UiCommonTexts._();

  static final _instance = UiCommonTexts._();

  static String? _tr(String key) {
    try {
      final value = CsvLocalizations.instance.string(key);
      if (value.isEmpty) {
        return null;
      }
      return value;
    } catch (e) {
      return null;
    }
  }

  String get kBackOnline => _tr("kBackOnline") ?? "Back Online";

  String get kCrop => _tr("kCrop") ?? "Crop";

  String get errorSomethingWentWrong =>
      _tr("errorSomethingWentWrong") ?? "Oops! Something went wrong.";

  String get kGuide => _tr("kGuide") ?? "Guide";

  String get kKeep => _tr("kKeep") ?? "Keep";

  String get kListening => _tr("kListening") ?? "Listening...";

  String get kNoCameraAvailable =>
      _tr("kNoCameraAvailable") ?? "No camera available!";

  String get kNoInternetConnectionBanner =>
      _tr("kNoInternetConnectionBanner") ?? "No Internet Connection";

  String get kOk => _tr("kOk") ?? "OK";

  String get kPreview => _tr("kPreview") ?? "Preview";

  String get kRemarks => _tr("kRemarks") ?? "Remarks";

  String get kRetake => _tr("kRetake") ?? "Retake";

  String get kScanDocument => _tr("kScanDocument") ?? "Scan Document";

  String get kScanProductBarcode =>
      _tr("kScanProductBarcode") ?? "Scan Product Barcode";

  String get kScanProductBarcodeHint =>
      _tr("kScanProductBarcodeHint") ?? "Align the barcode within the frame";

  String get kSearchProducts => _tr("kSearchProducts") ?? "Search Products";

  String get kSwitchCamera => _tr("kSwitchCamera") ?? "Switch Camera";

  String get kTakePhoto => _tr("kTakePhoto") ?? "Take Photo";

  String get kTakePicture => _tr("kTakePicture") ?? "Take Picture";

  String get kTapOnMicAndSpeakAgain =>
      _tr("kTapOnMicAndSpeakAgain") ?? "Tap on mic and speak again";

  String get kVoiceSearchFailed =>
      _tr("kVoiceSearchFailed") ?? "Sorry! We couldn't understand";
}
