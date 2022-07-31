import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/logo.dart';
import 'package:renter_app/components/communs/inout_primary.dart';

class LoginScream extends StatelessWidget {
  const LoginScream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                Logo(
                  size: MediaQuery.of(context).size.width * 0.5,
                  fg: 'fgWight',
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.17),
                InputPrimary(
                  type_input: TextInputType.emailAddress,
                  label: 'Email',
                  // controller_input: nameControllert,
                  // changed_call: _handleValidade,
                ),
                SizedBox(height: 16),
                InputPrimary(
                  type_input: TextInputType.text,
                  label: 'Senha',
                  type: "password",

                  // controller_input: nameControllert,
                  // changed_call: _handleValidade,
                ),
                SizedBox(height: 32),
                Btn(func: null, label: 'Entrar')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// logo_large_bgTransparent_fgWight
