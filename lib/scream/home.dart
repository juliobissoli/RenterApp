import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/home/app-bar-custon.dart';
import '../components/home/balance-card.dart';
import '../components/home/top-bar.dart';

class HomeScream extends StatefulWidget {
  HomeScream({Key? key}) : super(key: key);

  @override
  _HomeScreamState createState() => _HomeScreamState();
}

class _HomeScreamState extends State<HomeScream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: 'Ana',
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: BalanceCard(),
              ),
              Divider(
                height: 4,
              )
            ],
          ),
        ));
  }
}
