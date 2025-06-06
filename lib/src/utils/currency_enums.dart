import 'package:fa_flutter_ui_kit/src/utils/currency_models.dart';
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
}

extension CurrencyLocaleExtension on CurrencyLocale {
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
