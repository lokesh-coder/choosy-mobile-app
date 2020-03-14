import 'package:coolflutterapp/dao/dice.dao.dart';
import 'package:coolflutterapp/models/dice.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DiceItem extends StatelessWidget {
  final Dice dice;
  final Function onDelete;

  DiceItem({this.dice, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: FlutterLogo(),
            title: Text(dice.title),
            subtitle: Text('${dice.choices.length} choices'),
            onTap: () {
              Navigator.pushNamed(context, '/play', arguments: {'id': dice.id});
            },
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () async {
              await DiceDao().delete(Dice(id: dice.id));
              onDelete(dice.title);
            },
          ),
          IconSlideAction(
            caption: 'Edit',
            color: Colors.blue,
            icon: Icons.edit,
            onTap: () {
              Navigator.pushNamed(context, '/editor',
                  arguments: {'id': dice.id});
            },
          ),
        ],
      ),
    );
  }
}
