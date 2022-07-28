import 'package:renter_app/core/models/client-model.dart';
import 'package:renter_app/interfaces/status.dart';

enum RentMolde { EMPYT, HOUR, DAY, WEEK, MONTHM, YEAR }

RentMolde rentModelDecode(int num) {
  if (num == 0) return RentMolde.HOUR;
  if (num == 1) return RentMolde.DAY;
  if (num == 7) return RentMolde.WEEK;
  if (num == 30) return RentMolde.MONTHM;
  if (num == 360) return RentMolde.YEAR;
  return RentMolde.EMPYT;
}

class RentModel {
  final String id;
  final String date_init;
  final String date_end;
  final RentStatus status;
  final ClientModal client;
  final double total_value;
  final double value_installments;
  final int installments;
  final RentMolde mode;

  RentModel(
      {required this.id,
      required this.date_init,
      required this.date_end,
      required this.status,
      required this.client,
      required this.total_value,
      required this.value_installments,
      required this.installments,
      required this.mode});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date_init': date_init,
      'date_end': date_end,
      'status': status,
      'client': client,
      'total_value': total_value,
      'value_installments': value_installments,
      'installments': installments,
      'mode': mode,
    };
  }

  factory RentModel.fromMap(Map<String, dynamic> map) {
    return RentModel(
      id: map['id'],
      date_init: map['date_init'],
      date_end: map['date_end'],
      status: map['status'],
      client: ClientModal.fromMap(map['client']),
      total_value: map['total_value'],
      value_installments: map['value_installments'],
      installments: map['installments'],
      mode: map['mode'],
    );
  }

  factory RentModel.fromJson(Map<String, dynamic> map) {
    return RentModel(
      id: map['id'],
      date_init: map['date_init'],
      date_end: map['date_end'],
      status: rentModelFromJson(map['status']),
      client: ClientModal.fromJson(map['client']),
      total_value: map['total_value'],
      value_installments: map['value_installments'],
      installments: map['installments'],
      mode: rentModelDecode(map['mode']),
    );
  }
}