import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:coolflutterapp/widgets/app-shell.dart';
import 'package:coolflutterapp/widgets/button.dart';
import 'package:coolflutterapp/widgets/header.dart';
import 'package:coolflutterapp/widgets/headlines.dart';
import 'package:coolflutterapp/widgets/illustration.dart';
import 'package:coolflutterapp/widgets/shake-dice.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  final Dice dice;
  final Function onShake;

  BoardScreen({this.dice, this.onShake});

  @override
  Widget build(BuildContext context) {
    return AppShell(
        header: Header(
          title: 'Play',
          leading: IconButton(
            icon: Icon(
              ChoosyIcon.arrow_left_line,
              color: Colors.white.withOpacity(0.5),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ShakeDice(onPhoneShake: onShake),
            Opacity(
              child: Illustration('shake'),
              opacity: 0.5,
            ),
            Headlines(
              dice.title,
              'Shake yor phone to spin the dice!',
            ),
            Button(
              'spin the dice',
              onTap: onShake,
            )
          ],
        ));
  }
}
