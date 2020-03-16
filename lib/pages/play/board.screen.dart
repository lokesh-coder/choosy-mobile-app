import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:coolflutterapp/widgets/illustration.dart';
import 'package:coolflutterapp/widgets/shake-dice.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  final Dice dice;
  final Function onShake;

  BoardScreen({this.dice, this.onShake});

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
        body: Column(
          children: <Widget>[
            ShakeDice(onPhoneShake: onShake),
            Illustration('shake'),
            GestureDetector(
              child: Text('set choice'),
              onTap: onShake,
            ),
            Text("Shake your phone"),
          ],
        ));
  }
}
