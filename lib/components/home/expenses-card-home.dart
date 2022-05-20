import 'package:flutter/material.dart';

import '../communs/car-buttom.dart';

class ExpensesCardHome extends StatefulWidget {
  ExpensesCardHome({Key? kay}) : super(key: kay);

  @override
  _ExpensesCardHomeState createState() => _ExpensesCardHomeState();
}

class _ExpensesCardHomeState extends State<ExpensesCardHome> {
  @override
  Widget build(BuildContext context) {
    return CardButtom(
      title: 'Despesas',
      onClock: () {
        print("On click");
      },
      child: Text("tete"),
    );
  }
}
