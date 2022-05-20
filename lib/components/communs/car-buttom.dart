import 'package:flutter/material.dart';
import 'package:renter_app/components/communs/title-buttom.dart';

class CardButtom extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onClock;

  CardButtom({Key? key, required this.title, required this.child, this.onClock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TitleButtom(
            title: this.title,
            onClock: this.onClock,
          ),
        ),
        this.child
      ]),
    );
  }
}
