import 'package:flutter/material.dart';
import 'package:renter_app/components/communs/title-buttom.dart';
import 'package:badges/badges.dart';
import '../../interfaces/status.dart';
import '../balance/card-schedule-value.dart';
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
                          "R\$ 1000,00",
                          style: TextStyle(color: Colors.grey, fontSize: 22),
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
                          "R\$ 1000,00",
                          style: TextStyle(color: Colors.grey, fontSize: 22),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              BalanceCardScheduleVlaue(
                title: "Total a receber",
                value: "R\$ 23,20",
                status: BalanceStatus.LATE,
                date: 'Até 22 jan',
                labelHilight: '2 atrasados',
              ),
              SizedBox(
                height: 8,
              ),
              BalanceCardScheduleVlaue(
                title: "Total a pagar",
                value: "R\$ 2133,20",
                status: BalanceStatus.IN_DEADLINE,
                date: 'Até 22 jan',
                labelHilight: '1 no prazo',
              )
            ],
          ),
        ));
    // ),
  }
}
