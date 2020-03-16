import 'package:coolflutterapp/pages/home.page.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChoosyApp());
}

class ChoosyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DicesModel>(
      create: (context) => DicesModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Manrope',
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => HomePage(),
        },
      ),
    );
  }
}
