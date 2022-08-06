import 'package:flutter/cupertino.dart';
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
          InputPrimary(
            height: 100,
            maxLin: 3,
                   type_input: TextInputType.text,
                      label: 'copie o link aqui',
                      controller_input: urlControllert,
                      ),
      SizedBox(height: 16),
                      Btn(func: () => {
                        this.propertie_controller.addImage(this.propert_id, urlControllert.text)}, label: 'Adicionar imagen')
        ]
      ),
    );
  }
}