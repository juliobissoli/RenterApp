import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/inout_primary.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/interfaces/status.dart';
import 'package:renter_app/utils/showToats.dart';

class NewImageModal extends StatefulWidget {
  const NewImageModal({Key? key}) : super(key: key);

  @override
  _NewImageModalState createState() => _NewImageModalState();
}

class _NewImageModalState extends State<NewImageModal> {
  final PropertieController propertie_controller = KiwiContainer().resolve();

  AppStatus current_status = AppStatus.ENPYT;

  TextEditingController urlControllert = TextEditingController();
  String propert_id = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    propert_id = this.propertie_controller.propertie_selected_id;
  }

  Future<void> _handleAddImage(String propertie_id, String url, context) async {
    try {
      setState(() {
        this.current_status = AppStatus.LOADING;
      });
      await this.propertie_controller.addImage(propertie_id, url);
      setState(() {
        this.current_status = AppStatus.SUCCESS;
      });
      showToats('Imagem adicionada', true);
      await Future.delayed(Duration(milliseconds: 500));
      Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        this.current_status = AppStatus.SUCCESS;
      });
      showToats('Erro ao adicionar imagem', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        TextField(
          controller: urlControllert,
          keyboardType: TextInputType.text,
          maxLines: 3,
          decoration: InputDecoration(
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            focusColor: Theme.of(context).scaffoldBackgroundColor,
            labelText: 'copie o link aqui',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              gapPadding: 5,
              borderSide: new BorderSide(
                  color: Theme.of(context).backgroundColor, width: 1),
            ),
          ),
        ),
        SizedBox(height: 16),
        Btn(
            isLoading:
                this.propertie_controller.fetchingState == AppStatus.LOADING,
            func: () => {
                  _handleAddImage(
                      this.propert_id, this.urlControllert.text, context)
                },
            label: 'Adicionar imagen')
      ]),
    );
  }
}
