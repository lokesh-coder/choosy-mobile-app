import "dart:math";
import 'package:coolflutterapp/db/choosy.db.dart';
import 'package:coolflutterapp/utils/settings.dart';
import 'package:coolflutterapp/widgets/board.dart';
import 'package:coolflutterapp/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shake_plugin/flutter_shake_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayScreen extends StatefulWidget {
  Settings settings = Settings();
  Random random = new Random();
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  FlutterShakePlugin _shakePlugin;
  List items = [];
  String selecedItem = '';

  @override
  void initState() {
    super.initState();
    _shakePlugin = FlutterShakePlugin(
      shakeThresholdGravity: 30.0,
      vibrateDuration: 100,
      onPhoneShaken: () {
        if (items.isEmpty) return;
        String pickname = items[0]['id'].toString();

        (() async {
          List<String> playedPick =
              await widget.settings.getPlayedPick(pickname);

          if (playedPick == null) {
            selecedItem = items[widget.random.nextInt(items.length)]['choice'];
            await widget.settings.savePlayedPick(pickname, selecedItem);
            setState(() {});
          }
        })();
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

    return FutureBuilder(
        future: db.getPickWithChoices(args['id']),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('loading...');
          items = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                title:
                    Text(items.length > 0 ? items[0]['title'] : 'no choices'),
              ),
              body: FutureBuilder(
                builder: (ctx, AsyncSnapshot<SharedPreferences> sh) {
                  var selected, pickname;
                  if (sh.hasData && items.length > 0) {
                    pickname = items[0]['id'].toString();
                    selected = sh.data.getStringList('pick-$pickname');
                  }

                  return Center(
                      child: PickBoard(
                    choices: snapshot.data,
                    selection: selected,
                    onDone: () => setState(() {
                      widget.settings.removePlayedPick(pickname);
                    }),
                  ));
                },
                future: _prefs,
              ));
        });
  }
}
