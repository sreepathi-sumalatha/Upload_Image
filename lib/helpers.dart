
import 'package:flutter/material.dart';

class Helper {
  static RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$');
  showSnackbar(BuildContext context, String message,
      {Color color = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  static bool validateEmail(BuildContext context, String email) {
    bool status = false;
    if (email.isEmpty) {
      Helper().showSnackbar(context, 'Please enter your email address',
          color: Colors.red);
    } else if (!Helper.emailRegExp.hasMatch(email)) {
      Helper().showSnackbar(context, 'Please enter a valid email address',
          color: Colors.red);
    } else {
      status = true;
    }
    return status;
  }

  static bool validateUsername(BuildContext context, String username) {
    bool status = false;
    if (username.isEmpty) {
      Helper().showSnackbar(context, 'Please enter your username',
          color: Colors.red);
    } else if (username.length < 6) {
      Helper().showSnackbar(context, 'Please enter 6 characters username',
          color: Colors.red);
    } else {
      status = true;
    }
    return status;
  }

  static bool validatePassword(BuildContext context, String password,
      {String passwordType = ""}) {
    bool status = false;
    if (password.isEmpty) {
      Helper().showSnackbar(context, 'Please enter your $passwordType password',
          color: Colors.red);
    } else if (!passwordRegExp.hasMatch(password)) {
      Helper().showSnackbar(context,
          '$passwordType Password must contain at least 1 capital letter, 1 symbol, 1 number, and be at least 8 characters long',
          color: Colors.red);
    } else {
      status = true;
    }
    return status;
  }

 

  
 
}
