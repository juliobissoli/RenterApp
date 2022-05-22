import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../calendar/card-calendar.dart';
import '../communs/card-secondary.dart';
import '../communs/title-buttom.dart';

class HomeCalendarList extends StatefulWidget {
  HomeCalendarList({Key? key}) : super();

  @override
  _HomeCalendarListState createState() => _HomeCalendarListState();
}

class _HomeCalendarListState extends State<HomeCalendarList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleButtom(
          title: 'Agenda',
          onClock: () {
            print('vai para agenda');
          },
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hoje:',
                ),
                SizedBox(height: 8),
                CalendarCard(),
                SizedBox(height: 8),
                CalendarCard(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
