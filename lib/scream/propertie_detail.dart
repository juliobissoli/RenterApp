import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/components/communs/car-buttom.dart';
import 'package:renter_app/components/communs/card-secondary.dart';
import 'package:renter_app/components/communs/carrocel_image.dart';
import 'package:renter_app/components/communs/circular_indicator_default.dart';
import 'package:renter_app/components/communs/title-buttom.dart';
import 'package:renter_app/components/home/card_balance_propertie.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/core/models/propertie-model.dart';
import 'package:renter_app/interfaces/status.dart';

class PropertieDetail extends StatefulWidget {
  // final String propertie_id;

  const PropertieDetail({Key? key}) : super(key: key);

  @override
  _PropertieDetailState createState() => _PropertieDetailState();
}

class _PropertieDetailState extends State<PropertieDetail> {
  final PropertieController propertie_controller = KiwiContainer().resolve();

  void initState() {
    print('Init state');

    // propertie_controller.addListener(() {
    //   print('Atualiza');
    //   setState((){});
    // });
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    final String propertie_id = arguments['propertie_id'];
    // if(propertie_id.length > 0){
    // this.propertie_controller.loadPropertieDetail(propertie_id);
    // }

    return Scaffold(
        appBar: AppBar(
            title: Text(propertie_controller.propertirDtatil?.label ?? ''),
            leading: IconButton(
              icon: Icon(CupertinoIcons.back),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: FutureBuilder(
          future: propertie_controller.loadPropertieDetail(propertie_id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //  List<Widget> children;
            if (snapshot.connectionState == ConnectionState.waiting) {
              //  children: [
              return Center(child: CircularIndicatorDefault());
              //  ];
            } else {
              //  children: [
              return SafeArea(
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: CarouselImages(
                        list:
                            propertie_controller.propertirDtatil?.images ?? []),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 400,
                    child: ListView(
                      children: [
                        Container(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            children: [
                              CardBalancePropertie(),
                              CardBalancePropertie()
                            ],
                          ),
                        ),
                      SizedBox(height: 16,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Alugueis', style: TextStyle(fontSize: 22),),
                              IconButton(onPressed: (){print('Add aluguel');}, icon: Icon(Icons.add))
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          child: Column(
                            children: [
                              Text('Peŕiodo'),
                              Text('Valor'),
                              Text('Locador'),
                              ],
                          ),
                          ),
                      )
                      ],
                    ),

                  )
                ]),
              );
              // Center(
              //     child: Text(
              //   propertie_controller.propertirDtatil?.label ?? 'NO data',
              //   style: TextStyle(color: Colors.pink),
              // ));
              //  ];
            }
          },
        ));
    // return Scaffold(

    //   body: this.propertie_controller.fetchingState == AppStatus.LOADING
    //   ? Center(
    //     child: CircularIndicatorDefault(),
    //   )
    //   : Center(child: Text(this.propertie_controller.propertirDtatil?.label ?? 'n tem'))
    //   ,
    // );
  }
}
