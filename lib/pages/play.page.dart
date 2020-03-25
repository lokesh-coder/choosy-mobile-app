import "dart:math";
import 'package:choosy/pages/editor.page.dart';
import 'package:choosy/pages/play/board.screen.dart';
import 'package:choosy/pages/play/error.screen.dart';
import 'package:choosy/source/models/dice.model.dart';
import 'package:choosy/source/models/dices.model.dart';
import 'package:choosy/utils/fade-transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatelessWidget {
  final Random random = new Random();

  @override
  Widget build(BuildContext context) {
    final DicesModel dicesModel =
        Provider.of<DicesModel>(context, listen: false);

    Dice dice = dicesModel.activeDice;
    bool hasChoices = dice.choices != null && dice.choices.length >= 2;

    // dicesModel.setPlayedTime(dice.id, dice.choices[randomChoiceIndex].id);
    //  dicesModel.clearLastPlayedTime(dice.id);

    var goToEditor = () {
      dicesModel.activeDiceID = dice.id;
      Navigator.push(
        context,
        FadeRoute(page: EditorPage()),
      );
    };

    if (!hasChoices) return ErrorScreen(goToEditor);

    return BoardScreen(
      dice: dice,
    );
  }
}
