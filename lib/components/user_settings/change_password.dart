import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/inout_primary.dart';
import 'package:renter_app/core/controller/user-controller.dart';
import 'package:renter_app/utils/showToats.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  UserController userController = UserController();
  var new_passord = '';
  var confirm_passowrd = '';

  var controller_new_pass = new TextEditingController();
  var controller_conf_pass = new TextEditingController();
  String menssage_error = "";
  bool is_valid = false;
  bool is_loading = false;

  // StoneBoxApi get api => StoneBoxApi.singleton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Alterar senha:",
          ),
          SizedBox(height: 16),
          InputPrimary(
              controller_input: controller_new_pass,
              changed_call: (value) {
                _validatePass(value);
              },
              type: 'password',
              label: "Nova senha",
              type_input: TextInputType.visiblePassword),
          SizedBox(height: 16),
          InputPrimary(
              controller_input: controller_conf_pass,
              changed_call: (value) {
                _validatePass(value);
              },
              type: 'password',
              label: "Confirme a senha",
              capitalization: TextCapitalization.none,
              type_input: TextInputType.visiblePassword),
          SizedBox(height: 8),
          Text(
            menssage_error,
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(height: 16),
          Btn(
            isLoading: is_loading,
            func: is_valid
                ? () {
                    _handeChangePass();
                  }
                : null,
            label: "Alterar",
            mode: "dark",
          )
        ],
      )),
    );
  }

  _isIqual() {
    return controller_conf_pass.text == controller_new_pass.text;
  }

  _isLengthOk() {
    return controller_new_pass.text.length > 5;
  }

  _validatePass(String value) async {
    var chek = false;
    var menssage = "";
    if (!_isLengthOk()) {
      menssage = "Pelo menos 6 caracteres";
    } else if (!_isIqual()) {
      menssage = "Senhas não conferem!";
    } else
      chek = true;
    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      this.is_valid = chek;
      this.menssage_error = menssage;
    });
  }

  _handeChangePass() async {
    print("Atualizar senha");
    setState(() {
      this.is_loading = true;
    });

    try {
      await this.userController.changePassword(controller_new_pass.text);
      // await api.api_put("user/change_pass/$id", data);
      showToats("Senha alterada com sucesso!", true);
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
      showToats("Algo deu errado!", false);
    }
    setState(() {
      this.is_loading = false;
    });
  }
}
