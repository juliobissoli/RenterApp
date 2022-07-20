import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:renter_app/core/controller/properties-controller.dart';

import '../components/properties/properties-card.dart';

class PropertiesScream extends StatefulWidget {
  @override
  _PropertiesScreamState createState() => _PropertiesScreamState();
}

class _PropertiesScreamState extends State<PropertiesScream> {
  @override
  Widget build(BuildContext context) {
    PropertieController propertir_controller =
        Provider.of<PropertieController>(context);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Imoveis",
            style: TextStyle(fontSize: 22),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  print("add imovel");
                },
                icon: Icon(Icons.add))
          ]),
      body: ListView(
          padding: const EdgeInsets.all(8),
          children: propertir_controller.prorpertieList
              .map((e) => PrortiesCard(propertie: e))
              .toList()
          //  [PrortiesCard(), PrortiesCard()],
          ),
    );
  }
}
