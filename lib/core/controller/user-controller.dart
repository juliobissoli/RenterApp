import 'package:flutter/foundation.dart';

class UserController with ChangeNotifier {
  Future<bool> login(String email, String passowrd) async {
    await Future.delayed(Duration(seconds: 1));

    return email == 'admin@admin.com' && passowrd == '123456';
  }

  Future<bool> createUser(String name, String email, String passowrd) async {
    await Future.delayed(Duration(seconds: 1));

    return email == 'admin@admin.com' && passowrd == '123456';
  }
}
