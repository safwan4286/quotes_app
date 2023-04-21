import 'package:flutter/material.dart';

class MessageSnackBar {
 static void errorMessage(String msg, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

 static void successMessage(String msg, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
