import 'dart:async';
import 'package:flutter/material.dart';

class NextPickTimer extends StatefulWidget {
  final DateTime time;
  final Function onDone;
  final int refreshRateInSec = 1;
  NextPickTimer({Key key, this.time, this.onDone}) : super(key: key);

  @override
  _NextPickTimerState createState() => _NextPickTimerState();
}

class _NextPickTimerState extends State<NextPickTimer> {
  Timer _timer;
  int remainingSec;

  @override
  void initState() {
    _timer = new Timer.periodic(
        Duration(seconds: widget.refreshRateInSec), _updateDisplayTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(remainingSec != null ? remainingSec.toString() : '...'),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _updateDisplayTime(timer) {
    final time2 = DateTime.now();
    int diff = widget.time.difference(time2).inSeconds;

    // print(diff);
    remainingSec = diff;

    if (diff <= 0) {
      timer.cancel();
      remainingSec = 0;
      widget.onDone();
    }
    setState(() {});
  }
}
