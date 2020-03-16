import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/widgets/illustration.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: choosyColors['bg'],
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
        body: Column(
          children: <Widget>[
            Illustration('missing'),
            Text("Dice should have atleast two choices to spin!"),
          ],
        ));
  }
}
