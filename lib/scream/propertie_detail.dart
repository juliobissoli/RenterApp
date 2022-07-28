import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/components/communs/car-buttom.dart';
import 'package:renter_app/components/communs/card-secondary.dart';
import 'package:renter_app/components/communs/carrocel_image.dart';
import 'package:renter_app/components/communs/circular_indicator_default.dart';
import 'package:renter_app/components/communs/image-box.dart';
import 'package:renter_app/components/communs/list-imagens.dart';
import 'package:renter_app/components/communs/modal.dart';
import 'package:renter_app/components/communs/title-buttom.dart';
import 'package:renter_app/components/communs/title-subtitle.dart';
import 'package:renter_app/components/home/card_balance_propertie.dart';
import 'package:renter_app/components/propertie/badge-propertie.dart';
import 'package:renter_app/components/propertie/rent_card.dart';
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
            // title: Text(propertie_controller.propertirDtatil?.label ?? ''),
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
              return SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              propertie_controller.propertirDtatil?.label ?? '',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w200),
                            ),
                            Text(
                              propertie_controller
                                      .propertirDtatil?.address.label ??
                                  '',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        BadgePropertie(
                            status: this
                                    .propertie_controller
                                    .propertirDtatil
                                    ?.status ??
                                PropertiesStatus.RENTED)
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width - 130,
                    child: ListImagens(
                      list: propertie_controller.propertirDtatil?.images ?? [],
                      size: 230,
                    ),
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   height: 300,
                  //   child: CarouselImages(
                  //       list:
                  //           propertie_controller.propertirDtatil?.images ?? []),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TitleSubtitle()),
                                ),
                                VerticalDivider(
                                  color: Colors.red,
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TitleSubtitle(),
                                ))
                              ],
                            ),
                            Divider(),
                            Text(
                              'Saldo desse mês (R\$ 0,00)',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Alugueis',
                          style: TextStyle(fontSize: 22),
                        ),
                        IconButton(
                            onPressed: () {
                              print('Add aluguel');
                              _handeInpectStone(context);
                            },
                            icon: Icon(Icons.add))
                      ],
                    ),
                  ),
                  Column(
                      children: propertie_controller.propertirDtatil?.last_rents
                              .map(((e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: RentCard(rent: e))))
                              .toList() ??
                          [])

                  // Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //     child: RentCard()),
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //     child: RentCard()),
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //     child: RentCard())
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

  _handeInpectStone(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return new Modal(
            size_height: 548.0,
            show_top: false,
            child: Text(
              'Teste',
              style: TextStyle(fontSize: 33),
            ));
      },
    );
  }
}
