import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/btn_outlined.dart';
import 'package:renter_app/components/communs/logo.dart';
import 'package:renter_app/core/controller/user-controller.dart';

class SplashScream extends StatefulWidget {
  SplashScream({Key? key}) : super(key: key);
  @override
  _SplashScreamState createState() => _SplashScreamState();
}

class _SplashScreamState extends State<SplashScream> {
  final UserController user_controller = KiwiContainer().resolve();

  Future<void> _verifyAuthentication(constext) async {
    await Future.delayed(Duration(seconds: 1));
    await this.user_controller.getDataLocal();

// getDataLocal
    // return false;
    if (user_controller.is_logged) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _verifyAuthentication(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Logo(
                size: MediaQuery.of(context).size.width * 0.7,
                fg: 'fgWight',
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Logo(
                      size: MediaQuery.of(context).size.width * 0.5,
                      fg: 'fgWight',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Btn(
                        func: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/new_user');
                        },
                        label: 'Criar conta'),
                    SizedBox(height: 16),
                    BtnOutlined(
                        func: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        label: 'Já sou cadastrado')
                  ]),
            );
          }
        },
      ),
    );
  }
}
