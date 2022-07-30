import 'package:flutter/material.dart';
import 'package:renter_app/core/models/client-model.dart';
import 'package:renter_app/interfaces/rent.dart';
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

int rentModelEncode(RentMolde num) {
  if (num == RentMolde.HOUR) return 0;
  if (num == RentMolde.DAY) return 1;
  if (num == RentMolde.WEEK) return 7;
  if (num == RentMolde.MONTHM) return 30;
  if (num == RentMolde.YEAR) return 360;
  return 0;
}

class RentModel {
  final String id;
  final DateTime date_init;
  final DateTime date_end;
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
//  created_at: DateTime.parse(map['created_at']),
      date_init: DateTime.parse(map['date_init']),
      date_end: DateTime.parse(map['date_end']),
      status: rentModelFromJson(map['status']),
      client: ClientModal.fromMap(map['client']),
      total_value: map['total_value'],
      value_installments: map['value_installments'],
      installments: map['installments'],
      mode: rentModelDecode(map['mode']),
    );
  }

  factory RentModel.fromJson(Map<String, dynamic> map) {
    return RentModel(
      id: map['id'],
      date_init: DateTime.parse(map['date_init']),
      date_end: DateTime.parse(map['date_end']),
      status: rentModelFromJson(map['status']),
      client: ClientModal.fromJson(map['client']),
      total_value: map['total_value'],
      value_installments: map['value_installments'],
      installments: map['installments'],
      mode: rentModelDecode(map['mode']),
    );
  }
}
