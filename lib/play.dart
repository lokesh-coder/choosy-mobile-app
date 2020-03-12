import "dart:math";
import 'package:coolflutterapp/db/choosy.db.dart';
import 'package:coolflutterapp/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shake_plugin/flutter_shake_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayScreen extends StatefulWidget {
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  FlutterShakePlugin _shakePlugin;
  final _random = new Random();
  List items = [];
  String selecedItem = '';

  @override
  void initState() {
    super.initState();
    _shakePlugin = FlutterShakePlugin(
      shakeThresholdGravity: 30.0,
      vibrateDuration: 100,
      onPhoneShaken: () {
        _prefs.then((prefs) {
          if (items.isNotEmpty) {
            var playedPick = prefs.get('pick-${items[0]['id'].toString()}');

            if (playedPick == null) {
              selecedItem = items[_random.nextInt(items.length)]['choice'];

              prefs.setStringList('pick-${items[0]['id'].toString()}', [
                selecedItem,
                DateTime.now().add(new Duration(minutes: 1)).toString()
              ]).then((p) {
                print('phone shakes $selecedItem');
                setState(() {});
              });
            } else {
              print('playedpick $playedPick');
              int timeDiff = DateTime.parse(playedPick[1])
                  .difference(DateTime.now())
                  .inMilliseconds;
              print('diff - $timeDiff');
              if (timeDiff < 0) {
                prefs
                    .remove('pick-${items[0]['id'].toString()}')
                    .then((isRemoved) {
                  print('key removed');
                  setState(() {});
                });
              }
            }
          }
        });
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
          if (!snapshot.hasData) return Text('No data avilable');
          items = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                title: Text(snapshot.data[0]['title']),
              ),
              body: FutureBuilder(
                builder: (ctx, AsyncSnapshot<SharedPreferences> sh) {
                  var selected;
                  if (sh.hasData) {
                    selected = sh.data.getStringList(
                        'pick-${snapshot.data[0]['id'].toString()}');
                  }

                  return Center(
                      child: snapshot.data.length < 2
                          ? Text('Need at least two items to play ')
                          : Column(
                              children: <Widget>[
                                Text(
                                  selected != null
                                      ? '${selected[0]} was already choosen'
                                      : 'shake to choose a item from this list',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                selected != null
                                    ? NextPickTimer(
                                        time: DateTime.parse(selected[1]),
                                        onDone: () {
                                          print('ondone...');
                                          setState(() {});
                                        },
                                      )
                                    : Text('-0-'),
                              ],
                            ));
                },
                future: _prefs,
              ));
        });
  }
}
