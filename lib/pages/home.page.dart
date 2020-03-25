import 'package:choosy/pages/editor.page.dart';
import 'package:choosy/pages/home/dices.screen.dart';
import 'package:choosy/pages/home/empty-state.screen.dart';
import 'package:choosy/pages/home/loading.screen.dart';
import 'package:choosy/source/models/dices.model.dart';
import 'package:choosy/utils/fade-transition.dart';
import 'package:choosy/utils/sheet.dart';
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

      if (dicesModel.isLoading) {
        return LoadingScreen();
      }

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
        placeholderText: 'type new card name...',
        titleName: "Card name",
        onEnter: (diceName) async {
          dicesModel.activeDiceID = await dicesModel.insertDice(diceName);
          Navigator.of(context).pop();
          Navigator.push(
            context,
            FadeRoute(page: EditorPage()),
          );
        });
  }
}
