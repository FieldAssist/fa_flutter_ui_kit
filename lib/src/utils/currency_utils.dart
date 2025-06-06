import 'package:decimal/decimal.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:intl/intl.dart';

enum FormatterType {
  currency,
  currencyNoSymbol,
  decimal,
}

// Billion - for all large scale values (1,000,000,000)
// Million - for medium scale values (1,000,000)
// Thousand - for small scale values (1,000)

enum CurrencySuffix {
  indianBillion,
  indianMillion,
  indianThousand,
  internationalBillion,
  internationalMillion,
  internationalThousand,
  frenchBillion,
  frenchMillion,
  frenchThousand,
  spanishBillion,
  spanishMillion,
  spanishThousand,
  arabicBillion,
  arabicMillion,
  arabicThousand,
  portugueseBrazilBillion,
  portugueseBrazilMillion,
  portugueseBrazilThousand,
  portuguesePortugalBillion,
  portuguesePortugalMillion,
  portuguesePortugalThousand,
  italianBillion,
  italianMillion,
  italianThousand,
}

extension CurrencySuffixExtension on CurrencySuffix {
  String get value {
    switch (this) {
      case CurrencySuffix.indianBillion:
        return 'Cr';
      case CurrencySuffix.indianMillion:
        return 'Lakh';
      case CurrencySuffix.indianThousand:
        return 'K';
      case CurrencySuffix.internationalBillion:
        return 'B';
      case CurrencySuffix.internationalMillion:
        return 'M';
      case CurrencySuffix.internationalThousand:
        return 'K';
      case CurrencySuffix.frenchBillion:
        return ' Md';
      case CurrencySuffix.frenchMillion:
        return ' M';
      case CurrencySuffix.frenchThousand:
        return ' k';
      case CurrencySuffix.spanishBillion:
        return ' mil M';
      case CurrencySuffix.spanishMillion:
        return ' M';
      case CurrencySuffix.spanishThousand:
        return ' mil';
      case CurrencySuffix.arabicBillion:
        return ' مليار';
      case CurrencySuffix.arabicMillion:
        return ' مليون';
      case CurrencySuffix.arabicThousand:
        return ' ألف';
      case CurrencySuffix.portugueseBrazilBillion:
        return ' bi';
      case CurrencySuffix.portugueseBrazilMillion:
        return ' mi';
      case CurrencySuffix.portugueseBrazilThousand:
        return ' mil';
      case CurrencySuffix.portuguesePortugalBillion:
        return ' mil M';
      case CurrencySuffix.portuguesePortugalMillion:
        return ' M';
      case CurrencySuffix.portuguesePortugalThousand:
        return ' mil';
      case CurrencySuffix.italianBillion:
        return ' Mrd';
      case CurrencySuffix.italianMillion:
        return ' Mln';
      case CurrencySuffix.italianThousand:
        return ' K';
    }
  }
}

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

enum CurrencyLocale {
  indian('en_IN', false, [
    CompactScale(
        threshold: 10000000,
        divisor: 10000000,
        suffix: CurrencySuffix.indianBillion),
    CompactScale(
        threshold: 100000,
        divisor: 100000,
        suffix: CurrencySuffix.indianMillion),
    CompactScale(
        threshold: 1000, divisor: 1000, suffix: CurrencySuffix.indianThousand),
  ]),

  international('en_US', false, [
    CompactScale(
        threshold: 1000000000,
        divisor: 1000000000,
        suffix: CurrencySuffix.internationalBillion),
    CompactScale(
        threshold: 1000000,
        divisor: 1000000,
        suffix: CurrencySuffix.internationalMillion),
    CompactScale(
        threshold: 1000,
        divisor: 1000,
        suffix: CurrencySuffix.internationalThousand),
  ]),

  french('fr_FR', false, [
    CompactScale(
        threshold: 1000000000,
        divisor: 1000000000,
        suffix: CurrencySuffix.frenchBillion),
    CompactScale(
        threshold: 1000000,
        divisor: 1000000,
        suffix: CurrencySuffix.frenchMillion),
    CompactScale(
        threshold: 1000, divisor: 1000, suffix: CurrencySuffix.frenchThousand),
  ]),

  spanish('es_ES', false, [
    CompactScale(
        threshold: 1000000000,
        divisor: 1000000000,
        suffix: CurrencySuffix.spanishBillion),
    CompactScale(
        threshold: 1000000,
        divisor: 1000000,
        suffix: CurrencySuffix.spanishMillion),
    CompactScale(
        threshold: 1000, divisor: 1000, suffix: CurrencySuffix.spanishThousand),
  ]),

  arabic('ar_SA', true, [
    CompactScale(
        threshold: 1000000000,
        divisor: 1000000000,
        suffix: CurrencySuffix.arabicBillion),
    CompactScale(
        threshold: 1000000,
        divisor: 1000000,
        suffix: CurrencySuffix.arabicMillion),
    CompactScale(
        threshold: 1000, divisor: 1000, suffix: CurrencySuffix.arabicThousand),
  ]),

  portugueseBrazil('pt_BR', false, [
    CompactScale(
        threshold: 1000000000,
        divisor: 1000000000,
        suffix: CurrencySuffix.portugueseBrazilBillion),
    CompactScale(
        threshold: 1000000,
        divisor: 1000000,
        suffix: CurrencySuffix.portugueseBrazilMillion),
    CompactScale(
        threshold: 1000,
        divisor: 1000,
        suffix: CurrencySuffix.portugueseBrazilThousand),
  ]),

  portuguesePortugal('pt_PT', false, [
    CompactScale(
        threshold: 1000000000,
        divisor: 1000000000,
        suffix: CurrencySuffix.portuguesePortugalBillion),
    CompactScale(
        threshold: 1000000,
        divisor: 1000000,
        suffix: CurrencySuffix.portuguesePortugalMillion),
    CompactScale(
        threshold: 1000,
        divisor: 1000,
        suffix: CurrencySuffix.portuguesePortugalThousand),
  ]),

  italian('it_IT', false, [
    CompactScale(
        threshold: 1000000000,
        divisor: 1000000000,
        suffix: CurrencySuffix.italianBillion),
    CompactScale(
        threshold: 1000000,
        divisor: 1000000,
        suffix: CurrencySuffix.italianMillion),
    CompactScale(
        threshold: 1000, divisor: 1000, suffix: CurrencySuffix.italianThousand),
  ]);

  const CurrencyLocale(this.localeCode, this.isRTL, this.compactScales);

  final String localeCode;
  final bool isRTL;
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
    FormatterType type,
    int decimalDigits, {
    String symbol = '',
  }) {
    try {
      switch (type) {
        case FormatterType.currency:
          return NumberFormat.simpleCurrency(
            decimalDigits: decimalDigits,
            locale: localeCode,
          );
        case FormatterType.currencyNoSymbol:
          return NumberFormat.currency(
            decimalDigits: decimalDigits,
            locale: localeCode,
            symbol: symbol,
          );
        case FormatterType.decimal:
          return NumberFormat.decimalPattern(localeCode);
      }
    } catch (e) {
      return null;
    }
  }

  NumberFormat getCurrencyFormat(int decimalDigits) {
    return _createFormatter(FormatterType.currency, decimalDigits) ??
        NumberFormat.simpleCurrency(decimalDigits: decimalDigits);
  }

  NumberFormat getCurrencyFormatNoSymbol(int decimalDigits) {
    return _createFormatter(FormatterType.currencyNoSymbol, decimalDigits,
            symbol: '') ??
        NumberFormat('#,##0.${'0' * decimalDigits}');
  }

  NumberFormat getDecimalFormat() {
    return _createFormatter(FormatterType.decimal, 0) ?? NumberFormat('#,##0');
  }
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
      suffix: scale.suffix.value,
      wasCompacted: true,
    );
  }

  String formatNumber(num inputValue, {bool compact = false}) {
    final normalizedValue = roundNumber(inputValue);

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
    final normalizedValue = roundNumber(value);
    try {
      return _currencyFormatter.format(normalizedValue);
    } catch (e) {
      return normalizedValue.toStringAsFixed(decimalDigits);
    }
  }

  String getFormattedInrDouble(num amount) => formatNumber(amount);
  String getFormattedInrInt(num amount) => formatCurrency(amount);
  String getFormattedIntDouble2Places(num amount) => formatNumber(amount);

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
