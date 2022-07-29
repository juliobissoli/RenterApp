import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/inout_primary.dart';
import 'package:renter_app/core/models/rent-model.dart';

class NewRentScrean extends StatefulWidget {
  @override
  _NewRentScrean createState() => _NewRentScrean();
}

class _NewRentScrean extends State<NewRentScrean> {
  String dropdownValue = 'One';
  List<bool> isSelected = [true, true, true, true];

  List<dynamic> renyMoldes = [
    {"value": RentMolde.HOUR, "label": "Por hora"},
    {"value": RentMolde.DAY, "label": "Diária"},
    {"value": RentMolde.WEEK, "label": "Semanal"},
    {"value": RentMolde.YEAR, "label": "Anual"},
  ];

  RentMolde mooldSelected = RentMolde.DAY;

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
            padding: const EdgeInsets.all(16.0),
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
                SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Período:', style: TextStyle(fontSize: 22)),
                ),
                ToggleButtons(
                  isSelected: renyMoldes
                      .map((el) => el['value'] == mooldSelected)
                      .toList(),
                  borderRadius: BorderRadius.circular(10),
                  children: renyMoldes
                      .map((el) => Container(
                          alignment: Alignment.center,
                          width: ((MediaQuery.of(context).size.width - 38) / 4),
                          child: Text(el['label'])))
                      .toList(),
                  onPressed: (int index) {
                    setState(() {
                      // isSelected[index] = !isSelected[index];
                      mooldSelected = renyMoldes[index]['value'];
                      print(mooldSelected);
                    });
                  },
                  // isSelected: isSelected,
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    if (mooldSelected == RentMolde.HOUR)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InputPrimary(
                          type_input: TextInputType.number,
                          label: 'Data',
                          icon_sufix: Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: InputPrimary(
                            type_input: TextInputType.number,
                            label: 'Início',
                            icon_sufix: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: InputPrimary(
                            type_input: TextInputType.number,
                            label: 'Fim',
                            icon_sufix: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Valor:', style: TextStyle(fontSize: 22)),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: ((MediaQuery.of(context).size.width * 0.4) - 24),
                      child: InputPrimary(
                        type_input: TextInputType.number,
                        label: 'Parcelas',
                      ),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      width: ((MediaQuery.of(context).size.width * 0.6) - 24),
                      child: InputPrimary(
                        type_input: TextInputType.number,
                        label: 'Valor',
                        icon_sufix: Icon(
                          Icons.payment,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 32),
                BtnOutline(
                  label: 'Cadastrar aluguel',
                  func: () {
                    print('Add redn');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
