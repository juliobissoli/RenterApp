import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCustom extends PreferredSize {
  String? title;
  bool? is_visible;
  VoidCallback? func;
  double? width = 100;

  AppBarCustom(
      {this.title,
      required this.is_visible,
      required this.func,
      required widith})
      : super(
            preferredSize: Size.fromHeight(300),
            child: Container(
              decoration: new BoxDecoration(
                  // color: Color(0x22ffffff),
                  // borderRadius: new BorderRadius.only(
                  //   bottomLeft: Radius.circular(20),
                  //   bottomRight: Radius.circular(20),
                  // ),
                  ),
              child: SafeArea(
                  child: InkWell(
                onTap: func,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Olá, ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w300),

                          // GoogleFonts.poppins(
                          //     color: Colors.white,
                          //     fontSize: 22,
                          //     fontWeight: FontWeight.w300),
                          children: <TextSpan>[
                            TextSpan(
                              text: title,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Icon(Icons.expand_more_rounded,
                              color: Colors.white)),
                    ],
                  ),
                ),
              )),
            ));
}
