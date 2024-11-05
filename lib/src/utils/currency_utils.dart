import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

class CurrencyUtil {
  bool isInternationalCompany;

  CurrencyUtil({this.isInternationalCompany = false});

  final NumberFormat _indCurrencyDoubleFormat =
      NumberFormat("##,##,###.##", "en_IN");

  final NumberFormat _indCurrencyIntFormat =
      NumberFormat.simpleCurrency(decimalDigits: 2, locale: "en_IN");

  final NumberFormat _internationalCurrencyIntFormat =
      NumberFormat.simpleCurrency(decimalDigits: 2, locale: "en_US");

  final NumberFormat _indCurrencyDouble2PlacesFormat =
      NumberFormat("##,##,###.00", "en_IN");

  String getFormattedInrDouble(num amount) => isInternationalCompany
      ? convertToInternationalNumbering(amount.toDouble())
      : _indCurrencyDoubleFormat.format(amount);

  String getFormattedInrInt(num amount) => isInternationalCompany
      ? _internationalCurrencyIntFormat.format(amount)
      : _indCurrencyIntFormat.format(amount);

  String getFormattedIntDouble2Places(num amount) => isInternationalCompany
      ? convertToInternationalNumbering(amount.toDouble(), decimalPlaces: 2)
      : _indCurrencyDouble2PlacesFormat.format(amount);

  String convertToInternationalNumbering(double value,
      {int decimalPlaces = 2, isCompact = true}) {
    String _getHashForDecimalPlaces(int decimalPlaces) {
      var hash = "";
      for (var x = 0; x < decimalPlaces - 2; x++) {
        hash = hash + "#";
      }
      return hash;
    }

    if (!isCompact) {
      if (decimalPlaces > 0) {
        final formatter =
            NumberFormat("###,###.0${_getHashForDecimalPlaces(decimalPlaces)}");
        return formatter.format(value);
      } else {
        final formatter = NumberFormat("###,###");
        return formatter.format(value);
      }
    }

    if (value > 1000000000) {
      final calculated = value / 1000000000;
      return '${calculated.toStringAsFixed(decimalPlaces)} B';
    } else if (value > 1000000) {
      final calculated = value / 1000000;
      return '${calculated.toStringAsFixed(decimalPlaces)} M';
    } else {
      final numberFormat = NumberFormat("#,##0.0", "en_US");
      return numberFormat.format(value);
    }
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

  String formatNumber(num amt, {bool compact = false}) {
    // final number = (amt * 100).round() / 100;
    /// Decimal package added due floating-point precision error
    final scaledNum =
        (Decimal.parse(amt.toString()) * Decimal.parse('100')).toDouble();

    /// Round the number to 2 decimal places
    final number = scaledNum.round() / 100;

    final formatter = NumberFormat.currency(
      decimalDigits: 2,
      locale: isInternationalCompany ? "en_US" : "en_IN",
      symbol: "",
    );

    if (compact) {
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
}
