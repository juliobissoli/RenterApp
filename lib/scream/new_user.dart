import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/logo.dart';
import 'package:renter_app/components/communs/inout_primary.dart';

class NewUserScream extends StatelessWidget {
  const NewUserScream({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Logo(
                size: MediaQuery.of(context).size.width * 0.5,
                fg: 'fgWight',
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Text('Identificação', style: TextStyle(fontSize: 22)),
                    Divider(),
                    InputPrimary(
                      type_input: TextInputType.text,
                      label: 'Nome',
                      // controller_input: nameControllert,
                      // changed_call: _handleValidade,
                    ),
                    SizedBox(height: 8),
                    InputPrimary(
                      type_input: TextInputType.emailAddress,
                      label: 'email',
                      // controller_input: nameControllert,
                      // changed_call: _handleValidade,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Text('Segurança', style: TextStyle(fontSize: 22)),
                    Divider(),
                    InputPrimary(
                      type_input: TextInputType.text,
                      label: 'Senha',
                      type: "password",

                      // controller_input: nameControllert,
                      // changed_call: _handleValidade,
                    ),
                    SizedBox(height: 8),
                    InputPrimary(
                      type_input: TextInputType.text,
                      label: 'Confirmar senha',
                      type: "password",

                      // controller_input: nameControllert,
                      // changed_call: _handleValidade,
                    ),
                    SizedBox(height: 32),
                    Btn(func: null, label: 'Cadastrar e entrar')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// logo_large_bgTransparent_fgWight
