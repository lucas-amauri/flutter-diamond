import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    RegExp exp = new RegExp(r"\D+");
    RegExp pattern_replace = new RegExp(r'[$,.a-zA-Z;]');
    String text;
    int selectionIndex;

    if (exp.hasMatch(newValue.text.replaceAll(pattern_replace, ""))) {
      text = oldValue.text;
      selectionIndex = oldValue.selection.end;
    }
    else {
      text = newValue.text;
      selectionIndex = newValue.selection.end;
    }

    text = text.replaceAll(pattern_replace, "");

    String text_returned = text;

    if (text.length >= 3) {
      text_returned = text.substring(0, text.length - 2) + "." + text.substring(text.length - 2, text.length);

      double value = double.parse(text_returned);
      text_returned = NumberFormat.currency(decimalDigits: 2, symbol: "").format(value)
          .replaceAll(r",", ";")
          .replaceAll(r".", ",")
          .replaceAll(r";", ".");

      selectionIndex = text_returned.length;
    }
    else {
      selectionIndex = text_returned.length;
    }

    return TextEditingValue(
      text: text_returned,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}