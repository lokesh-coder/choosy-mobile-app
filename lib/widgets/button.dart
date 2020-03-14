import 'package:coolflutterapp/config/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onTap;
  final String text;

  const Button(this.text, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          color: choosyColors['primary'],
          elevation: 20,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(4.0)),
          onPressed: onTap,
          child: Text(
            this.text.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white.withAlpha(150)),
          )),
    );
  }
}
