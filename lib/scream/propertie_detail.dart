import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/components/communs/btn.dart';
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
import 'package:renter_app/interfaces/rent.dart';
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

  PropertiesStatus dropdownPropertyStatusValus = PropertiesStatus.AVALIABLE;
  List<PropertiesStatus> propertiesStatusAvailable = [
    PropertiesStatus.RENTED,
    PropertiesStatus.AVALIABLE,
    PropertiesStatus.MAINTENANCE,
    PropertiesStatus.DISABLED
  ];

  List<String> actionsElipsed = [
    'Adicionar imagen',
    'Editar imóvel',
    'Excluir imóvel'
  ];

  String actionSelected = 'Adicionar imagen';
  void initState() {
    print('Init state');

    // await propertie_controller.loadPropertieDetail(propertie_id)
    super.initState();

    this
        .rent_controller
        .loadRent(this.propertie_controller.propertie_selected_id);

    this.dropdownPropertyStatusValus =
        this.propertie_controller.propertirDtatil?.status ??
            PropertiesStatus.AVALIABLE;
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

    _handleSetNewStats(PropertiesStatus? newValue) {
      print('NEW => $newValue');
    }

    _handleSetAction() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (builder) {
            return new Modal(
              show_top: false,
              size_height: 220,
              // show_top: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Btn(
                        func: () {
                          print('Add image');
                          Navigator.of(context).pop();
                          _handleAddImage();
                        },
                        label: 'Adicionar Imagem',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BtnOutlined(
                          func: () {
                            print('Add image');
                            Navigator.of(context).pop();
                          },
                          label: 'Editar dados do imóvel'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BtnOutlined(
                          func: () {
                            print('Add Excluir');
                            Navigator.of(context).pop();
                          },
                          mode: 'danger',
                          label: 'Excluir imovóvel'),
                    )
                  ],
                ),
              ),
            );
          });
    }

    String? getImage() {
      if (this.propertie_controller.propertirDtatil != null) {
        List<String> list =
            this.propertie_controller.propertirDtatil?.images ?? [];
        return list.length > 0 ? list[0] : null;
      }
      return null;
    }

    return Scaffold(
        body: currentStatus == AppStatus.LOADING
            ? Center(child: CircularIndicatorDefault())
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    actions: [
                      IconButton(
                          onPressed: () => _handleSetAction(),
                          icon: Icon(Icons.more_vert))
                    ],

                    // pinned: true,
                    // snap: _snap,
                    // floating: _floating,
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        propertie_controller.propertirDtatil?.label ?? '',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w200),
                      ),
                      background: ImageBox(
                        width: double.infinity,
                        height: 200.0,
                        border_radius: 0,
                        exist: getImage() != null,
                        url_image: getImage(),
                      ),
                    ),
                  ),

                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: <Widget>[
                        // const Text('Header'),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleSubtitle(
                                  title: this
                                          .propertie_controller
                                          .propertirDtatil
                                          ?.address
                                          .label ??
                                      '-',
                                  titleStyle: TextStyle(fontSize: 18),
                                  subtitle: 'Localizado em:'),
                              DropdownButton<PropertiesStatus>(
                                value: dropdownPropertyStatusValus,
                                icon: Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
                                borderRadius: BorderRadius.circular(10),
                                underline: SizedBox(),
                                onChanged: (PropertiesStatus? newValue) {
                                  _handleSetNewStats(newValue);
                                },
                                items: propertiesStatusAvailable
                                    .map<DropdownMenuItem<PropertiesStatus>>(
                                        (PropertiesStatus value) {
                                  return DropdownMenuItem<PropertiesStatus>(
                                    value: value,
                                    child: Column(
                                      children: [
                                        Text(
                                            value == dropdownPropertyStatusValus
                                                ? 'Status atual:'
                                                : 'Mudar para:',
                                            style: TextStyle(fontSize: 12)),
                                        SizedBox(height: 4),
                                        Badge(
                                          toAnimate: false,
                                          shape: BadgeShape.square,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 2),
                                          badgeColor:
                                              propertyStatusColor(value),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          badgeContent: Text(
                                              propertyStatusGetLabel(value),
                                              style: TextStyle(fontSize: 8)),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        // Divider(),
                        Card(
                          child: Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Alugueis',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/new_rent');
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
                                    onTap: () => Navigator.pushNamed(
                                        context, '/new_rent'),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                            // Icon(
                                            //   Icons.home,
                                            //   color: Colors.grey,
                                            // ),
                                            Text('Cadastrado primeiro aluguel!')
                                          ])),
                                    ),
                                  ),
                                ),
                              )
                          ]),
                        ),
                        // const Text('Footer'),
                      ],
                    ),
                  ),

                  // const SliverToBoxAdapter(
                  //   child: Expanded(
                  //     child: Center(
                  //       child:
                  //           Text('Scroll to see the SliverAppBar in effect.'),
                  //     ),
                  //   ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             propertie_controller.propertirDtatil?.label ?? '',
                  //             style: TextStyle(
                  //                 fontSize: 24, fontWeight: FontWeight.w200),
                  //           ),
                  //           Text(
                  //             propertie_controller
                  //                     .propertirDtatil?.address.label ??
                  //                 '',
                  //             style: TextStyle(color: Colors.grey),
                  //           ),
                  //         ],
                  //       ),
                  //       BadgePropertie(
                  //           status: this
                  //                   .propertie_controller
                  //                   .propertirDtatil
                  //                   ?.status ??
                  //               PropertiesStatus.RENTED)
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   height: MediaQuery.of(context).size.width - 130,
                  //   child: ListImagens(
                  //     onLongPress: (url) {
                  //       _handeInpectImage(context, url);
                  //     },
                  //     newImageFunc: _handleAddImage,
                  //     list: propertie_controller.propertirDtatil?.images ?? [],
                  //     size: 230,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // Card(
                  //   child: Column(children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Alugueis',
                  //             style: TextStyle(fontSize: 22),
                  //           ),
                  //           IconButton(
                  //               onPressed: () {
                  //                 Navigator.pushNamed(context, '/new_rent');
                  //               },
                  //               icon: Icon(Icons.add))
                  //         ],
                  //       ),
                  //     ),
                  //     ...rent_controller.rentList
                  //         .map(
                  //           ((e) => Padding(
                  //                 padding: const EdgeInsets.only(
                  //                     bottom: 8, right: 8, left: 8),
                  //                 child: RentCard(
                  //                   rent: e,
                  //                   onTap: () {
                  //                     _handeInpectRent(context, e);
                  //                   },
                  //                 ),
                  //               )),
                  //         )
                  //         .toList(),
                  //     if (rent_controller.rentList.length == 0)
                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: CardSecondary(
                  //           child: InkWell(
                  //             onTap: () =>
                  //                 Navigator.pushNamed(context, '/new_rent'),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(16.0),
                  //               child: Center(
                  //                   child: Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.center,
                  //                       children: [
                  //                     Icon(
                  //                       Icons.home,
                  //                       color: Colors.grey,
                  //                     ),
                  //                     Text('Cadastrado primeiro aluguel!')
                  //                   ])),
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //   ]),
                  // )
                ],
              ));
  }
}
