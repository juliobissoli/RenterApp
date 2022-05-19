import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.purple,
      padding: const EdgeInsets.all(8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Olá Maria',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w100),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.visibility))
      ]),
    );
  }
}
