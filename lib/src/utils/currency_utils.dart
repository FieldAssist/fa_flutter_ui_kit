import 'package:decimal/decimal.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:intl/intl.dart';

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

  CompactScale? getCompactScale(double value) {
    final absValue = value.abs();

    for (final scale in compactScales) {
      if (absValue >= scale.threshold) {
        return scale;
      }
    }
    return null;
  }

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
      return null;
    }
  }

  // Get currency formatter with symbol
  NumberFormat getCurrencyFormat(int decimalDigits) {
    return _createFormatter('currency', decimalDigits) ??
        NumberFormat.simpleCurrency(decimalDigits: decimalDigits);
  }

  // Get currency formatter without symbol
  NumberFormat getCurrencyFormatNoSymbol(int decimalDigits) {
    return _createFormatter('currency_no_symbol', decimalDigits, symbol: '') ??
        NumberFormat('#,##0.${'0' * decimalDigits}');
  }

  // Get decimal formatter for the locale
  NumberFormat getDecimalFormat() {
    return _createFormatter('decimal', 0) ?? NumberFormat('#,##0');
  }

  // Check if this locale uses right-to-left text direction
  bool get isRTL => this == CurrencyLocale.arabic;

  // Get locale-specific formatting information
  NumberFormatInfo get formatInfo {
    try {
      final decimalFormat = NumberFormat.decimalPattern(localeCode);
      return NumberFormatInfo(
        groupingSeparator: decimalFormat.symbols.GROUP_SEP,
        decimalSeparator: decimalFormat.symbols.DECIMAL_SEP,
        isRTL: isRTL,
      );
    } catch (e) {
      return const NumberFormatInfo(
        groupingSeparator: ',',
        decimalSeparator: '.',
        isRTL: false,
      );
    }
  }

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

class CurrencyUtil {
  bool isInternationalCompany;
  bool companyUsesFrenchForCurrencyConversion;
  int decimalDigits;
  final CurrencyLocale locale;
  late final NumberFormat _currencyFormatter;
  late final NumberFormat _currencyNoSymbolFormatter;
  late final NumberFormat _decimalFormatter;

  CurrencyUtil({
    this.isInternationalCompany = false,
    this.companyUsesFrenchForCurrencyConversion = false,
    this.decimalDigits = 2,
    this.locale = CurrencyLocale.indian,
  }) {
    _initializeFormatters();
  }

  void _initializeFormatters() {
    _currencyFormatter = locale.getCurrencyFormat(decimalDigits);
    _currencyNoSymbolFormatter =
        locale.getCurrencyFormatNoSymbol(decimalDigits);
    _decimalFormatter = locale.getDecimalFormat();
  }

  double _normalizeNumber(num value) {
    try {
      final decimal = Decimal.parse(value.toString());
      final epsilon = Decimal.parse("1e-10");
      final adjustedDecimal = decimal + epsilon;
      final scaledDecimal = adjustedDecimal * Decimal.fromInt(100);
      final roundedDecimal = scaledDecimal.round();
      return (roundedDecimal / Decimal.fromInt(100)).toDouble();
    } catch (e) {
      return double.parse(value.toStringAsFixed(decimalDigits + 2));
    }
  }

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
      return compact
          ? '${normalizedValue.toStringAsFixed(decimalDigits)} (${locale.localeCode})'
          : normalizedValue.toStringAsFixed(decimalDigits);
    }
  }

  String formatCurrency(num value) {
    final normalizedValue = _normalizeNumber(value);
    try {
      return _currencyFormatter.format(normalizedValue);
    } catch (e) {
      return normalizedValue.toStringAsFixed(decimalDigits);
    }
  }

  String convertToLocale(
    CurrencyLocale targetLocale,
    num value, {
    bool compact = false,
  }) {
    final converter =
        CurrencyUtil(locale: targetLocale, decimalDigits: decimalDigits);
    return converter.formatNumber(value, compact: compact);
  }

  String getFormattedInrDouble(num amount) => formatNumber(amount);
  String getFormattedInrInt(num amount) => formatCurrency(amount);
  String getFormattedIntDouble2Places(num amount) => formatNumber(amount);

  static bool isLocaleSupported(String localeCode) {
    return CurrencyLocale.values
        .any((locale) => locale.localeCode == localeCode && locale.isSupported);
  }

  CurrencyUtil fromLocaleCode(
    String localeCode, {
    int decimalDigits = 2,
  }) {
    final locale = CurrencyLocale.values.firstWhere(
      (l) => l.localeCode == localeCode,
      orElse: () => CurrencyLocale.indian,
    );
    return CurrencyUtil(locale: locale, decimalDigits: decimalDigits);
  }

  static List<String> getSupportedLocales() {
    return CurrencyLocale.values
        .where((locale) => locale.isSupported)
        .map((locale) => locale.localeCode)
        .toList();
  }

  NumberFormatInfo get formatInfo => locale.formatInfo;

  bool get isValid => locale.isSupported && decimalDigits >= 0;

  List<CompactScale> get availableScales => locale.compactScales;

  double roundNumber(
    num value,
  ) =>
      getDecimalVal(value);

  double getDecimalVal(num value) {
    final _amt = Decimal.parse(value.toString());

    final epsilon = Decimal.parse("0.00000000000001");
    final adjustedAmt = _amt + epsilon;

    final scaledNum = (adjustedAmt * Decimal.fromInt(100));
    final roundedNum = scaledNum.round();

    final number = (roundedNum / Decimal.fromInt(100)).toDouble();
    return number;
  }
}
