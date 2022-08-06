import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:renter_app/components/communs/btn.dart';
import 'package:renter_app/components/communs/inout_primary.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/core/controller/rent_controller.dart';
import 'package:renter_app/core/models/rent-model.dart';
import 'package:renter_app/interfaces/status.dart';
import 'package:renter_app/utils/showToats.dart';
import 'package:intl/date_symbol_data_local.dart';

class NewRentScrean extends StatefulWidget {
  @override
  _NewRentScrean createState() => _NewRentScrean();
}

class _NewRentScrean extends State<NewRentScrean> {
  final RentController rent_controller = KiwiContainer().resolve();
  final PropertieController propertie_controller = KiwiContainer().resolve();

  AppStatus currentSatus = AppStatus.ENPYT;

  List<dynamic> renyMoldes = [
    {"value": RentMolde.HOUR, "label": "Por hora"},
    {"value": RentMolde.DAY, "label": "Diária"},
    {"value": RentMolde.WEEK, "label": "Semanal"},
    {"value": RentMolde.YEAR, "label": "Anual"},
  ];

  RentMolde mooldSelected = RentMolde.DAY;

  TextEditingController nameControllert = TextEditingController();
  TextEditingController phoneControllert = TextEditingController();
  TextEditingController valueControllert = TextEditingController();
  TextEditingController installmentControllert = TextEditingController();
  TextEditingController initDateControlle = TextEditingController();
  TextEditingController endDateControlle = TextEditingController();
  TextEditingController hourDateControlle = TextEditingController();

  bool isValidForm = false;
  initState() {
    this.isValidForm = false;
    this.installmentControllert.text = '1';
    this.currentSatus = AppStatus.ENPYT;

    // this.rent_controller.addListener(() {
    //   print('Add o listener');
    //   print('controler ==> ${installmentControllert.text}');
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    super.dispose();
    print('Bateu no dispose');
    this.rent_controller.removeListener(() {});
    this.nameControllert.dispose();
    this.phoneControllert.dispose();
    this.valueControllert.dispose();
    this.installmentControllert.dispose();
    this.initDateControlle.dispose();
    this.endDateControlle.dispose();
    this.hourDateControlle.dispose();
  }

  _handleValidade(String text) {
    print(text);
    final test = this.nameControllert.text.length > 2 &&
        this.phoneControllert.text.length > 7 &&
        this.valueControllert.text.length > 0 &&
        this.installmentControllert.text.length > 0 &&
        this.initDateControlle.text.length > 0 &&
        this.endDateControlle.text.length > 0;

    if ((test && !isValidForm) || (!test && isValidForm)) {
      setState(() {
        this.isValidForm = !this.isValidForm;
      });
    }
  }

  Future<String> _handleSelectDate() async {
    FocusManager.instance.primaryFocus?.unfocus();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      // locale: new Locale('pt', 'BR'),
      firstDate: DateTime
          .now(), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      return formattedDate;
    }
    return '';
  }

  _handleSetDate(TextEditingController ctrl, String value) async {
    ctrl.text = value;
    _handleValidade('');
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {});
  }

  Future<String> _handleSelectHours() async {
    TimeOfDay? pickedDate =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (pickedDate != null) {
      String formattedDate = pickedDate.format(context);
      return formattedDate;
    }
    return '';
  }

  _handleAddRent() async {
    this.currentSatus = AppStatus.LOADING;

    this.setState(() {});
    var dateInitList = this.initDateControlle.text.split('/');
    var dateEndList = this.endDateControlle.text.split('/');

    String dateInit = '';
    String dateEnd = '';
    if (this.mooldSelected == RentMolde.HOUR) {
      var date = hourDateControlle.text.split('/');
      dateInit = '${date[2]}-${date[1]}-${date[0]} ${dateInitList[0]}';
      dateEnd = '${date[2]}-${date[1]}-${date[0]} ${dateEndList[0]}';
    } else {
      dateInit =
          '${dateInitList[2]}-${dateInitList[1]}-${dateInitList[0]} 00:00';
      dateEnd = '${dateEndList[2]}-${dateEndList[1]}-${dateEndList[0]} 23:59';
    }
    dynamic data = {
      "id": "id",
      "date_init": dateInit,
      "status": 0,
      "date_end": dateEnd,
      "client": {
        "name": this.nameControllert.text,
        "phone": this.phoneControllert.text
      },
      "value_installments": double.parse(this.valueControllert.text),
      "total_value": double.parse(this.valueControllert.text) *
          int.parse(this.installmentControllert.text),
      "installments": int.parse(this.installmentControllert.text),
      "mode": rentModelEncode(this.mooldSelected),
    };

    print(data);
    try {
      this.currentSatus = AppStatus.LOADING;
      await this.rent_controller.createRent(data, this.propertie_controller.propertirDtatil?.id);

      this.setState(() {});

      await Future.delayed(Duration(seconds: 1));
      this.currentSatus = AppStatus.SUCCESS;

      showToats('Aluguel cadastrado', true);

      Navigator.of(context).pop();
    } catch (e) {
      this.currentSatus = AppStatus.ERROR;

      this.setState(() {});

      print(e);
      showToats('Erro ao cadastrar aluguel', false);
    }
  }

  // showToats(String text, bool success) {
  //   Fluttertoast.showToast(
  //     msg: text,
  //     gravity: ToastGravity.SNACKBAR,
  //     toastLength: Toast.LENGTH_LONG,
  //     timeInSecForIosWeb: 3,
  //     backgroundColor: success ? Colors.green : Colors.red,
  //     textColor: Colors.white,
  //     // fontSize: 14.0
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                    child: Text('Sobre o locador:',
                        style: TextStyle(fontSize: 22)),
                  ),
                  InputPrimary(
                    type_input: TextInputType.text,
                    label: 'Nome',
                    controller_input: nameControllert,
                    changed_call: _handleValidade,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: InputPrimary(
                      type_input: TextInputType.number,
                      label: 'Telephone',
                      controller_input: phoneControllert,
                      changed_call: _handleValidade,
                      inputFormatters: [
                        MaskTextInputFormatter(
                            mask: '(##) #####-####',
                            filter: {"#": RegExp(r'[0-9]')})
                      ],
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
                            width:
                                ((MediaQuery.of(context).size.width - 38) / 4),
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
                            changed_call: _handleValidade,
                            controller_input: hourDateControlle,
                            onTap: () async {
                              _handleSetDate(this.hourDateControlle,
                                  await this._handleSelectDate());
                            },
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
                              type_input: TextInputType.text,
                              label: 'Início',
                              changed_call: _handleValidade,
                              controller_input: initDateControlle,
                              onTap: () async {
                                if (this.mooldSelected == RentMolde.HOUR) {
                                  _handleSetDate(this.initDateControlle,
                                      await this._handleSelectHours());
                                } else {
                                  _handleSetDate(this.initDateControlle,
                                      await this._handleSelectDate());
                                }
                              },
                              icon_sufix: Icon(
                                mooldSelected == RentMolde.HOUR
                                    ? Icons.timer
                                    : Icons.calendar_month,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: InputPrimary(
                              type_input: TextInputType.number,
                              label: 'Fim',
                              changed_call: _handleValidade,
                              controller_input: endDateControlle,
                              onTap: () async {
                                if (this.mooldSelected == RentMolde.HOUR) {
                                  _handleSetDate(this.endDateControlle,
                                      await this._handleSelectHours());
                                } else {
                                  _handleSetDate(this.endDateControlle,
                                      await this._handleSelectDate());
                                }
                              },
                              icon_sufix: Icon(
                                mooldSelected == RentMolde.HOUR
                                    ? Icons.timer
                                    : Icons.calendar_month,
                                color: Colors.grey,
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
                          changed_call: _handleValidade,
                          type_input: TextInputType.number,
                          label: 'Parcelas',
                          prefixText: 'x',
                          controller_input: installmentControllert,
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        width: ((MediaQuery.of(context).size.width * 0.6) - 24),
                        child: InputPrimary(
                          changed_call: _handleValidade,
                          type_input: TextInputType.number,
                          label: 'Valor',
                          controller_input: valueControllert,
                          prefixText: 'R\$',
                          // inputFormatters: [
                          //   MaskTextInputFormatter(
                          //       // mask: 'S,##',
                          //       filter: {"#": RegExp(r'[+-]?([0-9]*[.])?[0-9]+')})
                          // ],
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
                  Btn(
                    label: 'Cadastrar aluguel',
                    func: isValidForm ? _handleAddRent : null,
                    isLoading: currentSatus == AppStatus.LOADING,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
