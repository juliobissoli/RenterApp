import 'package:flutter/material.dart';

import '../communs/card-secondary.dart';

class CalendarCard extends StatelessWidget {
  CalendarCard({Key? key}) : super();

  @override
  Widget build(BuildContext context) {
    return CardSecondary(
      child: Row(
        children: [
          SizedBox(width: 40, child: Icon(Icons.insert_drive_file_rounded)),
          // Expanded( child:
          Column(
            children: [
              Text(
                'Text de cima',
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Text de baixo',
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          // )
        ],
      ),
    );
  }
}
