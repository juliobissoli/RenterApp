import 'package:flutter/widgets.dart';

class TitleSubtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('renda', style: TextStyle(fontSize: 12)),
        Text('2000', style: TextStyle(fontSize: 22))
      ],
    );
  }
}
