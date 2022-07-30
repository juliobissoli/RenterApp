import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/core/models/address-model.dart';
import 'package:renter_app/core/models/propertie-model.dart';
import 'package:renter_app/core/models/rent-model.dart';
import 'package:renter_app/core/service/renter_api.dart';
import 'package:renter_app/interfaces/status.dart';

class PropertieController extends ChangeNotifier {
  AppStatus _fetchingState = AppStatus.ENPYT;

  AppStatus get fetchingState => _fetchingState;

  List<PropertieModel> prorpertieList = [];

  PropertieModel? propertirDtatil;
  List<RentModel> rentSelected = [];

  RenterApi get api => RenterApi.singleton;

  AppStatus teste = AppStatus.ENPYT;

  void setFetchingState(AppStatus fetchingState) {
    _fetchingState = fetchingState;
    notifyListeners();
  }

  loadProrpeties() async {
    this.setFetchingState(AppStatus.LOADING);
    final dynamic res = await api.api_get('properties', null);
    (res as List)
        .forEach((el) => this.prorpertieList.add(PropertieModel.fromJson(el)));
    this.setFetchingState(AppStatus.SUCCESS);
  }

  Future<void> loadPropertieDetail(String id) async {
    PropertieModel propertie;

    dynamic teste = await api.api_get('rents', null);

    List<RentModel> rents =
        (teste as List).map((e) => RentModel.fromJson(e)).toList();
    // print('teste');

    if (this.rentSelected.length == 0) {
      this.rentSelected = rents;
    }

    await Future.delayed(Duration(milliseconds: 500));

    dynamic res = await api.api_get('properties', null);
    (res as List).forEach((el) => {
          el['last_rents'] = teste,
          propertie = PropertieModel.fromJson(el),
          if (propertie.id == id)
            {
              this.propertirDtatil = propertie,
            }
        });

    // this.setFetchingState(AppStatus.SUCCESS);
    // this.teste  = AppStatus.SUCCESS;
    // notifyListeners();
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

  Future<PropertieModel> createPropertie(dynamic data) async {
    this.setFetchingState(AppStatus.LOADING);
    await Future.delayed(Duration(seconds: 1));

    final rent = PropertieModel.fromMap(data);
    this.prorpertieList.add(rent);
    print(rent);
    this.setFetchingState(AppStatus.SUCCESS);

    return rent;
  }
}
