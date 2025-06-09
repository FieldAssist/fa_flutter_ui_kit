import 'package:fa_flutter_ui_kit/src/utils/currency/enums.dart';

class CompactScale {
  const CompactScale({
    required this.threshold,
    required this.divisor,
    required this.suffix,
  });
  final double threshold;
  final double divisor;
  final CurrencySuffix suffix;
}

class CompactFormatResult {
  const CompactFormatResult({
    required this.value,
    required this.suffix,
    required this.wasCompacted,
  });
  final double value;
  final String suffix;
  final bool wasCompacted;
}
