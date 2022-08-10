import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/inout_primary.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/core/models/propertie-model.dart';
import 'package:renter_app/interfaces/status.dart';

import '../interfaces/status.dart';
import '../interfaces/status.dart';
import '../interfaces/status.dart';
import '../interfaces/status.dart';

class NewPropertirScream extends StatefulWidget {
  @override
  _NewPropertirScreamState createState() => _NewPropertirScreamState();
}

class _NewPropertirScreamState extends State<NewPropertirScream> {
  final PropertieController propertie_controller = KiwiContainer().resolve();

  AppStatus current_status = AppStatus.ENPYT;

  bool isValidForm = false;

  TextEditingController labelControllert = TextEditingController();
  TextEditingController publicPlaceControllert = TextEditingController();
  TextEditingController cepControllert = TextEditingController();
  TextEditingController cityControllert = TextEditingController();
  TextEditingController labelAddressControllert = TextEditingController();

  bool edite_mode = false;

  initState() {
    isValidForm = false;

    super.initState();

    if (this.propertie_controller.propertToUpdate != null) {
      this.edite_mode = this.propertie_controller.propertToUpdate != null;

      final p = this.propertie_controller.propertToUpdate;
      this.labelControllert.text = p?.label ?? '';
      this.publicPlaceControllert.text = p?.address.public_place ?? '';
      this.cepControllert.text = p?.address.cep ?? '';
      this.cityControllert.text = p?.address.city ?? '';
      this.labelAddressControllert.text = p?.address.label ?? '';
    }
    // this.propertie_controller.addListener(() {
    //   super.setState(() {});
    // });
  }

  _handleValidade(String s) {
    final test = labelControllert.text.length > 0 &&
        publicPlaceControllert.text.length > 0 &&
        cepControllert.text.length > 0 &&
        cityControllert.text.length > 0 &&
        labelAddressControllert.text.length > 0;

    print('==> ${test}');
    if ((test && !isValidForm) || (!test && isValidForm)) {
      setState(() {
        this.isValidForm = !this.isValidForm;
      });
    }
  }

  _handleSendData() async {
    print('Mode ---> $edite_mode');
    dynamic data = {
      "id": this.propertie_controller.propertToUpdate?.id ?? "1234",
      "label": this.labelControllert.text,
      "status": propertiStatusDecode(
          this.propertie_controller.propertToUpdate?.status ??
              PropertiesStatus.AVALIABLE),
      "last_rents": [],
      "address": {
        "label": this.labelAddressControllert.text,
        "cep": this.cepControllert.text,
        "city": this.cityControllert.text,
        "public_place": this.publicPlaceControllert.text
      },
      "images": [],
    };

    this.current_status = AppStatus.LOADING;
    this.setState(() {});
    try {
      if (this.edite_mode) {
        await this
            .propertie_controller
            .updateProperty(PropertieModel.fromMap(data));
        this.propertie_controller.propertToUpdate = null;
      } else {
        await this.propertie_controller.createPropertie(data);
      }

      await Future.delayed(Duration(seconds: 1));
      final str_success =
          this.edite_mode ? 'Imóvel altrado :)' : 'Imóvel cadastrado :)';
      this.showToats(str_success, true);

      this.current_status = AppStatus.SUCCESS;
      this.setState(() {});

      Navigator.of(context).pop();
    } catch (e) {
      this.current_status = AppStatus.ERROR;

      this.setState(() {});

      print(e);
      final str_error = this.edite_mode
          ? 'Erro ao altrado o imóvel'
          : ' Erro ao cadastrar imóvel';
      this.showToats(str_error, false);
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
        title: Text(this.edite_mode ? 'Editar imóvel' : 'Cadastrar imóvel'),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Endereço',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                InputPrimary(
                  type_input: TextInputType.text,
                  label: 'Nome',
                  controller_input: labelAddressControllert,
                  changed_call: _handleValidade,
                  // controller_input: nameControllert,
                  // changed_call: _handleValidade,
                ),
                Text(
                  'Escreva a forma como deseja chamar o local onde está o imóvel. Ex.: Codomínio 1, Sítio, etc',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InputPrimary(
                          type_input: TextInputType.number,
                          label: 'CEP',
                          controller_input: cepControllert,
                          changed_call: _handleValidade,
                          inputFormatters: [
                            MaskTextInputFormatter(
                                mask: '#####-###',
                                filter: {"#": RegExp(r'[0-9]')})
                          ],
                          // controller_input: nameControllert,
                          // changed_call: _handleValidade,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: InputPrimary(
                          type_input: TextInputType.text,
                          label: 'Cidade-UF',
                          controller_input: cityControllert,
                          changed_call: _handleValidade,
                        ),
                      )
                    ],
                  ),
                ),
                InputPrimary(
                  type_input: TextInputType.text,
                  label: 'Logradouro',
                  controller_input: publicPlaceControllert,
                  changed_call: _handleValidade,
                ),
                Divider(),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Apelido do imóvel',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                InputPrimary(
                  type_input: TextInputType.text,
                  label: 'Complemento',
                  controller_input: labelControllert,
                  changed_call: _handleValidade,
                ),
                Text(
                  'Escreva a forma como deseja chamar esse imovel. Ex.: Casa da prai, Apt. 1, Sala 123',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Btn(
            isLoading: this.current_status == AppStatus.LOADING,
            label: 'Cadastrar imóvels',
            func: isValidForm ? _handleSendData : null,
          ),
        ),
      ),
    );
  }
}
