import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum RentStatus { EMPYT, SCHEDULE, COMFIRMED, FINIXE, CANCELED }

RentStatus rentModelFromJson(int num) {
  if (num == 0) return RentStatus.SCHEDULE;
  if (num == 1) return RentStatus.COMFIRMED;
  if (num == 2) return RentStatus.FINIXE;
  if (num == -1) return RentStatus.CANCELED;
  return RentStatus.EMPYT;
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
