import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renter_app/components/communs/inout_primary.dart';

class NewRentScrean extends StatefulWidget {
  @override
  _NewRentScrean createState() => _NewRentScrean();
}

class _NewRentScrean extends State<NewRentScrean> {
  String dropdownValue = 'One';
  List<bool> isSelected = [true, true, true, true];
  // List<dynamic> = [{Label: "Hora", value: RentMolde}]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child:
                      Text('Sobre o cliente:', style: TextStyle(fontSize: 22)),
                ),
                InputPrimary(
                  type_input: TextInputType.text,
                  label: 'Nome',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: InputPrimary(
                    type_input: TextInputType.number,
                    label: 'Telephone',
                    icon_sufix: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Período:', style: TextStyle(fontSize: 22)),
                ),
                ToggleButtons(
                  isSelected: isSelected,
                  borderRadius: BorderRadius.circular(10),
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        width: ((MediaQuery.of(context).size.width - 21) / 4),
                        child: Text('Hora')),
                    Container(
                        alignment: Alignment.center,
                        width: ((MediaQuery.of(context).size.width - 21) / 4),
                        child: Text('Diária')),
                    Container(
                        alignment: Alignment.center,
                        width: ((MediaQuery.of(context).size.width - 21) / 4),
                        child: Text('Semana')),
                    Container(
                        alignment: Alignment.center,
                        width: ((MediaQuery.of(context).size.width - 21) / 4),
                        child: Text('Ano')),
                  ],
                  onPressed: (int index) {
                    // setState(() {
                    //   isSelected[index] = !isSelected[index];
                    // });
                  },
                  // isSelected: isSelected,
                ),
                SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: InputPrimary(
                    type_input: TextInputType.number,
                    label: 'Telephone',
                    icon_sufix: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
