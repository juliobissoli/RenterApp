import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScream extends StatefulWidget {
  HomeScream({Key? key}) : super(key: key);

  @override
  _HomeScreamState createState() => _HomeScreamState();
}

class _HomeScreamState extends State<HomeScream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Principal'),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.black,
          height: 70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  print("clica Home");
                },
                icon: Icon(CupertinoIcons.square_grid_2x2),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  print("clica Home");
                },
                icon: Icon(CupertinoIcons.home),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  print("clica Home");
                },
                icon: Icon(Icons.calendar_month),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  print("clica Home");
                },
                icon: Icon(Icons.balance_rounded),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  print("clica Home");
                },
                icon: Icon(Icons.file_open_outlined),
                color: Colors.white,
              )
            ],
          ),
        ),
      )),
    );
  }
}
