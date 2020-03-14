import "dart:math";
import 'package:coolflutterapp/dao/dice.dao.dart';
import 'package:coolflutterapp/models/dice.model.dart';
import 'package:coolflutterapp/utils/settings.dart';
import 'package:coolflutterapp/widgets/board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shake_plugin/flutter_shake_plugin.dart';
import 'package:sembast/sembast.dart';

class PlayScreen extends StatefulWidget {
  final Settings settings = Settings();
  final Random random = new Random();
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  FlutterShakePlugin _shakePlugin;
  List items = [];
  String selecedItem = '';
  Map args;

  @override
  void initState() {
    super.initState();
    _shakePlugin = FlutterShakePlugin(
      shakeThresholdGravity: 30.0,
      vibrateDuration: 100,
      onPhoneShaken: () {
        (() async {
          RecordSnapshot record = await DiceDao().getADice(args['id']);
          Dice dice = Dice.fromJson(record.value);

          bool hasAlreadyPlayed = dice.lastPlayedTime != null;

          if (!hasAlreadyPlayed) {
            var randomChoiceIndex = widget.random.nextInt(dice.choices.length);
            await DiceDao()
                .pickAChoice(dice.id, dice.choices[randomChoiceIndex].id);
            setState(() {});
          }
        })();
      },
    )..startListening();
  }

  @override
  void dispose() {
    super.dispose();
    _shakePlugin.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;

    return FutureBuilder(
        future: DiceDao().getADice(args['id']),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('loading...');
          Dice dice = Dice.fromJson(snapshot.data.value);
          bool hasAlreadyPlayed = dice.lastPlayedTime != null;

          print('=== ${dice.toJson()}');

          return Scaffold(
              appBar: AppBar(
                title: Text(dice.title),
              ),
              body: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Text('set choice'),
                    onTap: () async {
                      if (hasAlreadyPlayed) return;
                      var randomChoiceIndex =
                          widget.random.nextInt(dice.choices.length);
                      await DiceDao().pickAChoice(
                          dice.id, dice.choices[randomChoiceIndex].id);

                      setState(() {});
                    },
                  ),
                  Center(
                      child: PickBoard(
                    choices: dice.choices,
                    selection: hasAlreadyPlayed
                        ? [
                            dice.choices
                                .firstWhere((c) => c.isPicked == true)
                                .name,
                            dice.lastPlayedTime
                          ]
                        : null,
                    onDone: () async {
                      await DiceDao().pickAChoice(dice.id);
                      setState(() {});
                    },
                  )),
                ],
              ));
        });
  }
}
