import "dart:math";
import 'package:coolflutterapp/pages/play/board.screen.dart';
import 'package:coolflutterapp/pages/play/error.screen.dart';
import 'package:coolflutterapp/pages/play/result.screen.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatelessWidget {
  final Random random = new Random();
  final String activeDiceID;

  PlayPage({this.activeDiceID});

  @override
  Widget build(BuildContext context) {
    return Consumer<DicesModel>(
        builder: (context, DicesModel dicesModel, child) {
      Dice dice = dicesModel.activeDice;
      bool hasChoices = dice.choices != null && dice.choices.length >= 2;
      bool hasAlreadyPlayed = dice.lastPlayedTime != null;

      var spinTheDice = () {
        var randomChoiceIndex = random.nextInt(dice.choices.length);
        dicesModel.setPlayedTime(dice.id, dice.choices[randomChoiceIndex].id);
      };

      if (!hasChoices) return ErrorScreen();

      if (!hasAlreadyPlayed)
        return BoardScreen(
          dice: dice,
          onShake: spinTheDice,
        );

      return ResultScreen(dice, onTimeOut: () async {
        dicesModel.clearLastPlayedTime(dice.id);
      });
    });
  }
}
