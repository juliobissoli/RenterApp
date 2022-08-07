import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:renter_app/components/communs/circular_indicator_default.dart';
import 'package:renter_app/components/home/app-bar-custon.dart';
import 'package:renter_app/components/propertie/title-scream.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/core/controller/user-controller.dart';
import 'package:renter_app/interfaces/status.dart';

import '../components/propertie/properties-card.dart';

class PropertiesScream extends StatefulWidget {
  @override
  _PropertiesScreamState createState() => _PropertiesScreamState();
}

class _PropertiesScreamState extends State<PropertiesScream> {
  final PropertieController propertie_controller = KiwiContainer().resolve();
  final UserController user_controller = KiwiContainer().resolve();

  String key_filter_properties = ''; // String nameUser = '';
  AppStatus currentStatus = AppStatus.ENPYT;

  @override
  void initState() {
    // TODO: implement initState
    //  this.nameUser = user_controller.getNameWelcome();

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

  _handleFilter(String str) {
    setState(() {
      this.key_filter_properties = str;
    print('str => $str');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBarCustom(
        //   title: user_controller.getNameWelcome(),
        //   is_visible: true,
        //   func: () {
        //     Navigator.pushNamed(context, '/setting');
        //   },
        //   widith: MediaQuery.of(context).size.width,
        // ),
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
                  SizedBox(height: 32),
                  TitlePropertieScream(
                    tap_setting: () => Navigator.pushNamed(context, '/setting'),
                    changed_call: _handleFilter,
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                        padding: const EdgeInsets.all(8),
                        children: 
                        (
                          this.key_filter_properties != ''
                          ? propertie_controller.prorpertieList.where((el) => el.label.contains(this.key_filter_properties))
                          : propertie_controller.prorpertieList)
                        .map((e) => PrortiesCard(
                                  propertie: e,
                                  small: true,
                                  onClock: () => {
                                    this
                                        .propertie_controller
                                        .propertie_selected_id = e.id,
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
