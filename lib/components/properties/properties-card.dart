import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:renter_app/core/models/propertie-model.dart';
import 'package:renter_app/interfaces/status.dart';

import '../communs/image-box.dart';

class PrortiesCard extends StatelessWidget {
  final PropertieModel propertie;
  final bool small;

  PrortiesCard({Key? key, required this.propertie, this.small = false})
      : super();

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
    return SizedBox(
      width: 260,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ImageBox(
                    size: this.small ? 80 : 100,
                    border_size: 1,
                    url_image: this.propertie.images.length > 0
                        ? this.propertie.images[0]
                        : null),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        this.propertie.label,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        this.propertie.address.label,
                        style: TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Badge(
                        toAnimate: false,
                        shape: BadgeShape.square,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        badgeColor: handleGetBadjeColor(this.propertie.status),
                        borderRadius: BorderRadius.circular(8),
                        badgeContent: Text(
                            handleGetBadjeLabel(this.propertie.status),
                            style: TextStyle(fontSize: 8)),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
