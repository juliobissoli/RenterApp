import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  // var children = List<Widget>;
  Widget child;
  final show_top;
  final size_height;
  Modal({required this.child, this.show_top = true, this.size_height = 500});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size_height,
      color: Colors.transparent,
      child: new Container(
        decoration: new BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 0.0, // has the effect of extending the shadow
            )
          ],
        ),
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            show_top
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Text(
                          "Bottom Modal",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                          // margin: EdgeInsets.only(top: 5, right: 5),
                          child: FlatButton(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ))),
                    ],
                  )
                : Container(),
            // SizedBox(height: 5),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
