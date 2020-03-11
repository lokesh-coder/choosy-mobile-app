import 'package:coolflutterapp/db/choosy.db.dart';
import 'package:coolflutterapp/widgets/pickitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PicksList extends StatelessWidget {
  const PicksList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChoosyDatabase db = Provider.of<ChoosyDatabase>(context);
    return Container(
      child: StreamBuilder(
          stream: db.watchPicks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return PickItem(pick: snapshot.data[index]);
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
