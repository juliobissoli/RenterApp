import 'package:flutter/material.dart';
import 'package:renter_app/scream/home.dart';
import 'package:renter_app/scream/login.dart';
import 'package:renter_app/scream/splash.dart';

Map<String, WidgetBuilder> appRoutes() => <String, WidgetBuilder>{
      '/': (context) => SplashScream(),
      '/login': (context) => const LoginScream(),
      '/home': (context) => HomeScream(),
    };
