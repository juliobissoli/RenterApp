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

  String propertie_selected_id = '-1';

  PropertieModel? propertToUpdate;
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
      this.prorpertieList = res;
      // this.prorpertieList.add(PropertieModel.fromJson(res))
    } catch (e) {
      print('erro ao carregar imoves: $e');
    }

    return this.prorpertieList;
  }

  Future<PropertieModel> createPropertie(dynamic data) async {
    // this.setFetchingState(AppStatus.LOADING);
    // await Future.delayed(Duration(seconds: 1));

    final propertie = PropertieModel.fromMap(data);
    this.setFetchingState(AppStatus.LOADING);

    try {
      print('Vai add no db');
      final res = await db_local.newProperties(propertie);
      this.setFetchingState(AppStatus.SUCCESS);

      print('Add ==> $res');
    } catch (e) {
      print('Alguma coisa deu errado ==> $e');
      this.setFetchingState(AppStatus.ERROR);
    }

    // this.prorpertieList.insert(0, propertie);
    print(propertie);
    // this.setFetchingState(AppStatus.SUCCESS);
    // notifyListeners();

    return propertie;
  }

  Future addImage(String propertie_id, String url) async {
    if (propertie_id != '-1') {
      try {
        this.setFetchingState(AppStatus.LOADING);

        final res = await this.db_local.addImage(url, propertie_id);
        this.propertirDtatil?.images?.add(url);
        this.setFetchingState(AppStatus.SUCCESS);
      } catch (e) {
        this.setFetchingState(AppStatus.ERROR);
        print('Erro ao adicionar imagen: $e');
      }
    }
  }

  Future updateProperty(PropertieModel property) async {
    try {
      this.setFetchingState(AppStatus.LOADING);
      await this.db_local.updatePropert(property);
      PropertieModel newProp = PropertieModel(
          id: this.propertirDtatil?.id ?? '-1',
          address: property.address,
          label: property.label,
          status: property.status,
          images: this.propertirDtatil?.images ?? []);
      propertirDtatil = newProp;

      this.setFetchingState(AppStatus.SUCCESS);
    } catch (e) {
      this.setFetchingState(AppStatus.ERROR);

      print('Erro ao aatualizar imovel: $e');
    }
  }

  Future deletePropertie(String propert_id) async {
    print('vai deleta $propertToUpdate');

    try {
      this.setFetchingState(AppStatus.LOADING);
      await this.db_local.deleteProperties(propert_id);
      this.setFetchingState(AppStatus.SUCCESS);
    } catch (e) {
      this.setFetchingState(AppStatus.ERROR);

      print('Erro ao aatualizar imovel: $e');
    }
  }
}
