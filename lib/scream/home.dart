import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/core/models/propertie-model.dart';

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
  final PropertieController propertie_controller = KiwiContainer().resolve();

  // PropertieController();
  // final KiwiContainer

  // container.registerInstance(PropertieController());
  void initState() {
    super.initState();
    propertie_controller.loadProrpeties();

    propertie_controller.addListener(() {
      setState(() {});
    });
  }

  void dispose() {
    propertie_controller.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    // PropertieController propertir_controller =
    //     Provider.of<PropertieController>(context);

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
            HomePrpertiesList(
              propertieLis: propertie_controller.prorpertieList,
            ),
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
