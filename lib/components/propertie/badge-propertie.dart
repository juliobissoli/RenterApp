import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:renter_app/interfaces/status.dart';

class BadgePropertie extends StatelessWidget {
  final PropertiesStatus status;

  BadgePropertie({Key? key, required this.status}) : super();

  @override
  Color handleGetBadjeColor(PropertiesStatus? status) {
    switch (status) {
      case PropertiesStatus.RENTED:
        return Colors.green;

      case PropertiesStatus.MAINTENANCE:
        return Colors.red;

      case PropertiesStatus.DISABLED:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  String handleGetBadjeLabel(PropertiesStatus? status) {
    switch (status) {
      case PropertiesStatus.RENTED:
        return 'Alugada';

      case PropertiesStatus.MAINTENANCE:
        return 'Manutenção';

      case PropertiesStatus.DISABLED:
        return 'Desativada';
      default:
        return '--';
    }
  }

  Widget build(BuildContext context) {
    return Badge(
      toAnimate: false,
      shape: BadgeShape.square,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      badgeColor: handleGetBadjeColor(this.status),
      borderRadius: BorderRadius.circular(8),
      badgeContent:
          Text(handleGetBadjeLabel(this.status), style: TextStyle(fontSize: 8)),
    );
  }
}
