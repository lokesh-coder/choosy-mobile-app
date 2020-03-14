import 'package:flutter/material.dart';

class BlankDice extends StatelessWidget {
  final Function onClick;
  const BlankDice({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          child: Text('add new Dice'),
          onPressed: onClick,
        ),
      ),
    );
  }
}
