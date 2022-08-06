import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/core/state.dart';
import 'package:renter_app/scream/login.dart';
import 'package:renter_app/router.dart';
import 'package:renter_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  createDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: appRoutes(),
      themeMode: ThemeMode.dark,
      darkTheme: CustimTheme.darkTheme,
    );
  }
}
