import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/core/models/address-model.dart';
import 'package:renter_app/core/models/propertie-model.dart';
import 'package:renter_app/core/models/rent-model.dart';
import 'package:renter_app/core/service/renter_api.dart';
import 'package:renter_app/interfaces/status.dart';

class RentController extends ChangeNotifier {
  AppStatus _fetchingState = AppStatus.ENPYT;

  AppStatus get fetchingState => _fetchingState;

  // List<PropertieModel> prorpertieList = [];

  // PropertieModel? propertirDtatil;
  List<RentModel> rentSelected = [];

  RenterApi get api => RenterApi.singleton;

  void setFetchingState(AppStatus fetchingState) {
    _fetchingState = fetchingState;
    notifyListeners();
  }

  Future<List<RentModel>> loadProrpeties() async {
    try {
      this.setFetchingState(AppStatus.LOADING);
      final res = await api.api_get("properties", null);
      if (res.statusCode == 200) {
        var list =
            (res.data as List).map((e) => RentModel.fromJson(e)).toList();

        this.rentSelected = list;
        this.setFetchingState(AppStatus.SUCCESS);
      }
    } catch (e) {
      this.setFetchingState(AppStatus.ERROR);
      print("Erro getStoneAPi -> $e");
    }

    return this.rentSelected;
  }

  Future<RentModel> createRent(dynamic data) async {
    this.setFetchingState(AppStatus.LOADING);
    await Future.delayed(Duration(seconds: 1));

    final rent = RentModel.fromMap(data);
    this.rentSelected.add(rent);
    print(rent);
    this.setFetchingState(AppStatus.SUCCESS);

    return rent;
  }
}
