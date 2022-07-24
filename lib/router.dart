import 'package:flutter/material.dart';
import 'package:renter_app/scream/home.dart';
import 'package:renter_app/scream/login.dart';
import 'package:renter_app/scream/propertie_detail.dart';
import 'package:renter_app/scream/properties.dart';
import 'package:renter_app/scream/splash.dart';

Map<String, WidgetBuilder> appRoutes() => <String, WidgetBuilder>{
      '/': (context) => SplashScream(),
      '/login': (context) => const LoginScream(),
      '/home': (context) => HomeScream(),
      '/properties': (context) => PropertiesScream(),
      '/propertie_detail': (context) => PropertieDetail(),
    };
