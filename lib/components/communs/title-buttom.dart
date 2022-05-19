import 'package:flutter/material.dart';

class TitleButtom extends StatelessWidget {
  final Icon? icon;
  TitleButtom({Key? key, this.icon})
      : assert(icon == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Movimentações',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            // Text(
            //   'Esse mês',
            //   style: TextStyle(
            //       fontSize: 14,
            //       color: Colors.grey,
            //       fontWeight: FontWeight.w300),
            // )
          ],
        ),
        IconButton(
          onPressed: () {
            print('clico');
          },
          icon: Icon(
            Icons.call_made_rounded,
            size: 18,
          ),
          color: Colors.white,
        ),
      ],
    );
  }
}
