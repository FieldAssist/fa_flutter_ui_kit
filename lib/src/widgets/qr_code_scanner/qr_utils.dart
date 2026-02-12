/// Extracts the UPI ID from a scanned QR code string.
///
/// This function attempts to parse the UPI ID (Virtual Payment Address) from a
/// standard UPI URI format (e.g., `upi://pay?pa=user@bank&...`).
///
/// It uses robust URI parsing to extract the `pa` query parameter.
/// If multiple `pa` parameters are present, it returns the first one.
///
/// If the string is not a valid URI or does not contain the `pa` parameter,
/// it returns the original string, assuming it might be a raw VPA.
String extractUPIID(String scannedData) {
  try {
    final uri = Uri.tryParse(scannedData);
    if (uri != null) {
      final paValues = uri.queryParametersAll['pa'];
      if (paValues != null && paValues.isNotEmpty) {
        return paValues.first;
      }
    }
  } catch (e) {
    // If parsing fails (e.g., bad encoding), return the original string.
  }
  return scannedData;
}
