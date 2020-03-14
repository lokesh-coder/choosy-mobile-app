import 'package:coolflutterapp/dao/dice.dao.dart';
import 'package:coolflutterapp/screens/dice-empy-state.dart';
import 'package:coolflutterapp/screens/dices.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DiceDao().getAllDices(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // DiceDao().dropDb();
          if (snapshot.hasData && snapshot.data.length > 0) {
            return DicesScreen();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data.length == 0) {
            return DiceEmptyStateScreen();
          }

          return Text('loading...');
        });
  }
}
