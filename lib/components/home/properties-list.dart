import 'package:flutter/material.dart';
import 'package:renter_app/core/models/propertie-model.dart';

import '../communs/title-buttom.dart';
import '../properties/properties-card.dart';

class HomePrpertiesList extends StatefulWidget {
  final List<PropertieModel> propertieLis;
  HomePrpertiesList({Key? key, required this.propertieLis}) : super();

  @override
  _HomePrpertiesListState createState() => _HomePrpertiesListState();
}

class _HomePrpertiesListState extends State<HomePrpertiesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TitleButtom(
            title: 'Imoveis',
            onClock: () {
              Navigator.pushNamed(context, '/properties');
              print("ir para tela de lista de imoveis");
            },
          ),
        ),
        Container(
            height: 100,
            width: 500,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              scrollDirection: Axis.horizontal,
              children: widget.propertieLis
                  .map((e) => PrortiesCard(
                        propertie: e,
                        small: true,
                      ))
                  .toList(),
              //  [PrortiesCard(), PrortiesCard()],
            ))
      ],
    );
  }
}
