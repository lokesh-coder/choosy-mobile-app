import 'package:coolflutterapp/pages/editor.page.dart';
import 'package:coolflutterapp/pages/home/dices.screen.dart';
import 'package:coolflutterapp/pages/home/empty-state.screen.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:coolflutterapp/utils/sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DicesModel _dicesModel =
        Provider.of<DicesModel>(context, listen: false);
    _dicesModel.fetchDices();

    return Consumer<DicesModel>(
        builder: (BuildContext context, DicesModel dicesModel, child) {
      int totalDices = dicesModel.getDices().length;

      if (totalDices > 0) {
        return DicesScreen(
            totalDices: totalDices,
            onNewDice: () => _formSheet(context, dicesModel));
      }

      return HomeEmptyStateScreen(
          onNewDice: () => _formSheet(context, dicesModel));
    });
  }

  _formSheet(context, dicesModel) async {
    await formSheet(
        context: context,
        defaultValue: '',
        placeholderText: 'type new dice name...',
        titleName: "Dice name",
        onEnter: (diceName) async {
          dicesModel.activeDiceID = await dicesModel.insertDice(diceName);
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditorPage()),
          );
        });
  }
}
