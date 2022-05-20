import 'package:flutter/material.dart';
import 'package:renter_app/components/communs/title-buttom.dart';

import '../communs/car-buttom.dart';

class BalanceCard extends StatelessWidget {
  BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardButtom(
        title: 'Saldo',
        onClock: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    '-R\$ 2000',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.normal,
                        color: Colors.red),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'despesas:',
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                        Text(
                          "R\$ 1000",
                          style: TextStyle(color: Colors.grey, fontSize: 24),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'renda:',
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                        Text(
                          "R\$ 1000",
                          style: TextStyle(color: Colors.grey, fontSize: 24),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Divider()
            ],
          ),
        ));
    // ),
  }
}
