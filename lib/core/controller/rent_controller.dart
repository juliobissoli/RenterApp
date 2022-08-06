import 'package:flutter/foundation.dart';

import '../../interfaces/status.dart';
import '../models/rent-model.dart';
import '../service/renter_api.dart';

class RentController extends ChangeNotifier {
  AppStatus _fetchingState = AppStatus.ENPYT;

  AppStatus get fetchingState => _fetchingState;

  // List<PropertieModel> prorpertieList = [];

  // PropertieModel? propertirDtatil;
  List<RentModel> rentList = [];

  RenterApi get api => RenterApi.singleton;

  AppStatus teste = AppStatus.ENPYT;

  void setFetchingState(AppStatus fetchingState) {
    _fetchingState = fetchingState;
    notifyListeners();
  }

  Future<void> loadRent(String id) async {
    dynamic teste = await api.api_get('rents', null);

    List<RentModel> rents =
        (teste as List).map((e) => RentModel.fromJson(e)).toList();
    // print('teste');

    if (this.rentList.length == 0) {
      this.rentList = rents;
    }

    await Future.delayed(Duration(milliseconds: 500));

    this.setFetchingState(AppStatus.SUCCESS);
    // this.teste  = AppStatus.SUCCESS;
    // notifyListeners();
  }

  Future<RentModel> createRent(dynamic data) async {
    this.setFetchingState(AppStatus.LOADING);
    await Future.delayed(Duration(seconds: 1));

    final rent = RentModel.fromMap(data);
    this.rentList.insert(0, rent);
    print(rent);
    this.setFetchingState(AppStatus.SUCCESS);

    return rent;
  }
}
