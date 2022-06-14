import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/home/app-bar-custon.dart';
import '../components/home/balance-card.dart';
import '../components/home/calendar-list.dart';
import '../components/home/expenses-card-home.dart';
import '../components/home/properties-list.dart';
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
      // appBar: AppBarCustom(
      //   title: 'Ana',
      // ),
      body: SafeArea(
        // child: Expanded(
        //  double.infinity,
        child: ListView(
          // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HomeTopBar(),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BalanceCard(),
            ),
            SizedBox(height: 16),
            HomePrpertiesList(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HomeCalendarList(),
            )
          ],
        ),
      ),
      // ),
    );
  }
}
