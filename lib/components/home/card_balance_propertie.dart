import 'package:flutter/material.dart';

class CardBalancePropertie extends StatelessWidget {
  const CardBalancePropertie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('renda', style: TextStyle(fontSize: 12)),
              Text('2000', style: TextStyle(fontSize: 22))
            ],
          ),
        ),
      ),
    );
  }
}
