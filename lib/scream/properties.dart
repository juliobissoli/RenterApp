import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:renter_app/components/communs/circular_indicator_default.dart';
import 'package:renter_app/components/home/app-bar-custon.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/interfaces/status.dart';

import '../components/properties/properties-card.dart';

class PropertiesScream extends StatefulWidget {
  @override
  _PropertiesScreamState createState() => _PropertiesScreamState();
}

class _PropertiesScreamState extends State<PropertiesScream> {
  final PropertieController propertie_controller = KiwiContainer().resolve();

  AppStatus currentStatus = AppStatus.ENPYT;

  @override
  void initState() {
    // TODO: implement initState

    _handleLoadProperties();
    super.initState();
    propertie_controller.addListener(() {
      setState(() {
        if (this.propertie_controller.fetchingState == AppStatus.SUCCESS) {
          _handleLoadProperties();
        }
      });
      print('Atualiza');
    });
  }

  Future<void> _handleLoadProperties() async {
    try {
      this.currentStatus = AppStatus.LOADING;
      await propertie_controller.loadProrpeties();
      print('Tem q para');
      this.currentStatus = AppStatus.SUCCESS;
      setState(() {});
    } catch (e) {
      this.currentStatus = AppStatus.ERROR;
      print('Ta errpr $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: 'Julio',
          is_visible: true,
          func: () {
            print('Q função e essa');
            Navigator.pushNamed(context, '/setting');
          },
          widith: MediaQuery.of(context).size.width,
        ),
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onPressed: () {
            Navigator.pushNamed(context, '/new_properti');
          },
          // icon: ,
          child: Icon(
            Icons.add,
            color: Theme.of(context).primaryColor,
          ),
        ),
        body: this.currentStatus == AppStatus.LOADING
            ? Center(child: CircularIndicatorDefault())
            //  ];
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Imóveis',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                        padding: const EdgeInsets.all(8),
                        children: propertie_controller.prorpertieList
                            .map((e) => PrortiesCard(
                                  propertie: e,
                                  small: true,
                                  onClock: () => {
                                    this.propertie_controller.propertirDtatil =
                                        e,
                                    Navigator.pushNamed(
                                        context, '/propertie_detail',
                                        arguments: {"propertie_id": e.id})
                                  },
                                ))
                            .toList()
                        //  [PrortiesCard(), PrortiesCard()],
                        ),
                  ),
                ],
              ));
  }
}
