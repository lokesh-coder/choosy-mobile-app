import 'package:choosy/config/icons.dart';
import 'package:choosy/widgets/app-shell.dart';
import 'package:choosy/widgets/dice-list.dart';
import 'package:choosy/widgets/header.dart';
import 'package:choosy/widgets/welcome-heading.dart';
import 'package:flutter/material.dart';

class DicesScreen extends StatelessWidget {
  final Function onNewDice;
  final int totalDices;
  DicesScreen({this.totalDices, this.onNewDice});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      header: Header(
        title: 'Cards ($totalDices)',
        action: IconButton(
          icon: Icon(
            ChoosyIcon.add_fill,
            color: Colors.white.withOpacity(0.7),
          ),
          onPressed: onNewDice,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          WelcomeHeading(),
          Expanded(child: DiceList()),
        ],
      ),
    );
  }
}
