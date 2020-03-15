import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/models/dice.model.dart';
import 'package:coolflutterapp/widgets/headlines.dart';
import 'package:coolflutterapp/widgets/illustration.dart';
import 'package:flutter/material.dart';

class BoardReadyScreen extends StatelessWidget {
  final Dice dice;
  const BoardReadyScreen(this.dice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: choosyColors['bg'],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            ChoosyIcon.arrow_left_line,
            color: choosyColors['text'],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Illustration('shake'),
            Headlines(dice.title, "Shake your phone to pick random item"),
          ],
        ),
      ),
    );
  }
}
