import 'package:flutter/material.dart';
import 'package:renter_app/scream/home.dart';
import 'package:renter_app/scream/login.dart';
import 'package:renter_app/scream/new_propertie.dart';
import 'package:renter_app/scream/new_rent.dart';
import 'package:renter_app/scream/new_user.dart';
import 'package:renter_app/scream/propertie_detail.dart';
import 'package:renter_app/scream/properties.dart';
import 'package:renter_app/scream/splash.dart';

Map<String, WidgetBuilder> appRoutes() => <String, WidgetBuilder>{
      '/': (context) => SplashScream(),
      '/login': (context) => const LoginScream(),
      '/new_user': (context) => const NewUserScream(),

      // '/home': (context) => HomeScream(),
      '/home': (context) => PropertiesScream(),
      '/propertie_detail': (context) => PropertieDetail(),
      '/new_rent': (context) => NewRentScrean(),
      '/new_properti': (context) => NewPropertirScream(),
    };
