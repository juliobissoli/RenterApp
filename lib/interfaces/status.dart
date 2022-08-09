import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum AppStatus { SUCCESS, LOADING, ERROR, ENPYT }
enum BalanceStatus { PAID_OUT, LATE, IN_DEADLINE, ENPYT }
enum PropertiesStatus { RENTED, AVALIABLE, MAINTENANCE, DISABLED }
// enum RentStatus { EMPYT, SCHEDULE, COMFIRMED, FINIXE, CANCELED }

PropertiesStatus propertieModelFromJson(int num) {
  if (num == 0) return PropertiesStatus.AVALIABLE;
  if (num == 1) return PropertiesStatus.RENTED;
  if (num == 2) return PropertiesStatus.MAINTENANCE;
  return PropertiesStatus.DISABLED;
}

int propertiStatusDecode(PropertiesStatus num) {
  if (num == PropertiesStatus.AVALIABLE) return 0;
  if (num == PropertiesStatus.RENTED) return 1;
  if (num == PropertiesStatus.MAINTENANCE) return 2;
  if (num == PropertiesStatus.DISABLED) return -1;
  return -1;
}

String propertyStatusGetLabel(PropertiesStatus num) {
  if (num == PropertiesStatus.AVALIABLE) return 'Disponivel';
  if (num == PropertiesStatus.DISABLED) return 'Desativado';
  if (num == PropertiesStatus.MAINTENANCE) return 'Em manutenção';
  if (num == PropertiesStatus.RENTED) return 'Alugado';
  return '--';
}

Color propertyStatusColor(PropertiesStatus num) {
  if (num == PropertiesStatus.AVALIABLE) return Colors.blue;
  if (num == PropertiesStatus.DISABLED) return Colors.grey;
  if (num == PropertiesStatus.MAINTENANCE) return Colors.red;
  ;
  if (num == PropertiesStatus.RENTED) return Colors.green;

  return Colors.grey;
}

// RentStatus rentModelFromJson(int num) {
//   if (num == 0) return RentStatus.SCHEDULE;
//   if (num == 1) return RentStatus.COMFIRMED;
//   if (num == 2) return RentStatus.FINIXE;
//   if (num == -1) return RentStatus.CANCELED;
//   return RentStatus.EMPYT;
// }

// Color rentGetColor(RentStatus num) {
//   if (num == RentStatus.CANCELED) return Colors.red;
//   if (num == RentStatus.COMFIRMED) return Colors.blue;
//   if (num == RentStatus.SCHEDULE) return Colors.purple;
//   if (num == RentStatus.FINIXE) return Colors.green;
//   return Colors.grey;
// }

// String rentGetLabel(RentStatus num) {
//   if (num == RentStatus.CANCELED) return 'Cancelado';
//   if (num == RentStatus.COMFIRMED) return 'Confirmado';
//   if (num == RentStatus.SCHEDULE) return 'Agendado';
//   if (num == RentStatus.FINIXE) return 'Concluído';
//   return '--';
// }
