// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;
  final String mode;
  final String bg;
  final String fg;
  Logo(
      {Key? key,
      required this.size,
      this.mode = 'large',
      this.bg = 'bgTransparent',
      this.fg = 'fgBlak'})
      : assert(mode == 'large' || mode == 'short'),
        assert(bg == 'bgTransparent' ||
            bg == 'bgWight' ||
            bg == 'bgBlak' ||
            bg == 'bgPurple'),
        assert(fg == 'fgWight' || fg == 'fgBlak' || bg == 'fgPurple');

// 'logo_large_bgBlak_fgWight.png'
// 'logo_large_bgTransparent_fgBlak.png'
// 'logo_large_bgTransparent_fgWight.png'
// 'logo_large_bgWight_fgBlak.png'
// 'logo_short_bgBlak_fgWight.png'
// 'logo_short_bgPurple_fgTransparent.png'
// 'logo_short_bgPurple_fgWight.png'
// 'logo_short_bgTransparent_fgBlak.png'
// 'logo_short_bgTransparent_fgWight.png'
// 'logo_short_bgWight_fgBlak.png'
// 'logo_short_bgWight_fgPurple.png'

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: mode == 'large' ? (size / 2.4) : size,
      decoration: BoxDecoration(
        // color: Color(0xff1D1D1B),
        // borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage('assets/images/logo_${mode}_${bg}_${fg}.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}
