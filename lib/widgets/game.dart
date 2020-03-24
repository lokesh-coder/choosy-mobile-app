import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:coolflutterapp/widgets/randomizer.dart';
import 'package:coolflutterapp/widgets/timeline-bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Game extends StatefulWidget {
  final Dice dice;
  final Function onSpin;
  final Function onTimerDone;

  Game({this.dice, this.onSpin, this.onTimerDone});

  @override
  _GameState createState() => _GameState();

  get isNewGame {
    return dice.lastPlayedTime == null;
  }
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> moveY;
  Animation<double> fadeIn;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    moveY = Tween<double>(
      begin: 100.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: animController,
        curve: Curves.easeIn,
      ),
    );
    fadeIn = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animController,
        curve: Curves.ease,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DicesModel>(builder: (context, dicesModel, child) {
      if (dicesModel.activeDice.lastPlayedTime != null) {
        animController.forward();
      }

      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Transform.translate(
            offset: Offset(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.dice.title,
                    style: TextStyle(
                      color: choosyColors['heading'].withOpacity(0.7),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 0),
                  child: _getChoice(dicesModel),
                )
              ],
            ),
          ),
          _getTimebar(dicesModel)
        ],
      );
    });
  }

  _getTimebar(dicesModel) {
    if (dicesModel.activeDice.lastPlayedTime == null)
      return SizedBox(
        height: 0,
      );
    return Positioned(
      child: Transform.translate(
        offset: Offset(0, moveY.value),
        child: Opacity(
          opacity: fadeIn.value,
          child: TimelineBar(dicesModel.activeDice, widget.onTimerDone),
        ),
      ),
      bottom: 40,
    );
  }

  _getChoice(dicesModel) {
    final TextStyle style = TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 35,
      fontWeight: FontWeight.w900,
    );
    if (dicesModel.activeDice.lastPlayedTime == null) {
      return Randomzer(
        items: widget.dice.choices,
        onRandomPick: (chosen) {
          animController.forward();
          widget.onSpin(chosen);
        },
        style: style,
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        dicesModel.activeDice.choices
            .firstWhere((c) => c.isPicked == true)
            .name,
        textAlign: TextAlign.center,
        style: style.copyWith(color: choosyColors['primary']),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
