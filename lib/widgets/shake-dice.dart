import 'package:flutter/material.dart';
import 'package:flutter_shake_plugin/flutter_shake_plugin.dart';

class ShakeDice extends StatefulWidget {
  final Function onPhoneShake;
  ShakeDice({this.onPhoneShake});

  @override
  _ShakeDiceState createState() => _ShakeDiceState();
}

class _ShakeDiceState extends State<ShakeDice> {
  FlutterShakePlugin shakePlugin;
  @override
  void initState() {
    super.initState();

    shakePlugin = FlutterShakePlugin(
      shakeThresholdGravity: 30.0,
      vibrateDuration: 100,
      onPhoneShaken: () {
        widget.onPhoneShake();
      },
    )..startListening();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }

  @override
  void dispose() {
    super.dispose();
    shakePlugin.stopListening();
  }
}
