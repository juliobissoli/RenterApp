import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Movimentações',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Esse mês',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    print('clico');
                  },
                  icon: Icon(Icons.expand_less_outlined),
                  color: Colors.white,
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '-2000',
                  style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.normal,
                      color: Colors.green),
                )),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'renda:',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "R\$ 1000",
                      style: TextStyle(color: Colors.red, fontSize: 24),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'renda:',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "R\$ 1000",
                      style: TextStyle(color: Colors.red, fontSize: 24),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
