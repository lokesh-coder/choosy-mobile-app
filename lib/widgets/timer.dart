import 'dart:async';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NextPickTimer extends StatefulWidget {
  final int timeInMs;
  final Function onDone;
  final Function onRun;
  final int refreshRateInSec = 200;
  TextStyle labelStyles = TextStyle();
  DateTime time;

  NextPickTimer({this.timeInMs, this.onDone, this.onRun, this.labelStyles}) {
    var lastPlayedDateTime = DateTime.fromMillisecondsSinceEpoch(timeInMs);
    var duration = Duration(minutes: 1);
    time = DateTime.parse(lastPlayedDateTime.toString()).add(duration);
  }

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
  Timer _timer;
  String remainingTime;

  @override
  void initState() {
    _timer = new Timer.periodic(
        Duration(milliseconds: widget.refreshRateInSec), _updateDisplayTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        remainingTime != null ? '$remainingTime' : '',
        style: widget.labelStyles,
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _updateDisplayTime(timer) {
    final time2 = DateTime.now();
    Duration diffDuration = widget.time.difference(time2);
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
