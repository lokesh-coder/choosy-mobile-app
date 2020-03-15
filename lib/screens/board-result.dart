import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/models/dice.model.dart';
import 'package:coolflutterapp/widgets/timelinebar.dart';
import 'package:flutter/material.dart';

class BoardResultScreen extends StatelessWidget {
  final Dice dice;
  final Function onTimeOut;
  const BoardResultScreen(this.dice, {this.onTimeOut});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: choosyColors['highlightBgStart'],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            ChoosyIcon.arrow_left_line,
            color: choosyColors['text'],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              choosyColors['highlightBgStart'],
              choosyColors['highlightBgEnd']
            ])),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(dice.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        dice.choices.firstWhere((c) => c.isPicked == true).name,
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
        ),
      ),
    );
  }
}
