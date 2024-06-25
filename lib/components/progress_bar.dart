import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiamondCircularProgressBar {
  static void create(BuildContext context) {
    showDialog(
      barrierDismissible : false,
      context: context,
      builder: (context) => 
        PopScope(
          child: Container(
            alignment: AlignmentDirectional.center,
            child: Platform.isIOS ? new CupertinoActivityIndicator(animating : true)
            : new CircularProgressIndicator()
          )
        )
    );
  }
}