import 'package:coolflutterapp/pages/home/dices.screen.dart';
import 'package:coolflutterapp/pages/home/empty-state.screen.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
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
      if (dicesModel.getDices().length > 0) {
        return DicesScreen();
      }

      return HomeEmptyStateScreen();
    });
  }
}
