import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  Splash({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();   
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child : new Container(
        padding: new EdgeInsets.all(35.0),
        alignment : Alignment.center,
        child : new Image.asset("assets/images/logo.png", height : 200.0),
      )
    );
  }
}