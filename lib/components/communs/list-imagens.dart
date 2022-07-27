import 'package:flutter/material.dart';
import 'package:renter_app/components/communs/image-box.dart';

class ListImagens extends StatelessWidget {
  final List<String> list;
  final double? size;
  final Axis? modeView;
  final EdgeInsets? padding;
  ListImagens(
      {Key? key, required this.list, this.size, this.modeView, this.padding});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding ?? const EdgeInsets.all(16.0),
      scrollDirection: this.modeView ?? Axis.horizontal,
      children: list
          .map((el) => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ImageBox(url_image: el, size: this.size ?? 60),
              ))
          .toList(),
    );
  }
}
