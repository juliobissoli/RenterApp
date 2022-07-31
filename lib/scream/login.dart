import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/logo.dart';
import 'package:renter_app/components/communs/inout_primary.dart';
import 'package:renter_app/core/controller/user-controller.dart';
import 'package:renter_app/interfaces/status.dart';

class LoginScream extends StatefulWidget {
  const LoginScream({Key? key}) : super(key: key);

  @override
  State<LoginScream> createState() => _LoginScreamState();
}

class _LoginScreamState extends State<LoginScream> {
  final UserController user_controller = KiwiContainer().resolve();

  TextEditingController emailControllert = TextEditingController();
  TextEditingController passwordControllert = TextEditingController();

  AppStatus currentStatus = AppStatus.ENPYT;

  bool isValidForm = false;

  initState() {
    this.isValidForm = false;
  }

  _handleValidade(String s) {
    final test = this.emailControllert.text.length > 2 &&
        this.passwordControllert.text.length > 5 &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(this.emailControllert.text);

    if ((test && !isValidForm) || (!test && isValidForm)) {
      setState(() {
        this.isValidForm = !this.isValidForm;
      });
    }
  }

  Future<void> _handleLogin(context) async {
    print('loga');
    this.currentStatus = AppStatus.LOADING;
    setState(() {});

    try {
      bool res = await this
          .user_controller
          .login(this.emailControllert.text, this.passwordControllert.text);
      if (res) {
        this.currentStatus = AppStatus.SUCCESS;
        setState(() {});
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        this.currentStatus = AppStatus.ERROR;
        this.showToats('Email ou senha invalidos', false);
        setState(() {});
        // Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      this.currentStatus = AppStatus.ERROR;
      this.showToats('Email ou senha invalidos', false);

      setState(() {});
    }
  }

  showToats(String text, bool success) {
    Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.SNACKBAR,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 3,
      backgroundColor: success ? Colors.green : Colors.red,
      textColor: Colors.white,
      // fontSize: 14.0
    );
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
                  controller_input: emailControllert,
                  changed_call: _handleValidade,
                ),
                SizedBox(height: 16),
                InputPrimary(
                  type_input: TextInputType.text,
                  label: 'Senha',
                  type: "password",
                  controller_input: passwordControllert,
                  changed_call: _handleValidade,
                ),
                SizedBox(height: 32),
                Btn(
                  label: 'Entrar',
                  isLoading: currentStatus == AppStatus.LOADING,
                  func: isValidForm
                      ? () {
                          _handleLogin(context);
                        }
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// logo_large_bgTransparent_fgWight
