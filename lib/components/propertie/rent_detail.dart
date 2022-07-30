import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:renter_app/components/communs/title-subtitle.dart';
import 'package:renter_app/core/models/rent-model.dart';
import 'package:renter_app/interfaces/rent.dart';
import 'package:renter_app/interfaces/status.dart';

class RentDetail extends StatefulWidget {
  final RentModel rent;
  RentDetail({Key? key, required this.rent});

  @override
  State<RentDetail> createState() => _RentDetailState();
}

class _RentDetailState extends State<RentDetail> {
  @override
  RentStatus dropdownValue = RentStatus.EMPYT;
  List<RentStatus> stateMachineRent = [];
  initState() {
    dropdownValue = widget.rent.status;
    stateMachineRent.add(widget.rent.status);
    stateMachineRent.addAll(rentStatusStateMachine(widget.rent.status));
    print(stateMachineRent);
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Aluguel',
                style: TextStyle(fontSize: 22),
              ),
              DropdownButton<RentStatus>(
                value: dropdownValue,
                icon: Visibility(
                    visible: false, child: Icon(Icons.arrow_downward)),
                // icon: const Icon(Icons.arrow_downward),
                // elevation: 16,
                // style: const TextStyle(color: Colors.deepPurple),
                // underline: Container(
                //   height: 2,
                //   color: Colors.deepPurpleAccent,
                // )
                borderRadius: BorderRadius.circular(10),
                underline: SizedBox(),
                onChanged: (RentStatus? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: stateMachineRent
                    .map<DropdownMenuItem<RentStatus>>((RentStatus value) {
                  return DropdownMenuItem<RentStatus>(
                    value: value,
                    child: Column(
                      children: [
                        Text(
                            value == dropdownValue
                                ? 'Status atual:'
                                : 'Mudar para:',
                            style: TextStyle(fontSize: 12)),
                        SizedBox(height: 4),
                        Badge(
                          toAnimate: false,
                          shape: BadgeShape.square,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          badgeColor: rentGetColor(value),
                          borderRadius: BorderRadius.circular(8),
                          badgeContent: Text(rentGetLabel(value),
                              style: TextStyle(fontSize: 8)),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: TitleSubtitle(
                  title: DateFormat('dd/MM/yyyy • kk:mm')
                      .format(widget.rent.date_init),
                  titleStyle: TextStyle(fontSize: 18),
                  subtitle: 'Inicio',
                ),
              ),
              Expanded(
                child: TitleSubtitle(
                  titleStyle: TextStyle(fontSize: 18),
                  title: DateFormat('dd/MM/yyyy • kk:mm')
                      .format(widget.rent.date_end),
                  subtitle: 'Fim',
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
          TitleSubtitle(
            title: (widget.rent.installments > 1
                    ? '(${widget.rent.installments}x) '
                    : '') +
                'R\$ ${widget.rent.value_installments}',
            subtitle: 'Valor',
          ),
          SizedBox(height: 32),
          TitleSubtitle(
            title: widget.rent.client.name,
            subtitle: 'Locador',
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                color: Colors.grey,
                size: 16,
              ),
              SizedBox(width: 8),
              Text(widget.rent.client.phone, style: TextStyle(fontSize: 18))
            ],
          )
        ],
      ),
    );
  }
}
