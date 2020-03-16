import 'package:coolflutterapp/pages/editor.page.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:coolflutterapp/widgets/dice-list.dart';
import 'package:coolflutterapp/widgets/welcome-heading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dicesModel = Provider.of<DicesModel>(context, listen: false);
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
              dicesModel.activeDiceID = null;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditorPage()),
              );
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
