import 'package:flutter/widgets.dart';

class TitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  TitleSubtitle({
    Key? key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subtitle, style: subtitleStyle ?? TextStyle(fontSize: 12)),
        Text(title, style: titleStyle ?? TextStyle(fontSize: 22))
      ],
    );
  }
}
