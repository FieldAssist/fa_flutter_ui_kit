import 'package:decimal/decimal.dart';
import 'package:fa_flutter_ui_kit/src/utils/currency_enums.dart';
import 'package:fa_flutter_ui_kit/src/utils/currency_models.dart';
import 'package:intl/intl.dart';

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
