import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/models/dice.model.dart';
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
    // print(
    //     'remainingSec =====  $remainingSec, currentwidth ======= $currentwidth');

    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: totalBarWidth,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: SizedBox(
                  width: 10,
                ),
              ),
              AnimatedContainer(
                width: totalBarWidth - currentwidth,
                duration: Duration(seconds: 1),
                height: 10,
                decoration: BoxDecoration(
                  color: choosyColors['info'],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: SizedBox(
                  width: 10,
                ),
              )
            ],
          ),
          NextPickTimer(
            timeInMs: widget.dice.lastPlayedTime,
            onDone: widget.onTimeOut,
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
