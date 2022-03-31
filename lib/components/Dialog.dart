import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiamondDialog {
  static create(BuildContext context, {
    String text : "",
    List<Widget> actions : const [],
    bool dismissable : true
  }) async {
    if (Platform.isIOS) {
      return showDialog(
        barrierDismissible : dismissable,
        context: context, 
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(text),
          actions: actions,
        )
      );
    }
    else {
      return showDialog(
        context: context, 
        builder: (BuildContext context) => AlertDialog(
          title: Text(text),
          actions: actions,
        )
      );
    }
  }
}