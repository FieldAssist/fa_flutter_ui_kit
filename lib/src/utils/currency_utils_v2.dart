import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

/// Represents a compact number scale (like K, M, B)
class CompactScale {
  const CompactScale({
    required this.threshold,
    required this.divisor,
    required this.suffix,
  });
  final double threshold;
  final double divisor;
  final String suffix;
}

/// Enhanced currency locale with proper scaling and validation
enum CurrencyLocale {
  indian('en_IN', [
    CompactScale(threshold: 10000000, divisor: 10000000, suffix: 'Cr'),
    CompactScale(threshold: 100000, divisor: 100000, suffix: 'Lakh'),
    CompactScale(threshold: 1000, divisor: 1000, suffix: 'K'),
  ]),

  international('en_US', [
    CompactScale(threshold: 1000000000, divisor: 1000000000, suffix: 'B'),
    CompactScale(threshold: 1000000, divisor: 1000000, suffix: 'M'),
    CompactScale(threshold: 1000, divisor: 1000, suffix: 'K'),
  ]),

  french('fr_FR', [
    CompactScale(threshold: 1000000000, divisor: 1000000000, suffix: ' Md'),
    CompactScale(threshold: 1000000, divisor: 1000000, suffix: ' M'),
    CompactScale(threshold: 1000, divisor: 1000, suffix: ' k'),
  ]),

  spanish('es_ES', [
    CompactScale(threshold: 1000000000, divisor: 1000000000, suffix: ' mil M'),
    CompactScale(threshold: 1000000, divisor: 1000000, suffix: ' M'),
    CompactScale(threshold: 1000, divisor: 1000, suffix: ' mil'),
  ]),

  arabic('ar_SA', [
    CompactScale(threshold: 1000000000, divisor: 1000000000, suffix: ' مليار'),
    CompactScale(threshold: 1000000, divisor: 1000000, suffix: ' مليون'),
    CompactScale(threshold: 1000, divisor: 1000, suffix: ' ألف'),
  ]),

  portugueseBrazil('pt_BR', [
    CompactScale(threshold: 1000000000, divisor: 1000000000, suffix: ' bi'),
    CompactScale(threshold: 1000000, divisor: 1000000, suffix: ' mi'),
    CompactScale(threshold: 1000, divisor: 1000, suffix: ' mil'),
  ]),

  portuguesePortugal('pt_PT', [
    CompactScale(threshold: 1000000000, divisor: 1000000000, suffix: ' mil M'),
    CompactScale(threshold: 1000000, divisor: 1000000, suffix: ' M'),
    CompactScale(threshold: 1000, divisor: 1000, suffix: ' mil'),
  ]),

  italian('it_IT', [
    CompactScale(threshold: 1000000000, divisor: 1000000000, suffix: ' Mrd'),
    CompactScale(threshold: 1000000, divisor: 1000000, suffix: ' Mln'),
    CompactScale(threshold: 1000, divisor: 1000, suffix: ' K'),
  ]);

  const CurrencyLocale(this.localeCode, this.compactScales);

  final String localeCode;
  final List<CompactScale> compactScales;

  /// Get the appropriate scale for compact formatting
  CompactScale? getCompactScale(double value) {
    final absValue = value.abs();

    // Find the first scale where value meets threshold
    for (final scale in compactScales) {
      if (absValue >= scale.threshold) {
        return scale;
      }
    }
    return null; // No compact formatting needed
  }

  /// Get standard number formatters with better error handling
  NumberFormat? _createFormatter(
    String type,
    int decimalDigits, {
    String symbol = '',
  }) {
    try {
      switch (type) {
        case 'currency':
          return NumberFormat.simpleCurrency(
            decimalDigits: decimalDigits,
            locale: localeCode,
          );
        case 'currency_no_symbol':
          return NumberFormat.currency(
            decimalDigits: decimalDigits,
            locale: localeCode,
            symbol: symbol,
          );
        case 'decimal':
          return NumberFormat.decimalPattern(localeCode);
        default:
          return null;
      }
    } catch (e) {
      // Return null if locale is not supported, caller should handle fallback
      return null;
    }
  }

  /// Get currency formatter with symbol
  NumberFormat getCurrencyFormat(int decimalDigits) {
    return _createFormatter('currency', decimalDigits) ??
        NumberFormat.simpleCurrency(decimalDigits: decimalDigits);
  }

  /// Get currency formatter without symbol
  NumberFormat getCurrencyFormatNoSymbol(int decimalDigits) {
    return _createFormatter('currency_no_symbol', decimalDigits, symbol: '') ??
        NumberFormat('#,##0.${'0' * decimalDigits}');
  }

  /// Get decimal formatter for the locale
  NumberFormat getDecimalFormat() {
    return _createFormatter('decimal', 0) ?? NumberFormat('#,##0');
  }

  /// Check if this locale uses right-to-left text direction
  bool get isRTL => this == CurrencyLocale.arabic;

  /// Get locale-specific formatting information
  NumberFormatInfo get formatInfo {
    try {
      final decimalFormat = NumberFormat.decimalPattern(localeCode);
      return NumberFormatInfo(
        groupingSeparator: decimalFormat.symbols.GROUP_SEP,
        decimalSeparator: decimalFormat.symbols.DECIMAL_SEP,
        isRTL: isRTL,
      );
    } catch (e) {
      // Fallback to common formatting
      return const NumberFormatInfo(
        groupingSeparator: ',',
        decimalSeparator: '.',
        isRTL: false,
      );
    }
  }

  /// Validate if the locale is properly supported by the system
  bool get isSupported {
    try {
      NumberFormat.decimalPattern(localeCode);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class NumberFormatInfo {
  const NumberFormatInfo({
    required this.groupingSeparator,
    required this.decimalSeparator,
    required this.isRTL,
  });
  final String groupingSeparator;
  final String decimalSeparator;
  final bool isRTL;

  @override
  String toString() =>
      'NumberFormatInfo(group: $groupingSeparator, decimal: $decimalSeparator, rtl: $isRTL)';
}

/// Result of compact formatting operation
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

class CurrencyUtilsV2 {
  CurrencyUtilsV2({
    this.locale = CurrencyLocale.indian,
    this.decimalDigits = 2,
  }) {
    _initializeFormatters();
  }

  final CurrencyLocale locale;
  final int decimalDigits;

  // Cache formatters to improve performance
  late final NumberFormat _currencyFormatter;
  late final NumberFormat _currencyNoSymbolFormatter;
  late final NumberFormat _decimalFormatter;

  void _initializeFormatters() {
    _currencyFormatter = locale.getCurrencyFormat(decimalDigits);
    _currencyNoSymbolFormatter =
        locale.getCurrencyFormatNoSymbol(decimalDigits);
    _decimalFormatter = locale.getDecimalFormat();
  }

  /// Normalize number to handle floating point precision issues
  double _normalizeNumber(num value) {
    try {
      final decimal = Decimal.parse(value.toString());
      final epsilon = Decimal.parse("1e-10");
      final adjustedDecimal = decimal + epsilon;
      final scaledDecimal = adjustedDecimal * Decimal.fromInt(100);
      final roundedDecimal = scaledDecimal.round();
      return (roundedDecimal / Decimal.fromInt(100)).toDouble();
    } catch (e) {
      // Fallback if Decimal parsing fails
      return double.parse(value.toStringAsFixed(decimalDigits + 2));
    }
  }

  /// Get compact format result for a number
  CompactFormatResult _getCompactFormatResult(double value) {
    final scale = locale.getCompactScale(value);
    if (scale == null) {
      return CompactFormatResult(
        value: value,
        suffix: '',
        wasCompacted: false,
      );
    }

    return CompactFormatResult(
      value: value / scale.divisor,
      suffix: scale.suffix,
      wasCompacted: true,
    );
  }

  /// Main number formatting method with enhanced error handling
  String formatNumber(num inputValue, {bool compact = false}) {
    final normalizedValue = _normalizeNumber(inputValue);

    try {
      if (!compact) {
        return _currencyNoSymbolFormatter.format(normalizedValue);
      }

      final compactResult = _getCompactFormatResult(normalizedValue);
      if (!compactResult.wasCompacted) {
        return _currencyNoSymbolFormatter.format(normalizedValue);
      }

      final formattedValue =
          _currencyNoSymbolFormatter.format(compactResult.value);
      return '$formattedValue${compactResult.suffix}';
    } catch (e) {
      // Ultimate fallback
      return compact
          ? '${normalizedValue.toStringAsFixed(decimalDigits)} (${locale.localeCode})'
          : normalizedValue.toStringAsFixed(decimalDigits);
    }
  }

  /// Format with currency symbol
  String formatCurrency(num value) {
    final normalizedValue = _normalizeNumber(value);
    try {
      return _currencyFormatter.format(normalizedValue);
    } catch (e) {
      return normalizedValue.toStringAsFixed(decimalDigits);
    }
  }

  /// Convert to specific locale formatting
  String convertToLocale(
    CurrencyLocale targetLocale,
    num value, {
    bool compact = false,
  }) {
    final converter =
        CurrencyUtilsV2(locale: targetLocale, decimalDigits: decimalDigits);
    return converter.formatNumber(value, compact: compact);
  }

  /// Convenience methods for backward compatibility
  String getFormattedInrDouble(num amount) => formatNumber(amount);
  String getFormattedInrInt(num amount) => formatCurrency(amount);
  String getFormattedIntDouble2Places(num amount) => formatNumber(amount);

  static bool isLocaleSupported(String localeCode) {
    return CurrencyLocale.values
        .any((locale) => locale.localeCode == localeCode && locale.isSupported);
  }

  CurrencyUtilsV2 fromLocaleCode(
    String localeCode, {
    int decimalDigits = 2,
  }) {
    final locale = CurrencyLocale.values.firstWhere(
      (l) => l.localeCode == localeCode,
      orElse: () => CurrencyLocale.indian,
    );
    return CurrencyUtilsV2(locale: locale, decimalDigits: decimalDigits);
  }

  static List<String> getSupportedLocales() {
    return CurrencyLocale.values
        .where((locale) => locale.isSupported)
        .map((locale) => locale.localeCode)
        .toList();
  }

  /// Get formatting information
  NumberFormatInfo get formatInfo => locale.formatInfo;

  /// Validate current configuration
  bool get isValid => locale.isSupported && decimalDigits >= 0;

  /// Get available compact scales for current locale
  List<CompactScale> get availableScales => locale.compactScales;
}
