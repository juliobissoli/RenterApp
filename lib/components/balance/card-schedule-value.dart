import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../interfaces/status.dart';
import '../communs/card-secondary.dart';

class BalanceCardScheduleVlaue extends StatelessWidget {
  final String title;
  final String value;
  final BalanceStatus? status;
  final String? labelHilight;
  final String? date;
  BalanceCardScheduleVlaue(
      {Key? key,
      required this.title,
      required this.value,
      this.status = BalanceStatus.ENPYT,
      this.labelHilight,
      this.date})
      : super(key: key);

  @override
  Color handleGetBadjeColor(BalanceStatus? status) {
    switch (status) {
      case BalanceStatus.PAID_OUT:
        return Colors.green;

      case BalanceStatus.LATE:
        return Colors.red;

      case BalanceStatus.IN_DEADLINE:
        return Colors.grey;
      default:
        return Colors.purpleAccent;
    }
  }

  Widget build(BuildContext context) {
    return CardSecondary(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.title,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              this.status != BalanceStatus.ENPYT
                  ? Badge(
                      toAnimate: false,
                      shape: BadgeShape.square,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      badgeColor: handleGetBadjeColor(this.status),
                      borderRadius: BorderRadius.circular(8),
                      badgeContent: Text(this.labelHilight ?? '',
                          style: TextStyle(fontSize: 8)),
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'R\$ 122,00',
                style: TextStyle(fontSize: 16),
              ),
              date != null
                  ? Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          this.date ?? '',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    )
                  : Container()
            ],
          )
        ],
      ),
    );
  }
}
