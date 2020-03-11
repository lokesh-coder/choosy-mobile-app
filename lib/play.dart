import "dart:math";
import 'package:coolflutterapp/db/choosy.db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shake_plugin/flutter_shake_plugin.dart';

class PlayScreen extends StatefulWidget {
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  FlutterShakePlugin _shakePlugin;
  final _random = new Random();
  List items;
  String selecedItem = '';

  @override
  void initState() {
    super.initState();
    _shakePlugin = FlutterShakePlugin(
      shakeThresholdGravity: 30.0,
      vibrateDuration: 100,
      onPhoneShaken: () {
        selecedItem = items[_random.nextInt(items.length)]['choice'];
        print('phone shakes $selecedItem');
        setState(() {});
      },
    )..startListening();
  }

  @override
  void dispose() {
    super.dispose();
    _shakePlugin.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    final ChoosyDatabase db = Provider.of<ChoosyDatabase>(context);
    final dynamic args = ModalRoute.of(context).settings.arguments;

    print('__- ${args['id']}');
    return FutureBuilder(
        future: db.getPickWithChoices(args['id']),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('No data avilable');
          items = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data[0]['title']),
            ),
            body: Center(
                child: Text(
              selecedItem.isNotEmpty
                  ? selecedItem
                  : 'shake to choose a item from this list',
              style: TextStyle(fontSize: 20.0),
            )),
          );
        });
  }
}
