import 'package:coolflutterapp/db/choosy.db.dart';
import 'package:coolflutterapp/editor.dart';
import 'package:coolflutterapp/play.dart';
import 'package:coolflutterapp/widgets/pickslist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ChoosyDatabase(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => MyHomePage(),
          '/editor': (ctx) => Editor(),
          '/play': (ctx) => PlayScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
                Navigator.pushNamed(context, '/editor',
                    arguments: {'id': null});
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
        body: PicksList());
  }
}
