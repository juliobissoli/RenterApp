import 'package:flutter/material.dart';

class CircularIndicatorDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CircularProgressIndicator(
      backgroundColor: Colors.black,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      strokeWidth: 3,
    );
  }
}