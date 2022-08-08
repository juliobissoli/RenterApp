import 'package:flutter/material.dart';
import 'package:renter_app/components/communs/image-box.dart';

class ListImagens extends StatelessWidget {
  final List<String> list;
  final double? size;
  final Axis? modeView;
  final EdgeInsets? padding;
  final Function(String)? onLongPress;
  final VoidCallback? newImageFunc;

  ListImagens(
      {Key? key,
      required this.list,
      this.size,
      this.modeView,
      this.padding,
      this.onLongPress,
      this.newImageFunc});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: padding ?? const EdgeInsets.all(16.0),
        scrollDirection: this.modeView ?? Axis.horizontal,
        children: [
          ...list
              .map((el) => Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: InkWell(
                        onLongPress: () {
                          if (onLongPress != null) {
                            onLongPress!(el);
                          }
                        },
                        child: ImageBox(url_image: el, size: this.size ?? 60)),
                  ))
              .toList(),
          Card(
            child: InkWell(
              onTap: newImageFunc,
              child: Container(
                // height: (this.size ?? 60) + 34,
                width: this.size ?? 60,
                decoration: BoxDecoration(
                    // color: Theme.of(context).scaffoldBackgroundColor,

                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      size: 32,
                      color: Colors.grey,
                    ),
                    Text('Adicionar imagem'),
                  ],
                ),
              ),
            ),
          )
        ]);
  }
}
