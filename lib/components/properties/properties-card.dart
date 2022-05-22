import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:renter_app/interfaces/status.dart';

import '../communs/image-box.dart';

class PrortiesCard extends StatelessWidget {
  PrortiesCard({Key? key}) : super();

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
                  size: 80,
                  exist: false,
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kitnet 1",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Casa de Gurir",
                        style: TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Badge(
                        toAnimate: false,
                        shape: BadgeShape.square,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        badgeColor:
                            handleGetBadjeColor(PropertiesStatus.RENTED),
                        borderRadius: BorderRadius.circular(8),
                        badgeContent:
                            Text('Alugado', style: TextStyle(fontSize: 8)),
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
