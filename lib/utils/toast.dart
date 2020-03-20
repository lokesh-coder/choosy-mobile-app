import 'package:coolflutterapp/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static success(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      backgroundColor: choosyColors['positive'],
      textColor: Colors.white.withOpacity(0.8),
    );
  }

  static error(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      backgroundColor: choosyColors['negative'],
      textColor: Colors.white.withOpacity(0.8),
    );
  }
}
