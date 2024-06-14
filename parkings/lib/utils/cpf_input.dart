import 'package:flutter/services.dart';

class BrazilianPhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.length > 11) {
      return oldValue;
    }

    StringBuffer buffer = StringBuffer();
    int selectionIndex = newValue.selection.end;

    if (text.length > 0) {
      buffer.write('(');
      if (selectionIndex >= 1) selectionIndex++;
    }
    if (text.length > 1) {
      buffer.write(text.substring(0, 2));
      if (selectionIndex >= 2) selectionIndex++;
    }
    if (text.length > 2) {
      buffer.write(') ');
      if (selectionIndex >= 3) selectionIndex += 2;
    }
    if (text.length > 7) {
      buffer.write(text.substring(2, 7) + '-');
      buffer.write(text.substring(7, text.length));
      if (selectionIndex >= 7) selectionIndex++;
    } else if (text.length > 2) {
      buffer.write(text.substring(2, text.length));
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
