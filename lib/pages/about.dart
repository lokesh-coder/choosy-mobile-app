import 'package:choosy/config/colors.dart';
import 'package:choosy/widgets/app-shell.dart';
import 'package:choosy/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppShell(
      header: Header(
        title: "About",
        action: IconButton(
          icon: Icon(Icons.share),
          color: Colors.white.withOpacity(0.7),
          onPressed: () {
            Share.share(
                'Choosy android app - picking a random item from a list is just a fun');
          },
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Text(
                'What is choosy?',
                style: TextStyle(
                  color: choosyColors['heading'],
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '''
          Choosy is a simple simple application helps you to pick a completely random item from a list. If your confused or dont have time to pick a choice, Choosy is just a right choice for you.

          Once a choice is selected you cannot run the same card again for 60 seconds. This is to avoid playing the card again if the choice is not something you wanted to accept.

          Choosy doesnt have any ads, no complicated stuffs, and it works offline.

        ''',
                style: TextStyle(
                  color: choosyColors['heading'],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Open source',
                style: TextStyle(
                  color: choosyColors['heading'],
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '''
          Choosy is an open spource project, build with Dart and Flutter. Complete source code has been hosted in Github.

        ''',
                style: TextStyle(
                  color: choosyColors['heading'],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
