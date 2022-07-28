enum AppStatus { SUCCESS, LOADING, ERROR, ENPYT }
enum BalanceStatus { PAID_OUT, LATE, IN_DEADLINE, ENPYT }
enum PropertiesStatus { RENTED, AVALIABLE, MAINTENANCE, DISABLED }
enum RentStatus { EMPYT, SCHEDULE, COMFIRMED, FINIXE, CANCELED }

PropertiesStatus propertieModelFromJson(int num) {
  if (num == 0) return PropertiesStatus.AVALIABLE;
  if (num == 1) return PropertiesStatus.RENTED;
  if (num == 3) return PropertiesStatus.MAINTENANCE;
  return PropertiesStatus.DISABLED;
}

RentStatus rentModelFromJson(int num) {
  if (num == 0) return RentStatus.SCHEDULE;
  if (num == 1) return RentStatus.COMFIRMED;
  if (num == 2) return RentStatus.FINIXE;
  if (num == -1) return RentStatus.CANCELED;
  return RentStatus.EMPYT;
}
