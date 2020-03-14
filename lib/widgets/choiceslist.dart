import 'package:flutter/material.dart';

class ChoicesList extends StatelessWidget {
  final List data;
  final String id;
  final Function onRemove;

  ChoicesList({Key key, this.id, this.data, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return ListTile(
            leading: FlutterLogo(),
            title: Text(data[index]['name']),
            trailing: IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                onRemove(id, data[index]);
              },
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
