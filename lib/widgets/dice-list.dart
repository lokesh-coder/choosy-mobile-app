import 'package:coolflutterapp/dao/dice.dao.dart';
import 'package:coolflutterapp/utils/notify.dart';
import 'package:coolflutterapp/widgets/dice-item.dart';
import 'package:flutter/material.dart';

class DiceList extends StatefulWidget {
  const DiceList({Key key}) : super(key: key);

  @override
  _DiceListState createState() => _DiceListState();
}

class _DiceListState extends State<DiceList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder(
          future: DiceDao().getAllDices(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return DiceItem(
                        dice: snapshot.data[index],
                        onTimeOut: () {
                          setState(() {});
                        },
                        onDelete: (name) {
                          notify(context, '$name deleted!!');
                          setState(() {});
                        });
                  },
                ),
              );
            } else {
              return Text('loading...');
            }
          }),
    );
  }
}
