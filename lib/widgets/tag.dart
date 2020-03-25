import 'package:choosy/config/colors.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String label;
  const Tag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        color: choosyColors['tagBg'],
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: choosyColors['tagText'],
          fontSize: 12,
        ),
      ),
    );
  }
}
