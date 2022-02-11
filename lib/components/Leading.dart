import 'package:flutter/material.dart';

class DiamondLeading {
  static Widget create(BuildContext context, {
    Function()? fn
  }) {
    return Builder(
      builder: (context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => fn!(),
      ),
    );
  }
}