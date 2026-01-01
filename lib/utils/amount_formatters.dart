import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';

class CustomThousandSeparatorFormatter extends TextInputFormatter {
  final CurrencyInputFormatter _formatter = CurrencyInputFormatter(
    thousandSeparator: ThousandSeparator.Period,
    mantissaLength: 0,
    leadingSymbol: '',
    trailingSymbol: '',
  );

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    return _formatter.formatEditUpdate(oldValue, newValue);
  }
}