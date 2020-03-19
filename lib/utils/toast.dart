import 'package:coolflutterapp/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static success(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: choosyColors['positive'].withOpacity(0.6),
      textColor: Colors.white.withOpacity(0.8),
    );
  }
}
