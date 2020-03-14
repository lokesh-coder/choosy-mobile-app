import 'package:flutter/material.dart';

notify(context, text) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: Duration(milliseconds: 500),
  ));
}
