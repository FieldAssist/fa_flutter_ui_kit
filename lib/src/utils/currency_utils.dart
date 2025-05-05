import 'package:decimal/decimal.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:intl/intl.dart';

class CurrencyUtil {
  bool isInternationalCompany;
  bool companyUsesFrenchForCurrencyConversion;
  int decimalDigits;

  CurrencyUtil({
    this.isInternationalCompany = false,
    this.companyUsesFrenchForCurrencyConversion = false,
    this.decimalDigits = 2,
  });

  NumberFormat get _indCurrencyDoubleFormat =>
      NumberFormat("##,##,###.${"#" * decimalDigits}", "en_IN");

  NumberFormat get _indCurrencyIntFormat => NumberFormat.simpleCurrency(
        decimalDigits: decimalDigits,
        locale: "en_IN",
      );

  NumberFormat get _internationalCurrencyIntFormat =>
      NumberFormat.simpleCurrency(
        decimalDigits: decimalDigits,
        locale: "en_US",
      );

  NumberFormat get _frenchCurrencyIntFormat => NumberFormat.simpleCurrency(
        decimalDigits: decimalDigits,
        locale: 'fr',
      );

  NumberFormat get _indCurrencyDouble2PlacesFormat =>
      NumberFormat("##,##,###.${"0" * decimalDigits}", "en_IN");

  String getFormattedInrDouble(num amount) => isInternationalCompany
      ? convertToInternationalNumbering(amount.toDouble())
      : companyUsesFrenchForCurrencyConversion
          ? convertToFrenchNumbering(amount.toDouble())
          : _indCurrencyDoubleFormat.format(amount);

  String getFormattedInrInt(num amount) => isInternationalCompany
      ? _internationalCurrencyIntFormat.format(amount)
      : companyUsesFrenchForCurrencyConversion
          ? _frenchCurrencyIntFormat.format(amount)
          : _indCurrencyIntFormat.format(amount);

  String getFormattedIntDouble2Places(num amount) => isInternationalCompany
      ? convertToInternationalNumbering(
          amount.toDouble(),
          decimalPlaces: decimalDigits,
        )
      : companyUsesFrenchForCurrencyConversion
          ? convertToFrenchNumbering(amount.toDouble())
          : _indCurrencyDouble2PlacesFormat.format(amount);

  String _getHashForDecimalPlaces(int decimalPlaces) {
    return "#${"#" * (decimalPlaces - 1)}";
  }

  String convertToInternationalNumbering(double value,
      {int? decimalPlaces, bool isCompact = true}) {
    decimalPlaces ??= this.decimalDigits;

    if (!isCompact) {
      final pattern = decimalPlaces > 0
          ? "###,###.${_getHashForDecimalPlaces(decimalPlaces)}"
          : "###,###";
      final formatter = NumberFormat(pattern);
      return formatter.format(value);
    }

    if (value > 1000000000) {
      final calculated = value / 1000000000;
      return '${calculated.toStringAsFixed(decimalPlaces)} B';
    } else if (value > 1000000) {
      final calculated = value / 1000000;
      return '${calculated.toStringAsFixed(decimalPlaces)} M';
    } else {
      final numberFormat =
          NumberFormat("#,##0.${"0" * decimalPlaces}", "en_US");
      return numberFormat.format(value);
    }
  }

  String convertToFrenchNumbering(double value,
      {int? decimalPlaces, bool isCompact = true}) {
    decimalPlaces ??= this.decimalDigits;

    if (!isCompact) {
      final pattern = decimalPlaces > 0
          ? "###,###.${_getHashForDecimalPlaces(decimalPlaces)}"
          : "###,###";
      final formatter = NumberFormat(pattern, 'fr');
      return formatter.format(value);
    }
    // show currency in compact form
    final formatter = NumberFormat.currency(
      decimalDigits: decimalDigits,
      locale: 'fr',
      symbol: "",
    );
    return getFrenchCalculatedVal(formatter: formatter, number: value);
  }

//TEMP
  static String convertToIndianNumbering(int number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 100000) {
      return '${(number / 1000).toStringAsFixed(0)}K';
    } else if (number < 10000000) {
      return '${(number / 100000).toStringAsFixed(0)} Lakhs';
    } else {
      return '${(number / 10000000).toStringAsFixed(2)}Cr';
    }
  }

  String formatNumber(num value, {bool compact = false}) {
    // final number = (amt * 100).round() / 100;
    /// Decimal package added due floating-point precision error
    final _amt = Decimal.parse(value.toString());

    /// Adding a very tiny epsilon to push borderline cases up.
    final epsilon = Decimal.parse("0.00000000000001");
    final adjustedAmt = _amt + epsilon;

    final scaledNum = (adjustedAmt * Decimal.fromInt(100));
    final roundedNum = scaledNum.round();

    final number = (roundedNum / Decimal.fromInt(100)).toDouble();

    final formatter = NumberFormat.currency(
      decimalDigits: decimalDigits,
      locale: isInternationalCompany
          ? "en_US"
          : companyUsesFrenchForCurrencyConversion
              ? 'fr'
              : "en_IN",
      symbol: "",
    );

    if (compact || companyUsesFrenchForCurrencyConversion) {
      if (isInternationalCompany) {
        // International format
        if (number >= 1000000000) {
          final calculated = number / 1000000000;
          return '${formatter.format(calculated)} B';
        } else if (number >= 1000000) {
          final calculated = number / 1000000;
          return '${formatter.format(calculated)} M';
        } else if (number >= 1000) {
          final calculated = number / 1000;
          return '${formatter.format(calculated)} K';
        }
      } else if (companyUsesFrenchForCurrencyConversion) {
        return getFrenchCalculatedVal(formatter: formatter, number: number);
      } else {
        // Indian format
        if (number >= 10000000) {
          final calculated = number / 10000000;
          return '${formatter.format(calculated)} Cr';
        } else if (number >= 100000) {
          final calculated = number / 100000;
          return '${formatter.format(calculated)} Lakh';
        } else if (number >= 1000) {
          final calculated = number / 1000;
          return '${formatter.format(calculated)} K';
        }
      }
    }

    return formatter.format(number);
  }

  String getFrenchCalculatedVal({
    required double number,
    required NumberFormat formatter,
  }) {
    if (number >= 1000000000) {
      final calculated = number / 1000000000;
      return '${formatter.format(calculated)}Md';
    } else if (number >= 1000000) {
      final calculated = number / 1000000;
      return '${formatter.format(calculated)}M';
    }
    return formatter.format(number);
  }

  double roundNumber(
    num value,
  ) {
    final _amt = Decimal.parse(value.toString());

    final epsilon = Decimal.parse("0.00000000000001");
    final adjustedAmt = _amt + epsilon;

    final scaledNum = (adjustedAmt * Decimal.fromInt(100));
    final roundedNum = scaledNum.round();

    final number = (roundedNum / Decimal.fromInt(100)).toDouble();

    return number.toPrecision(decimalDigits);
  }
}
