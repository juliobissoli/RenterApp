import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController with ChangeNotifier {
  bool is_logged = false;
  String username = "";
  String email = "";
  String token = '';
  int user_id = -1;

  Future<bool> login(String email, String passowrd) async {
    await Future.delayed(Duration(seconds: 1));

    bool valide = email == 'admin@admin.com' && passowrd == '123456';
    if (valide) {
      await this.setLocalState(true, 'Julio Bissoli', 1, email, 'token');
    }
    return valide;
  }

  Future<bool> createUser(String name, String email, String passowrd) async {
    await Future.delayed(Duration(seconds: 1));

    return email == 'admin@admin.com' && passowrd == '123456';
  }

  setLocalState(bool is_logged, String username, int user_id, String email,
      String token) async {
    final data_local = await SharedPreferences.getInstance();

    data_local.setBool("@is_logged", is_logged);
    data_local.setString("@username", username);
    data_local.setInt("@user_id", user_id);
    data_local.setString("@email", email);
    data_local.setString("@token", token);
  }

  Future getDataLocal() async {
    // setFetchingState(FetchingState.Loading);

    final data_local = await SharedPreferences.getInstance();

    is_logged = data_local.getBool("@is_logged") ?? false;
    username = data_local.getString("@username") ?? "";
    user_id = data_local.getInt("@user_id") ?? -1;
    email = data_local.getString("@email") ?? "";
    token = data_local.getString("@token") ?? "";

    // api.setAuthToken(token);

    // setFetchingState(FetchingState.Success);
  }

  Future cleanDataLocal() async {
    final data_local = await SharedPreferences.getInstance();
    data_local.setBool("@is_logged", false);
    data_local.setString("@username", "");
    data_local.setString("@email", "");
    data_local.setString("@token", "");
  }
}
