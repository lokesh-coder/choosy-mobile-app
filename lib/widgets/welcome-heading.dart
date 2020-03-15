import 'package:coolflutterapp/config/colors.dart';
import 'package:flutter/material.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello",
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w900,
                color: choosyColors['heading'],
                fontSize: 30,
              )),
          Text(
            "Pick a card and start spinning",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: choosyColors['subheading']),
          )
        ],
      ),
    );
  }
}
