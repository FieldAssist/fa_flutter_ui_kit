import 'package:intl/intl.dart';

class CurrencyUtil {
  CurrencyUtil._();

  static final NumberFormat _indCurrencyDoubleFormat =
      NumberFormat("##,##,###.##", "en_IN");

  static final NumberFormat _indCurrencyIntFormat =
      NumberFormat.simpleCurrency(decimalDigits: 2, locale: "en_IN");

  static final NumberFormat _indCurrencyDouble2PlacesFormat =
      NumberFormat("##,##,###.00", "en_IN");

  static String getFormattedInrDouble(num amount) =>
      _indCurrencyDoubleFormat.format(amount);

  static String getFormattedInrInt(num amount) =>
      _indCurrencyIntFormat.format(amount);

  static String getFormattedIntDouble2Places(num amount) =>
      _indCurrencyDouble2PlacesFormat.format(amount);
  
  static String formatNumber(num amt) {
    final number = (amt * 100).round() / 100;
    final formatter = NumberFormat.currency(
      decimalDigits: 2,
      locale: "en_IN",
      symbol: "",
    );

    return formatter.format(number);
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
}
