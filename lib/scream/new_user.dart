import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/logo.dart';
import 'package:renter_app/components/communs/inout_primary.dart';
import 'package:renter_app/core/controller/user-controller.dart';
import 'package:renter_app/interfaces/status.dart';
import 'package:renter_app/utils/showToats.dart';

class NewUserScream extends StatefulWidget {
  const NewUserScream({Key? key}) : super(key: key);

  @override
  State<NewUserScream> createState() => _NewUserScreamState();
}

class _NewUserScreamState extends State<NewUserScream> {
  final UserController user_controller = KiwiContainer().resolve();

  TextEditingController nameControllert = TextEditingController();
  TextEditingController emailControllert = TextEditingController();
  TextEditingController passwordControllert = TextEditingController();
  TextEditingController confirmPasswordControllert = TextEditingController();

  AppStatus currentStatus = AppStatus.ENPYT;

  bool isValidForm = false;

  initState() {
    this.isValidForm = false;
  }

  _handleValidade(String s) {
    final test = this.nameControllert.text.length > 2 &&
        this.passwordControllert.text.length > 5 &&
        this.passwordControllert.text == this.confirmPasswordControllert.text &&
        this.emailControllert.text.length > 2 &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(this.emailControllert.text);

    if ((test && !isValidForm) || (!test && isValidForm)) {
      setState(() {
        this.isValidForm = !this.isValidForm;
      });
    }
  }

  Future<void> _handleCreateUser(context) async {
    print('Create user');
    this.currentStatus = AppStatus.LOADING;
    setState(() {});

    try {
      bool res = await this.user_controller.createUser(
          this.nameControllert.text,
          this.emailControllert.text,
          this.passwordControllert.text);
      if (res) {
        this.currentStatus = AppStatus.SUCCESS;
        setState(() {});
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        this.currentStatus = AppStatus.ERROR;
        showToats('Usuário já existe', false);
        setState(() {});
        // Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      this.currentStatus = AppStatus.ERROR;
      showToats('Usuário já existe', false);

      setState(() {});
    }
  }

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
                      controller_input: nameControllert,
                      changed_call: _handleValidade,
                    ),
                    SizedBox(height: 8),
                    InputPrimary(
                      type_input: TextInputType.emailAddress,
                      label: 'email',
                      controller_input: emailControllert,
                      changed_call: _handleValidade,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Text('Segurança', style: TextStyle(fontSize: 22)),
                    Divider(),
                    InputPrimary(
                      type_input: TextInputType.text,
                      label: 'Senha',
                      type: "password",
                      controller_input: passwordControllert,
                      changed_call: _handleValidade,
                    ),
                    SizedBox(height: 8),
                    InputPrimary(
                      type_input: TextInputType.text,
                      label: 'Confirmar senha',
                      type: "password",
                      controller_input: confirmPasswordControllert,
                      changed_call: _handleValidade,
                    ),
                    SizedBox(height: 32),
                    Btn(
                      label: 'Cadastrar e entrar',
                      isLoading: currentStatus == AppStatus.LOADING,
                      func: isValidForm
                          ? () {
                              _handleCreateUser(context);
                            }
                          : null,
                    )
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
