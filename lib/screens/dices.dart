import 'package:coolflutterapp/widgets/dice-list.dart';
import 'package:coolflutterapp/widgets/welcome-heading.dart';
import 'package:flutter/material.dart';

class DicesScreen extends StatelessWidget {
  const DicesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choosy',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.playlist_add,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/editor', arguments: {'id': null});
            },
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          WelcomeHeading(),
          Expanded(child: DiceList()),
        ],
      ), // pass dices to avoid db query
    );
  }
}
