enum AppStatus { SUCCESS, LOADING, ERROR, ENPYT }
enum BalanceStatus { PAID_OUT, LATE, IN_DEADLINE, ENPYT }
enum PropertiesStatus { RENTED, AVALIABLE, MAINTENANCE, DISABLED }

PropertiesStatus propertieModelFromJson(int num) {
  if (num == 0) return PropertiesStatus.AVALIABLE;
  if (num == 1) return PropertiesStatus.RENTED;
  if (num == 3) return PropertiesStatus.MAINTENANCE;
  return PropertiesStatus.DISABLED;
}
