import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:renter_app/core/models/rent-model.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:renter_app/interfaces/rent.dart';
import 'package:renter_app/interfaces/status.dart';

class RentCard extends StatelessWidget {
  final RentModel rent;
  final VoidCallback? onTap;

  RentCard({Key? key, required this.rent, this.onTap});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    // var dateFormate = DateFormat('yyyy-MM-dd – kk:mm').format(rent.date_end);

    // .yMd('pt_BR').format(rent.date_end);

    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    rent.client.name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    badgeColor: rentGetColor(rent.status),
                    borderRadius: BorderRadius.circular(8),
                    badgeContent: Text(rentGetLabel(rent.status),
                        style: TextStyle(fontSize: 8)),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Divider(),
                  Text(
                    _mauntTimeLabel(),
                    // 'De 02/Jan a 3/Jan 2022 • ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    (rent.installments > 1 ? '(${rent.installments}x) ' : '') +
                        'R\$ ${rent.value_installments}',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String _mauntTimeLabel() {
    switch (this.rent.mode) {
      case RentMolde.HOUR:
        return '${DateFormat('dd MMM yyyy').format(rent.date_init)} • ${DateFormat('kk:mm').format(rent.date_init)} as ${DateFormat('kk:mm').format(rent.date_end)}';
      default:
        return 'de ${DateFormat('dd MMM').format(rent.date_init)} a ${DateFormat('dd MMM yyyy').format(rent.date_end)}';
    }
  }
}
