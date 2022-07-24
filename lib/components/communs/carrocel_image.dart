import 'dart:io';

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:stone_box_app/theme/styles.dart';

class CarouselImages extends StatefulWidget {
  List<String> list;
  CarouselImages({required this.list});

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  final PageController page_controller = PageController(initialPage: 0, keepPage: false);
  var page_selecte = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page_controller.addListener(() {
      page_selecte = page_controller.page?.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
            controller: page_controller,
            children: widget.list
                .map((image) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:  NetworkImage(image),
                              fit: BoxFit.cover),
                          // borderRadius: BorderRadius.only(
                          //   topLeft: const Radius.circular(20.0),
                          //   topRight: const Radius.circular(20.0),
                          // )
                          
                          ),
                    ))
                .toList()),
        Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 10,
              width: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.list.length,
                  itemBuilder: (context, i) =>
                      CircleIndicate(is_selected: page_selecte == i)),
            ))
      ],
    );
  }
}

class CircleIndicate extends StatelessWidget {
  final bool is_selected;
  CircleIndicate({this.is_selected = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: is_selected ? 25 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: Colors.black26, borderRadius: BorderRadius.circular(10),
        // shape: BoxShape.circle
      ),
    );
  }
}