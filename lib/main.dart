import 'package:coolflutterapp/pages/home.page.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ChoosyApp());
}

class ChoosyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ChangeNotifierProvider<DicesModel>(
      create: (context) => DicesModel(),
      child: MaterialApp(
        title: 'Choosy',
        debugShowCheckedModeBanner: false,
        // showPerformanceOverlay: true,
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
