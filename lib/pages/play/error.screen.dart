import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/widgets/app-shell.dart';
import 'package:coolflutterapp/widgets/button.dart';
import 'package:coolflutterapp/widgets/header.dart';
import 'package:coolflutterapp/widgets/headlines.dart';
import 'package:coolflutterapp/widgets/illustration.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Function onEditClick;

  ErrorScreen(this.onEditClick);

  @override
  Widget build(BuildContext context) {
    return AppShell(
        header: Header(
          title: "Insufficient choices",
          leading: IconButton(
            icon: Icon(
              ChoosyIcon.arrow_left_line,
              color: Colors.white.withOpacity(0.5),
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
            Opacity(
              child: Illustration('missing'),
              opacity: 0.5,
            ),
            Headlines(
              'Oops, there is a problem!',
              'Dice should have atleast two choices to spin.',
            ),
            Button(
              'Edit this dice',
              onTap: onEditClick,
            )
          ],
        ));
  }
}
