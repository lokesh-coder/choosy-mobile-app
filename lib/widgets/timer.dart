import 'dart:async';
import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:flutter/material.dart';

class NextPickTimer extends StatefulWidget {
  final int timeInMs;
  final Function onDone;
  final Function onRun;
  final int refreshRateInSec = 200;
  final TextStyle labelStyles;

  NextPickTimer({this.timeInMs, this.onDone, this.onRun, this.labelStyles});

  String getDiplayiTime(Duration duration) {
    var formatValue = (int val) => val.remainder(60).toString().padLeft(2, '0');
    String twoDigitMinutes = formatValue(duration.inMinutes);
    String twoDigitSeconds = formatValue(duration.inSeconds);
    return "$twoDigitMinutes:${twoDigitSeconds}s";
  }

  @override
  _NextPickTimerState createState() => _NextPickTimerState();
}

class _NextPickTimerState extends State<NextPickTimer> {
  Timer timer;
  String remainingTime;
  DateTime time;

  @override
  void initState() {
    timer = new Timer.periodic(
        Duration(milliseconds: widget.refreshRateInSec), _updateDisplayTime);

    var lastPlayedDateTime =
        DateTime.fromMillisecondsSinceEpoch(widget.timeInMs);
    var duration = Duration(minutes: 1);
    time = DateTime.parse(lastPlayedDateTime.toString()).add(duration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            ChoosyIcon.time_line,
            size: 18,
            color: choosyColors['heading'].withOpacity(0.3),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            remainingTime != null ? '$remainingTime' : '',
            style:
                widget.labelStyles == null ? TextStyle() : widget.labelStyles,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  _updateDisplayTime(timer) {
    final time2 = DateTime.now();
    Duration diffDuration = time.difference(time2);
    int diff = diffDuration.inSeconds;

    remainingTime = widget.getDiplayiTime(diffDuration);
    if (widget.onRun != null) widget.onRun(diff);

    if (diff <= 0) {
      timer.cancel();
      remainingTime = null;
      print('TIMER STOPPED!');
      widget.onDone();
    }
    setState(() {});
  }
}
