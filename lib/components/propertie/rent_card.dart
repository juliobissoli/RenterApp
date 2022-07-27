import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class RentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'João Marcelo',
                  style: TextStyle(fontSize: 18),
                ),
                Badge(
                  toAnimate: false,
                  shape: BadgeShape.square,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  badgeColor: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                  badgeContent: Text('Agendado', style: TextStyle(fontSize: 8)),
                )
              ],
            ),
            Divider(),
            Row(
              children: [
                // Divider(),
                Text(
                  'De 02/Jan a 3/Jan 2022 • ',
                  style: TextStyle(color: Colors.grey),
                ),

                Text('R\$ 200,00')
              ],
            )
          ],
        ),
      ),
    );
  }
}
