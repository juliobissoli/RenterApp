import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToats(String text, bool success) {
  Fluttertoast.showToast(
    msg: text,
    gravity: ToastGravity.SNACKBAR,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 3,
    backgroundColor: success ? Colors.green : Colors.red,
    textColor: Colors.white,
    // fontSize: 14.0
  );
}
