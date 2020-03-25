import 'package:choosy/config/app-config.dart';
import 'package:choosy/config/colors.dart';
import 'package:flutter/material.dart';

class WelcomeHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: choosyColors['bg'],
      padding: EdgeInsets.only(
        left: 20,
        top: 40,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            appConfig['label.cardsWelcomeNote'],
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: choosyColors['subheading'],
            ),
          )
        ],
      ),
    );
  }
}
