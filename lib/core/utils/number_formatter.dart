import 'package:intl/intl.dart';

class NumberFormatter {
  NumberFormatter._();

  static final _enFormatter = NumberFormat('#,##0.####', 'en_US');
  static final _bnFormatter = NumberFormat('#,##0.####', 'bn_BD');

  static String format(double value, {bool bangla = false}) {
    final formatted = bangla
        ? _bnFormatter.format(value)
        : _enFormatter.format(value);
    return formatted;
  }

  static String formatCompact(double value, {bool bangla = false}) {
    if (value >= 1000000) {
      return '${format(value / 1000000, bangla: bangla)}M';
    }
    if (value >= 1000) {
      return '${format(value / 1000, bangla: bangla)}K';
    }
    return format(value, bangla: bangla);
  }

  static String toBanglaDigits(String input) {
    const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', ','];
    const bn = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯', '.', ','];
    var result = input;
    for (int i = 0; i < en.length; i++) {
      result = result.replaceAll(en[i], bn[i]);
    }
    return result;
  }
}
