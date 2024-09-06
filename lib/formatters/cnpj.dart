import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CNPJFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    RegExp exp = new RegExp(r"\D+");
    RegExp pattern_replace = new RegExp(r'[$,.a-zA-Z;\-\\/]');
    int selectionIndex;
    String text;

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

    if (text.length >= 12) {
      text_returned = text.substring(0, 2) + "." + text.substring(2, 5) + "." + text.substring(5, 8) + "/" + text.substring(8, 12) + "-" + text.substring(12, text.length);
    }
    else if (text.length >= 9) {
      text_returned = text.substring(0, 2) + "." + text.substring(2, 5) + "." + text.substring(5, 8) + "/" + text.substring(8, text.length);
    }
    else if (text.length >= 6) {
      text_returned = text.substring(0, 2) + "." + text.substring(2, 5) + "." + text.substring(5, text.length);
    }
    else if (text.length >= 3) {
      text_returned = text.substring(0, 2) + "." + text.substring(2, text.length);
    }

    selectionIndex = text_returned.length;

    return TextEditingValue(
      text: text_returned,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}