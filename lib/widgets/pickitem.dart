import 'package:coolflutterapp/db/choosy.db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class PickItem extends StatelessWidget {
  final Pick pick;

  PickItem({this.pick});

  @override
  Widget build(BuildContext context) {
    final ChoosyDatabase db = Provider.of<ChoosyDatabase>(context);
    return Container(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: FlutterLogo(),
            title: Text(pick.title),
            onTap: () {
              Navigator.pushNamed(context, '/play', arguments: {'id': pick.id});
            },
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () async {
              await db.deletePick(pick.id);
            },
          ),
          IconSlideAction(
            caption: 'Edit',
            color: Colors.blue,
            icon: Icons.edit,
            onTap: () {
              Navigator.pushNamed(context, '/editor',
                  arguments: {'id': pick.id});
            },
          ),
        ],
      ),
    );
  }
}
