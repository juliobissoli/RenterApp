import 'package:flutter/material.dart';

class CardSecondary extends StatelessWidget {
  final Widget child;
  CardSecondary({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: this.child);
  }
}
