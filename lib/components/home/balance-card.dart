import 'package:flutter/material.dart';
import 'package:renter_app/components/communs/title-buttom.dart';

class BalanceCard extends StatelessWidget {
  BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print("Aciona o router");
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TitleButtom(),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        '-2000',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.normal,
                            color: Colors.green),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 24),
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
                              style:
                                  TextStyle(color: Colors.green, fontSize: 14),
                            ),
                            Text(
                              "R\$ 1000",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 24),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // ),
          ],
        ));
  }
}
