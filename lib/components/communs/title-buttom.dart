import 'package:flutter/material.dart';

class TitleButtom extends StatelessWidget {
  final IconData? icon;
  final String title;
  final VoidCallback? onClock;
  TitleButtom(
      {Key? key,
      this.icon = Icons.call_made_rounded,
      required this.title,
      required this.onClock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: this.onClock,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.title,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                // Text(
                //   'Esse mês',
                //   style: TextStyle(
                //       fontSize: 14,
                //       color: Colors.grey,
                //       fontWeight: FontWeight.w300),
                // )
              ],
            ),
            Icon(
              this.icon,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
