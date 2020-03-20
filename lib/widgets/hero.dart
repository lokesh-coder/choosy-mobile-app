import 'package:coolflutterapp/config/colors.dart';
import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  final String name;
  final String tag;

  HeroText({this.name, this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      child: Material(
        type: MaterialType.transparency,
        child: Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: choosyColors['title']),
        ),
      ),
      tag: tag,
    );
  }
}
