import 'package:intl/intl.dart';

class Util {
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_IN').format(amount);
  }
}
