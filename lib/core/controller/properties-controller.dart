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

  Future<List<PropertieModel>> loadProrpeties() async {
    try {
      this.setFetchingState(AppStatus.LOADING);
      final res = await api.api_get("properties", null);
      if (res.statusCode == 200) {
        var list =
            (res.data as List).map((e) => PropertieModel.fromJson(e)).toList();

        this.prorpertieList = list;
        this.setFetchingState(AppStatus.SUCCESS);
      }
    } catch (e) {
      this.setFetchingState(AppStatus.ERROR);
      print("Erro getStoneAPi -> $e");
    }

    return this.prorpertieList;
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

  Future<void> createPropertie(dynamic data) async {
    // this.setFetchingState(AppStatus.LOADING);
    await Future.delayed(Duration(seconds: 1));
    try {
      print('Vai tentar add => $data');
      final res = await this.api.api_post('properties', data);
      print('Result =>  ${res.data}');
      final propertie = PropertieModel.fromJson(res.data);
      this.prorpertieList.add(propertie);
      print(propertie);
    } catch (e) {
      print('Alguma coisa deu errado $e');
    }

    // this.setFetchingState(AppStatus.SUCCESS);
    notifyListeners();
  }
}
