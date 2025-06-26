import 'package:decimal/decimal.dart';
import 'package:fa_flutter_ui_kit/src/utils/currency/enums.dart';
import 'package:fa_flutter_ui_kit/src/utils/currency/models.dart';

class CurrencyUtil {
  bool isInternationalCompany;
  bool companyUsesFrenchForCurrencyConversion;
  int decimalDigits;
  final CurrencyLocale locale;

  CurrencyUtil({
    this.isInternationalCompany = false,
    this.companyUsesFrenchForCurrencyConversion = false,
    this.decimalDigits = 2,
    this.locale = CurrencyLocale.indian,
  });

  bool get isArabic => locale == CurrencyLocale.arabic;

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

  String formatNumber(num inputValue,
      {bool compact = false, int? passedDecimalDigits}) {
    final normalizedValue = roundNumber(inputValue);
    final usedDecimalDigits =
        passedDecimalDigits ?? (inputValue % 1 == 0 ? 0 : decimalDigits);
    final localFormatter = locale.getCurrencyFormatNoSymbol(usedDecimalDigits);

    try {
      if (!compact) {
        final formatted = localFormatter.format(normalizedValue);
        return isArabic ? _convertToArabicIndicDigits(formatted) : formatted;
      }

      final compactResult = _getCompactFormatResult(normalizedValue);
      if (!compactResult.wasCompacted) {
        final formatted = localFormatter.format(normalizedValue);
        return isArabic ? _convertToArabicIndicDigits(formatted) : formatted;
      }

      final formattedValue = localFormatter.format(compactResult.value);
      final result = isArabic
          ? _convertToArabicIndicDigits(formattedValue)
          : formattedValue;
      return '$result${compactResult.suffix}';
    } catch (e) {
      final fallback = normalizedValue.toStringAsFixed(usedDecimalDigits);
      return compact
          ? '${isArabic ? _convertToArabicIndicDigits(fallback) : fallback} (${locale.localeCode})'
          : (isArabic ? _convertToArabicIndicDigits(fallback) : fallback);
    }
  }

  String formatCurrency(
    num value, {
    int? passedDecimalDigits,
  }) {
    final usedDecimalDigits =
        passedDecimalDigits ?? (value % 1 == 0 ? 0 : decimalDigits);
    final normalizedValue = roundNumber(value);

    final localFormatter = locale.getCurrencyFormat(usedDecimalDigits);
    try {
      final formatted = localFormatter.format(normalizedValue);
      return isArabic ? _convertToArabicIndicDigits(formatted) : formatted;
    } catch (e) {
      final fallback = normalizedValue.toStringAsFixed(usedDecimalDigits);
      return isArabic ? _convertToArabicIndicDigits(fallback) : fallback;
    }
  }

  String getFormattedInrDouble(num amount) =>
      formatNumber(amount, compact: true);
  String getFormattedInrInt(num amount) => formatCurrency(amount);
  String getFormattedIntDouble2Places(num amount) =>
      formatNumber(amount, compact: true, passedDecimalDigits: 2);

  static CurrencyUtil fromLocaleCode(
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

  String _convertToArabicIndicDigits(String input) {
    const westernToArabicDigits = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
      ',': '٬', // Arabic thousands separator (U+066C)
      '.': '٫', // Arabic decimal separator (U+066B)
    };

    return input
        .split('')
        .map((char) => westernToArabicDigits[char] ?? char)
        .join('');
  }
}
