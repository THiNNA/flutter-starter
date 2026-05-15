import 'package:intl/intl.dart';

/// Utility class for formatting dates, currency, etc.
class Formatters {
  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(amount);
  }
}
