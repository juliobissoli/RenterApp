import 'package:flutter/material.dart';

class SplashScream extends StatefulWidget {
  SplashScream({Key? key}) : super(key: key);
  @override
  _SplashScreamState createState() => _SplashScreamState();
}

class _SplashScreamState extends State<SplashScream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Text('Ta splash....'),
      ),
    ));
  }
}
