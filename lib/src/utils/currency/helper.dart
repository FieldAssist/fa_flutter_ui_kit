import 'package:decimal/decimal.dart';
import 'package:fa_flutter_ui_kit/src/utils/currency/enums.dart';
import 'package:fa_flutter_ui_kit/src/utils/currency/models.dart';

class CurrencyUtil {
  bool isInternationalCompany;
  bool companyUsesFrenchForCurrencyConversion;
  int decimalDigits;
  final CurrencyLocale locale;
  final bool useCompactFormat;

  CurrencyUtil({
    this.isInternationalCompany = false,
    this.companyUsesFrenchForCurrencyConversion = false,
    this.decimalDigits = 2,
    this.locale = CurrencyLocale.indian,
    this.useCompactFormat = false,
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
      {bool? compact, int? passedDecimalDigits}) {
    final useCompact = compact ?? useCompactFormat;
    final normalizedValue = roundNumber(inputValue);
    final compactResult = _getCompactFormatResult(normalizedValue);
    final compactValue = compactResult.value;
    final usedDecimalDigits = passedDecimalDigits ??
        ((compactValue % 1 != 0 || inputValue % 1 != 0) ? decimalDigits : 0);
    final localFormatter = locale.getCurrencyFormatNoSymbol(usedDecimalDigits);

    try {
      if (!useCompact || !compactResult.wasCompacted) {
        final formatted = localFormatter.format(normalizedValue);
        return isArabic ? _convertToArabicIndicDigits(formatted) : formatted;
      }

      final formattedValue = localFormatter.format(compactValue);
      final result = isArabic
          ? _convertToArabicIndicDigits(formattedValue)
          : formattedValue;
      return '$result${compactResult.suffix}';
    } catch (e) {
      final value = normalizedValue.toStringAsFixed(usedDecimalDigits);
      return useCompact
          ? '${isArabic ? _convertToArabicIndicDigits(value) : value} (${locale.localeCode})'
          : (isArabic ? _convertToArabicIndicDigits(value) : value);
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

  String getFormattedInrDouble(num amount, {bool? compact}) =>
      formatNumber(amount, compact: compact);
  String getFormattedInrInt(num amount) => formatCurrency(amount);
  String getFormattedIntDouble2Places(num amount, {bool? compact}) =>
      formatNumber(amount, compact: compact, passedDecimalDigits: 2);

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
