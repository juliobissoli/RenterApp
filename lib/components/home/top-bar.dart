import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Julio B.',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      print("não ver dados");
                    },
                    icon: Icon(Icons.remove_red_eye_outlined)),
                IconButton(
                    onPressed: () {
                      print('Setings');
                    },
                    icon: Icon(Icons.settings_outlined)),
              ],
            )
          ]),
    );
    // Row(
    //   // color: Colors.purple,
    //   padding: const EdgeInsets.all(8),
    //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //     Text(
    //       'Olá Maria',
    //       style: TextStyle(fontSize: 28, fontWeight: FontWeight.w100),
    //     ),
    //     IconButton(onPressed: () {}, icon: Icon(Icons.visibility))
    //   ]),
    // );
  }
}
