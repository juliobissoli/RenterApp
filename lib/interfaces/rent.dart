import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum RentStatus { EMPYT, SCHEDULE, COMFIRMED, FINIXE, CANCELED }

RentStatus rentModelFromJson(int num) {
  if (num == 0) return RentStatus.SCHEDULE;
  if (num == 1) return RentStatus.COMFIRMED;
  if (num == 2) return RentStatus.FINIXE;
  if (num == 3) return RentStatus.CANCELED;
  return RentStatus.EMPYT;
}

int rentStatusEncode(RentStatus num) {
  if (num == RentStatus.SCHEDULE) return 0;
  if (num == RentStatus.COMFIRMED) return 1;
  if (num == RentStatus.FINIXE) return 2;
  if (num == RentStatus.CANCELED) return 3;
  if (num == RentStatus.EMPYT) return -1;
  return -1;
}

Color rentGetColor(RentStatus num) {
  if (num == RentStatus.CANCELED) return Colors.red;
  if (num == RentStatus.COMFIRMED) return Colors.blue;
  if (num == RentStatus.SCHEDULE) return Colors.purple;
  if (num == RentStatus.FINIXE) return Colors.green;
  return Colors.grey;
}

String rentGetLabel(RentStatus num) {
  if (num == RentStatus.CANCELED) return 'Cancelado';
  if (num == RentStatus.COMFIRMED) return 'Confirmado';
  if (num == RentStatus.SCHEDULE) return 'Agendado';
  if (num == RentStatus.FINIXE) return 'Concluído';
  return '--';
}

List<RentStatus> rentStatusStateMachine(RentStatus num) {
  if (num == RentStatus.CANCELED) return [];
  if (num == RentStatus.COMFIRMED)
    return [RentStatus.FINIXE, RentStatus.CANCELED];
  if (num == RentStatus.SCHEDULE)
    return [RentStatus.COMFIRMED, RentStatus.CANCELED];
  if (num == RentStatus.FINIXE) return [];
  return [];
}
