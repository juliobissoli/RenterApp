import 'package:flutter/material.dart';

import '../communs/title-buttom.dart';
import '../properties/properties-card.dart';

class HomePrpertiesList extends StatefulWidget {
  HomePrpertiesList({Key? key}) : super();

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
              children: [PrortiesCard(), PrortiesCard()],
            ))
      ],
    );
  }
}
