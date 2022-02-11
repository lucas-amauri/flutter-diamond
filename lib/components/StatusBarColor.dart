import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class StatusBarColorHighlight {
  static create() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light
    ));
  }
}