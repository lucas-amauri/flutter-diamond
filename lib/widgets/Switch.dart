import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiamondSwitch extends StatefulWidget {
  const DiamondSwitch(this.value, this.onChanged, {Key? key}) : super(key : key);
  final bool value;
  final Function(bool?) onChanged;

  @override
  _DiamondSwitch createState() => _DiamondSwitch();
}

class _DiamondSwitch extends State<DiamondSwitch> {
  @override
  Widget build(BuildContext context) =>
  Platform.isIOS ? 
  CupertinoSwitch(value: widget.value, onChanged: widget.onChanged) :
  Switch(value: widget.value, onChanged: widget.onChanged);
}