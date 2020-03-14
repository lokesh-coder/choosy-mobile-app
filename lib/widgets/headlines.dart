import 'package:coolflutterapp/config/colors.dart';
import 'package:flutter/material.dart';

class Headlines extends StatelessWidget {
  const Headlines({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
          Text(
            'Don’t think too much!',
            style: TextStyle(
                color: choosyColors['heading'],
                fontFamily: 'Gilroy',
                fontSize: 25,
                fontWeight: FontWeight.w900),
          ),
          Text(
            'Create a list and pick a random item',
            style: TextStyle(fontSize: 14, color: choosyColors['text']),
          )
        ],
      ),
    );
  }
}
