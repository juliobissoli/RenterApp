import 'dart:convert';

import 'package:flutter/services.dart';

class RenterApi {
  static final RenterApi _renterApi = RenterApi._internal();
  RenterApi._internal();
  static RenterApi get singleton => _renterApi;

  String authToken = "";
  var rout = '';

  // Dio _dioInstance = new Dio();

  setAuthToken(String token) {
    print('TOKEN ->>$token');
    this.authToken = token;
  }

  // Future<Response> loginApi({String email, String password}) {
  //   final body = {"email": email, "password": password};
  //   final host = '$base_url/login';

  //   return Dio().post(host, data: body);
  // }

  // Future<Response<dynamic>> api_get(String rout, dynamic data) async {
  //   this._dioInstance.options.headers["Authorization"] = "Bearer ${this.authToken}";
  //   this._dioInstance.options.headers['content-Type'] = 'application/json';

  //   return this._dioInstance.get('$base_url/$rout', queryParameters: data);
  // }

  Future<void> readJson(String file) async {
    final String response =
        await rootBundle.loadString('assets/data/${file}.json');
    final data = await json.decode(response);
    // print(data);
    return data;
  }

  Future<dynamic> api_get(String route, dynamic data) async {
    await Future.delayed(Duration(milliseconds: 500));
    return this.readJson(route);
  }
}
