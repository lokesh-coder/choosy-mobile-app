import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/widgets/app-shell.dart';
import 'package:coolflutterapp/widgets/button.dart';
import 'package:coolflutterapp/widgets/header.dart';
import 'package:coolflutterapp/widgets/headlines.dart';
import 'package:coolflutterapp/widgets/illustration.dart';
import 'package:flutter/material.dart';

class HomeEmptyStateScreen extends StatelessWidget {
  final Function onNewDice;

  HomeEmptyStateScreen({this.onNewDice});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      header: Header(
        title: 'Choosy',
      ),
      child: Container(
        decoration: BoxDecoration(
          color: choosyColors['bg'],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              child: Illustration('intro'),
              opacity: 0.5,
            ),
            Headlines(
              'Which one to choose?',
              'Create a list and Choosy will pick a random item',
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              'create a list',
              onTap: onNewDice,
            )
          ],
        ),
      ),
    );
  }
}
