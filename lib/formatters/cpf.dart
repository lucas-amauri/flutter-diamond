import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CPFFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    RegExp exp = new RegExp(r"\D+");
    RegExp pattern_replace = new RegExp(r'[$,.a-zA-Z;-]');
    int selectionIndex;
    String text;

    if (exp.hasMatch(newValue.text.replaceAll(pattern_replace, ""))) {
      text = oldValue.text;
      selectionIndex = oldValue.selection.extent.offset;
    }
    else {
      text = newValue.text;
      selectionIndex = newValue.selection.extent.offset;
    }

    text = text.replaceAll(pattern_replace, "");

    String text_returned = text;

    if (text.length >= 10) {
      text_returned = text.substring(0, 3) + "." + text.substring(3, 6) + "." + text.substring(6, 9) + "-" + text.substring(9, 11);
    }
    else if (text.length >= 7) {
      text_returned = text.substring(0, 3) + "." + text.substring(3, 6) + "." + text.substring(6, text.length);
    }
    else if (text.length >= 4) {
      text_returned = text.substring(0, 3) + "." + text.substring(3, text.length);
    }

    selectionIndex = text_returned.length;

    return TextEditingValue(
      text: text_returned,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}