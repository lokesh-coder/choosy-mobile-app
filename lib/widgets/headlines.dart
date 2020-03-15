import 'package:coolflutterapp/config/colors.dart';
import 'package:flutter/material.dart';

class Headlines extends StatelessWidget {
  final String heading;
  final String subheading;

  const Headlines(this.heading, this.subheading);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
          Text(
            heading,
            style: TextStyle(
                color: choosyColors['heading'],
                fontFamily: 'Gilroy',
                fontSize: 25,
                fontWeight: FontWeight.w900),
          ),
          Text(
            subheading,
            style: TextStyle(fontSize: 14, color: choosyColors['text']),
          )
        ],
      ),
    );
  }
}
