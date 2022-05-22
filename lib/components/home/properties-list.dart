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
        TitleButtom(
          title: 'Imoveis',
          onClock: () {
            print("ir para tela de lista de imoveis");
          },
        ),
        Container(
            height: 100,
            width: 500,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [PrortiesCard(), PrortiesCard()],
            ))
      ],
    );
  }
}
