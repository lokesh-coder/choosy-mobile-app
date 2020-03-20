import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/widgets/app-shell.dart';
import 'package:coolflutterapp/widgets/button.dart';
import 'package:coolflutterapp/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppShell(
      header: Header(
        title: "About",
      ),
      child: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Text('What is choosy?',
                  style: TextStyle(
                    color: choosyColors['heading'],
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                '''
          Choosy is a simple application helps to decide a option if your are super confused or just in a situation to pick a random item from the list.

          This app doesnt have any ads, no complecated stuffs, and it works offline.

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
          Choosy is a open spource project, build with Dart and Flutter. Complete source code has been hosted in Github.

          Share it, if you like it!
        ''',
                style: TextStyle(
                  color: choosyColors['heading'],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Button(
                "Share",
                onTap: () {
                  Share.share('check out my website https://example.com');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
