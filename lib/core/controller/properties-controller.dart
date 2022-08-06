import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/core/database/db_local.dart';
import 'package:renter_app/core/models/address-model.dart';
import 'package:renter_app/core/models/propertie-model.dart';
import 'package:renter_app/core/models/rent-model.dart';
import 'package:renter_app/core/service/renter_api.dart';
import 'package:renter_app/interfaces/status.dart';

class PropertieController extends ChangeNotifier {
  // final DBProvider db_local = KiwiContainer().resolve();
  DBProvider db_local = DBProvider();

  AppStatus _fetchingState = AppStatus.ENPYT;

  AppStatus get fetchingState => _fetchingState;

  List<PropertieModel> prorpertieList = [];

  PropertieModel? propertirDtatil;
  // List<RentModel> rentSelected = [];

  RenterApi get api => RenterApi.singleton;

  AppStatus teste = AppStatus.ENPYT;

  void setFetchingState(AppStatus fetchingState) {
    _fetchingState = fetchingState;
    notifyListeners();
  }

  Future<List<PropertieModel>> loadProrpeties() async {
    // this.setFetchingState(AppStatus.LOADING);
    print('Vai buscar no bdLocal');
    try {
      final res = await this.db_local.getProperties();
      print('Res local => $res');
      this.prorpertieList.addAll(res);
      // this.prorpertieList.add(PropertieModel.fromJson(res))
    } catch (e) {}

    // Future.delayed(Duration(milliseconds: 500));
    // final dynamic res = await api.api_get('properties', null);
    // (res as List)
    //     .forEach((el) => this.prorpertieList.add(PropertieModel.fromJson(el)));
    // this.setFetchingState(AppStatus.SUCCESS);

    return this.prorpertieList;
  }

  // Future<void> loadPropertieDetail(String id) async {
  //   PropertieModel propertie;

  //   dynamic teste = await api.api_get('rents', null);

  //   // List<RentModel> rents =
  //   //     (teste as List).map((e) => RentModel.fromJson(e)).toList();
  //   // // print('teste');

  //   // if (this.rentSelected.length == 0) {
  //   //   this.rentSelected = rents;
  //   // }

  //   await Future.delayed(Duration(milliseconds: 500));

  //   dynamic res = await api.api_get('properties', null);
  //   (res as List).forEach((el) => {
  //         el['last_rents'] = teste,
  //         propertie = PropertieModel.fromJson(el),
  //         if (propertie.id == id)
  //           {
  //             this.propertirDtatil = propertie,
  //           }
  //       });

  //   // this.setFetchingState(AppStatus.SUCCESS);
  //   // this.teste  = AppStatus.SUCCESS;
  //   // notifyListeners();
  // }

  Future<PropertieModel> createPropertie(dynamic data) async {
    // this.setFetchingState(AppStatus.LOADING);
    await Future.delayed(Duration(seconds: 1));

    final propertie = PropertieModel.fromMap(data);

    try {
      print('Vai add no db');
      final res = await db_local.newProperties(propertie);

      print('Add ==> $res');
    } catch (e) {
      print('Alguma coisa deu errado ==> $e');
    }

    this.prorpertieList.insert(0, propertie);
    print(propertie);
    // this.setFetchingState(AppStatus.SUCCESS);
    notifyListeners();

    return propertie;
  }
}
