import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:renter_app/core/models/propertie-model.dart';
import 'package:renter_app/interfaces/status.dart';

import '../communs/image-box.dart';

class PrortiesCard extends StatelessWidget {
  final PropertieModel propertie;
  final bool small;
  final VoidCallback? onClock;

  PrortiesCard(
      {Key? key, required this.propertie, this.small = false, this.onClock})
      : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: InkWell(
        onTap: this.onClock,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          ]),
                      Badge(
                        toAnimate: false,
                        shape: BadgeShape.square,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        badgeColor: propertyStatusColor(this.propertie.status),
                        borderRadius: BorderRadius.circular(8),
                        badgeContent: Text(
                            propertyStatusGetLabel(this.propertie.status),
                            style: TextStyle(fontSize: 8)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ImageBox(
                      size: MediaQuery.of(context).size.width - 32,
                      border_radius: 20.0,
                      height: 200,
                      exist: this.propertie.images.length > 0,
                      url_image: this.propertie.images.length > 0
                          ? this.propertie.images[0]
                          : null),
                ],
              ),
            )),
      ),
    );
  }
}
