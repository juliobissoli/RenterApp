import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/components/communs/btn_outlined.dart';
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
import 'package:renter_app/components/propertie/new_image_modal.dart';
import 'package:renter_app/components/propertie/rent_card.dart';
import 'package:renter_app/components/propertie/rent_detail.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/core/controller/rent_controller.dart';
import 'package:renter_app/core/models/propertie-model.dart';
import 'package:renter_app/core/models/rent-model.dart';
import 'package:renter_app/interfaces/status.dart';

import '../interfaces/status.dart';

class PropertieDetail extends StatefulWidget {
  // final String propertie_id;

  const PropertieDetail({Key? key}) : super(key: key);

  @override
  _PropertieDetailState createState() => _PropertieDetailState();
}

class _PropertieDetailState extends State<PropertieDetail> {
  final AppStatus currentStatus = AppStatus.ENPYT;

  final PropertieController propertie_controller = KiwiContainer().resolve();
  final RentController rent_controller = KiwiContainer().resolve();

  void initState() {
    print('Init state');

    // await propertie_controller.loadPropertieDetail(propertie_id)
    super.initState();

    this
        .rent_controller
        .loadRent(this.propertie_controller.propertie_selected_id);
    this.rent_controller.addListener(() {
      print('Atualiza');
      setState(() {});
    });
  }

  @override
  void dispose() {
    this.rent_controller.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    // final String propertie_id = arguments['propertie_id'];
    // if(propertie_id.length > 0){
    // this.propertie_controller.loadPropertieDetail(propertie_id);
    // }
    _handeInpectRent(context, RentModel rent) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return new Modal(
              size_height: 320.0,
              show_top: false,
              child: RentDetail(
                rent: rent,
                propertie_id: this.propertie_controller.propertie_selected_id,
              ));
        },
      );
    }

    _handeInpectImage(context, String url_img) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return new Modal(
              size_height: MediaQuery.of(context).size.width + 48,
              show_top: false,
              child: Stack(
                children: [
                  ImageBox(
                    url_image: url_img,
                    size: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: IconButton(
                            onPressed: () {
                              print('Compartilhar');
                            },
                            icon: Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: IconButton(
                            onPressed: () {
                              print('Compartilhar');
                            },
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ));
        },
      );
    }

    _handleAddImage() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (builder) {
            return new Modal(
              size_height: 400,
              title: 'Adicionar imagem',
              // show_top: false,
              child: NewImageModal(),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
            // title: Text(propertie_controller.propertirDtatil?.label ?? ''),
            leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => {
            this.propertie_controller.propertie_selected_id = '-1',
            Navigator.pushNamed(context, '/home')
          },
        )),
        body: currentStatus == AppStatus.LOADING
            ? Center(child: CircularIndicatorDefault())
            : SingleChildScrollView(
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
                      onLongPress: (url) {
                        _handeInpectImage(context, url);
                      },
                      newImageFunc: _handleAddImage,
                      list: propertie_controller.propertirDtatil?.images ?? [],
                      size: 230,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    child: Column(children: [
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
                                  Navigator.pushNamed(context, '/new_rent');
                                },
                                icon: Icon(Icons.add))
                          ],
                        ),
                      ),
                      ...rent_controller.rentList
                          .map(
                            ((e) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, right: 8, left: 8),
                                  child: RentCard(
                                    rent: e,
                                    onTap: () {
                                      _handeInpectRent(context, e);
                                    },
                                  ),
                                )),
                          )
                          .toList(),
                      if (rent_controller.rentList.length == 0)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CardSecondary(
                            child: InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/new_rent'),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                      Icon(
                                        Icons.home,
                                        color: Colors.grey,
                                      ),
                                      Text('Cadastrado primeiro aluguel!')
                                    ])),
                              ),
                            ),
                          ),
                        )
                    ]),
                  )
                ]),
              ));
  }
}
