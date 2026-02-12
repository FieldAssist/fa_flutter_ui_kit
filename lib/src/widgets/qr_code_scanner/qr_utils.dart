/// Extracts the UPI ID from a scanned QR code string.
///
/// This function attempts to parse the UPI ID (Virtual Payment Address) from a
/// standard UPI URI format (e.g., `upi://pay?pa=user@bank&...`). It looks for
/// the `pa` query parameter.
///
/// It handles cases where `pa` is the first parameter (`?pa=`) or a subsequent
/// parameter (`&pa=`).
///
/// If the string does not contain `?pa=` or `&pa=`, it returns the original
/// string, assuming it might be a raw VPA.
///
/// This implementation is robust against malformed URIs and missing parameters,
/// preventing crashes that could occur with naive substring extraction.
String extractUPIID(String scannedData) {
  var paIndex = scannedData.indexOf('?pa=');
  if (paIndex == -1) {
    paIndex = scannedData.indexOf('&pa=');
  }

  if (paIndex != -1) {
    final startIndex = paIndex + 4;
    final endIndex = scannedData.indexOf('&', startIndex);
    if (endIndex != -1) {
      return scannedData.substring(startIndex, endIndex);
    }
    return scannedData.substring(startIndex);
  }
  return scannedData;
}
