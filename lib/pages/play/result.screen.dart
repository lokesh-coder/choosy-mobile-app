import 'package:choosy/config/colors.dart';
import 'package:choosy/config/icons.dart';
import 'package:choosy/source/models/dice.model.dart';
import 'package:choosy/widgets/app-shell.dart';
import 'package:choosy/widgets/header.dart';
import 'package:choosy/widgets/timeline-bar.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Dice dice;
  final Function onTimeOut;
  const ResultScreen(this.dice, {this.onTimeOut});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      header: Header(
        title: '${dice.title}',
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(dice.choices.firstWhere((c) => c.isPicked == true).name,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 35,
                      color: choosyColors['highlight'],
                      fontWeight: FontWeight.w900,
                    )),
              ],
            ),
          ),
          Expanded(child: TimelineBar(dice, onTimeOut), flex: 1)
        ],
      ),
    );
  }
}
