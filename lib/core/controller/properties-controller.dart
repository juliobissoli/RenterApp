import 'package:flutter/foundation.dart';
import 'package:renter_app/core/models/address-model.dart';
import 'package:renter_app/core/models/propertie-model.dart';
import 'package:renter_app/core/service/renter_api.dart';
import 'package:renter_app/interfaces/status.dart';

class PropertieController extends ChangeNotifier {
  AppStatus _fetchingState = AppStatus.ENPYT;

  AppStatus get fetchingState => _fetchingState;

  List<PropertieModel> prorpertieList = [];
  RenterApi get api => RenterApi.singleton;

  void setFetchingState(AppStatus fetchingState) {
    _fetchingState = fetchingState;
    notifyListeners();
  }

  loadProrpeties() async {
    this.setFetchingState(AppStatus.LOADING);
    final dynamic res = await api.api_get('propertie', null);
    (res as List).forEach((el) => this.add(PropertieModel.fromJson(el)));
    this.setFetchingState(AppStatus.SUCCESS);
  }

  add(PropertieModel data) {
    this.prorpertieList.add(data);
  }
}
