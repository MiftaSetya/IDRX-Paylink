import 'package:intl/intl.dart';

class AmountFormatter {
  AmountFormatter._();

  static final NumberFormat _idFormatter = NumberFormat('#,###', 'id_ID');

  static String format(int amount) {
    return _idFormatter.format(amount).replaceAll(',', '.');
  }

  static String formatFromString(String raw) {
    final clean = raw.replaceAll(RegExp(r'[^0-9]'), '');
    final value = int.tryParse(clean) ?? 0;
    return format(value);
  }

  static int parse(String formatted) {
    final clean = formatted.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(clean) ?? 0;
  }
}