import "dart:math";
import 'package:coolflutterapp/pages/editor.page.dart';
import 'package:coolflutterapp/pages/play/board.screen.dart';
import 'package:coolflutterapp/pages/play/error.screen.dart';
import 'package:coolflutterapp/pages/play/result.screen.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:coolflutterapp/utils/fade-transition.dart';
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
