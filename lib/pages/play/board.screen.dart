import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:coolflutterapp/widgets/app-shell.dart';
import 'package:coolflutterapp/widgets/button.dart';
import 'package:coolflutterapp/widgets/game.dart';
import 'package:coolflutterapp/widgets/header.dart';
import 'package:coolflutterapp/widgets/headlines.dart';
import 'package:coolflutterapp/widgets/illustration.dart';
import 'package:coolflutterapp/widgets/shake-dice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoardScreen extends StatefulWidget {
  final Dice dice;

  BoardScreen({this.dice});

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  String status;

  @override
  void initState() {
    super.initState();
    final DicesModel _dicesModel =
        Provider.of<DicesModel>(context, listen: false);
    status =
        _dicesModel.activeDice.lastPlayedTime == null ? 'READY' : 'RUNNING';
  }

  @override
  Widget build(BuildContext context) {
    final DicesModel _dicesModel =
        Provider.of<DicesModel>(context, listen: false);

    return AppShell(
      header: Header(
        title: _dicesModel.activeDice.title,
        leading: IconButton(
          icon: Icon(
            ChoosyIcon.arrow_left_line,
            color: Colors.white.withOpacity(0.7),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      child: _getWidget(_dicesModel),
    );
  }

  _getWidget(_dicesModel) {
    if (status == 'READY') return _introWidget();
    return _gameWidget(_dicesModel);
  }

  _introWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ShakeDice(onPhoneShake: () => _changeGameStatus('RUNNING')),
        Opacity(
          child: Illustration('shake'),
          opacity: 0.5,
        ),
        Headlines(
          widget.dice.title,
          'Shake yor phone to shuffle!',
        ),
        Button(
          'shuffle',
          onTap: () => _changeGameStatus('RUNNING'),
        )
      ],
    );
  }

  _gameWidget(DicesModel dicesModel) {
    return Game(
        dice: dicesModel.activeDice,
        onSpin: (chosen) {
          dicesModel.setPlayedTime(dicesModel.activeDice.id, chosen.id);
        },
        onTimerDone: () {
          dicesModel.clearLastPlayedTime(dicesModel.activeDice.id);
          _changeGameStatus('READY');
        });
  }

  _changeGameStatus(_status) {
    setState(() {
      status = _status;
    });
  }
}
