import 'package:choosy/pages/editor/dice.screen.dart';
import 'package:choosy/source/models/dice.model.dart';
import 'package:choosy/source/models/dices.model.dart';
import 'package:choosy/utils/sheet.dart';
import 'package:choosy/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditorPage extends StatelessWidget {
  Future _openForm(BuildContext context, DicesModel dicesModel, diceID) async {
    await formSheet(
        context: context,
        defaultValue: null,
        titleName: "Add Choice",
        onEnter: (choiceName) {
          dicesModel.insertChoice(diceID, choiceName);
          Toast.success('$choiceName added!');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DicesModel>(
      builder: (context, DicesModel dicesModel, child) {
        Dice dice = dicesModel.activeDice;
        return DiceScreen(
            dice: dice,
            onFormOpen: () async {
              await _openForm(context, dicesModel, dice.id);
            },
            onAdd: (diceName) async {
              if (dice.title != null) {
                dicesModel.updateDice(dice.id, diceName);
                Toast.success('Card name updated!');
                Navigator.of(context).pop();
              } else {
                await dicesModel.insertDice(diceName);
                Toast.success('Created new card!');
              }
            });
      },
    );
  }
}
