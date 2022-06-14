import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustimTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFF0D0E12),
      colorScheme: ColorScheme.dark(),

      // fontFamily: GoogleFonts.poppins(),

      textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white),
      cardTheme: CardTheme(color: Color(0xFF040607)),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ));

  // static ThemeData themeData(bool isDarkTheme, BuildContext context) {
  //   return ThemeData(
  //     primarySwatch: Colors.red,
  //     primaryColor: isDarkTheme ? Colors.black : Colors.white,
  //     backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
  //     indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
  //     buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
  //     hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
  //     highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
  //     hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
  //     focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
  //     disabledColor: Colors.grey,
  //     textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
  //     cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
  //     canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
  //     brightness: isDarkTheme ? Brightness.dark : Brightness.light,
  //     buttonTheme: Theme.of(context).buttonTheme.copyWith(
  //         colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
  //     appBarTheme: AppBarTheme(
  //       elevation: 0.0,
  //     ),
  //   );
  // }
}
