import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:renter_app/core/database/db_local.dart';

import '../../interfaces/status.dart';
import '../models/rent-model.dart';
import '../service/renter_api.dart';

class RentController extends ChangeNotifier {
  DBProvider db_local = DBProvider();

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

  Future<void> loadRent(String? id) async {
    if (id != null) {
      this.setFetchingState(AppStatus.LOADING);

      try {
        List<RentModel> res = await this.db_local.getRents(id);
        print('Lista de akugueis: $res');
        this.rentList = res;
        this.setFetchingState(AppStatus.SUCCESS);
      } catch (e) {
        print('erro ao carregar rent: $e');
        this.setFetchingState(AppStatus.ERROR);
      }
    }
  }

  Future<void> createRent(dynamic data, String? propertie_id) async {
    if (propertie_id != null) {
      this.setFetchingState(AppStatus.LOADING);

      try {
        final rent = RentModel.fromMap(data);
        print('mont=> $rent');
        this.db_local.newRent(rent, propertie_id);

        this.setFetchingState(AppStatus.LOADING);
        await Future.delayed(Duration(seconds: 1));

        this.rentList.insert(0, rent);
        print(rent);
        this.setFetchingState(AppStatus.SUCCESS);
      } catch (e) {
        print('erro ao cadastrar alugual: $e');
        this.setFetchingState(AppStatus.ERROR);
      }
    }
  }

  Future<void> updateRent(RentModel rent, String propertie_id) async {
    this.setFetchingState(AppStatus.LOADING);

    try {
      final res = await this.db_local.updateRent(rent, propertie_id);
      print('Atualização feita com sucesso: $res');
      this.loadRent(propertie_id);
      this.setFetchingState(AppStatus.SUCCESS);
    } catch (e) {
      print('erro ao atualizar rent: $e');
      this.setFetchingState(AppStatus.ERROR);
    }
  }
}
