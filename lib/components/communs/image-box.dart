import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageBox extends StatelessWidget {
  final double size;
  final String? image_name;
  final double? width;
  final double? height;
  final double? border_radius;
  final String? url_image;
  final bool? is_local;
  final bool exist;

  ImageBox(
      {Key? key,
      this.size = 60,
      this.width,
      this.height,
      this.image_name,
      this.border_radius = 16,
      this.url_image,
      this.is_local = true,
      this.exist = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.35,
      width:  width ?? size,
      height: height ?? size,
      decoration: BoxDecoration(
        color: Color(0xff333333),
        borderRadius: BorderRadius.circular(this.border_radius ?? 16),
        image: exist
            ? DecorationImage(
                image:
                    // this.is_local
                    // ? FileImage(File(this.image_name ?? '')) as ImageProvider
                    // :
                    NetworkImage(this.url_image ?? ''),
                fit: BoxFit.cover)
            : null,

        // border: Border.all(
        //   color: Color.fromRGBO(250, 250, 250, 1),
        //   width: border_radius ?? 2,
        // ),
      ),
      child: !exist
          ? Center(
              child: Icon(
              Icons.image,
              color: Colors.grey,
            ))
          : null,
    );
  }
}
