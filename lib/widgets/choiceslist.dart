import 'package:coolflutterapp/db/choosy.db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoicesList extends StatelessWidget {
  final List data;

  ChoicesList({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChoosyDatabase db = Provider.of<ChoosyDatabase>(context);
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return ListTile(
            leading: FlutterLogo(),
            title: Text(data[index]['choice']),
            trailing: IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                db.deleteChoice(data[index]['cid']);
                Scaffold.of(ctxt).showSnackBar(SnackBar(
                  content: Text("${data[index]['choice']} dismissed"),
                  duration: Duration(milliseconds: 500),
                ));
              },
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
