import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:coolflutterapp/widgets/timer.dart';
import 'package:flutter/material.dart';

class TimelineBar extends StatefulWidget {
  final Dice dice;
  final Function onTimeOut;

  const TimelineBar(this.dice, this.onTimeOut);

  @override
  _TimelineBarState createState() => _TimelineBarState();
}

class _TimelineBarState extends State<TimelineBar> {
  int totalSec = Duration(minutes: 1).inSeconds;
  int remainingSec;

  double calcProgress(double totalBarWidth, int remaingSec, int totalSec) {
    return (((totalBarWidth * remaingSec) / totalSec));
  }

  @override
  void initState() {
    super.initState();
    remainingSec = totalSec;
  }

  @override
  Widget build(BuildContext context) {
    double totalBarWidth = MediaQuery.of(context).size.width / 1.5;

    double currentwidth = calcProgress(totalBarWidth, remainingSec, totalSec);

    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: totalBarWidth,
                height: 6,
                decoration: BoxDecoration(
                  color: choosyColors['heading'].withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: SizedBox(
                  width: 10,
                ),
              ),
              AnimatedContainer(
                width: totalBarWidth - currentwidth,
                duration: Duration(seconds: 1),
                height: 6,
                decoration: BoxDecoration(
                  color: choosyColors['primary'],
                  gradient: LinearGradient(
                    colors: <Color>[
                      choosyColors['highlightBgStart'],
                      choosyColors['highlightBgEnd'],
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: SizedBox(
                  width: 10,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          NextPickTimer(
            timeInMs: widget.dice.lastPlayedTime,
            onDone: widget.onTimeOut,
            labelStyles:
                TextStyle(color: choosyColors['heading'].withOpacity(0.7)),
            onRun: (rem) {
              setState(() {
                remainingSec = rem;
              });
            },
          ),
        ],
      ),
    );
  }
}
