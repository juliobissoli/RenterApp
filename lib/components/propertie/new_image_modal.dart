import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/inout_primary.dart';
import 'package:renter_app/core/controller/properties-controller.dart';

class NewImageModal extends StatefulWidget {
  const NewImageModal({ Key? key }) : super(key: key);

  @override
  _NewImageModalState createState() => _NewImageModalState();
}

class _NewImageModalState extends State<NewImageModal> {
  final PropertieController propertie_controller = KiwiContainer().resolve();


  TextEditingController urlControllert = TextEditingController();
  String propert_id = ''; 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    propert_id = this.propertie_controller?.propertirDtatil?.id ?? '--'; 

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
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
                      Btn(func: () => {
                        this.propertie_controller.addImage(this.propert_id, urlControllert.text)}, label: 'Adicionar imagen')
        ]
      ),
    );
  }
}