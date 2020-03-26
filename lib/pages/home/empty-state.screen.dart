import 'package:choosy/config/colors.dart';
import 'package:choosy/widgets/app-shell.dart';
import 'package:choosy/widgets/button.dart';
import 'package:choosy/widgets/header.dart';
import 'package:choosy/widgets/headlines.dart';
import 'package:choosy/widgets/illustration.dart';
import 'package:flutter/material.dart';

class HomeEmptyStateScreen extends StatelessWidget {
  final Function onNewDice;
  final Function onSeedData;

  HomeEmptyStateScreen({this.onNewDice, this.onSeedData});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      header: Header(
        title: 'Choosy',
        // action: IconButton(
        //   icon: Icon(
        //     Icons.cloud_download,
        //     color: Colors.white.withOpacity(0.7),
        //   ),
        //   onPressed: onSeedData,
        // ),
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
