import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/dao/dice.dao.dart';
import 'package:coolflutterapp/models/choice.model.dart';
import 'package:coolflutterapp/models/dice.model.dart';
import 'package:coolflutterapp/utils/actionmenu.dart';
import 'package:coolflutterapp/widgets/tag.dart';
import 'package:coolflutterapp/widgets/timer.dart';
import 'package:flutter/material.dart';

class DiceItem extends StatelessWidget {
  final Dice dice;
  final Function onDelete;
  final Function onTimeOut;

  DiceItem({this.dice, this.onDelete, this.onTimeOut});

  @override
  Widget build(BuildContext context) {
    Choice chosenItem =
        dice.choices.firstWhere((d) => d.isPicked == true, orElse: () => null);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: GestureDetector(
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            color: choosyColors['tile'],
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (chosenItem != null) Tag('${chosenItem.name}'),
                      Text(
                        dice.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: choosyColors['title']),
                      ),
                      Text(
                        '${dice.choices.length} choices',
                        style: TextStyle(color: choosyColors['subtitle']),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          ChoosyIcon.more_fill,
                        ),
                        onPressed: () {
                          actionMenu(
                              context: context,
                              onDelete: () async {
                                await DiceDao().delete(Dice(id: dice.id));
                                onDelete(dice.title);
                                Navigator.pop(context);
                              },
                              onEdit: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/editor',
                                    arguments: {'id': dice.id});
                              });
                        }),
                    if (dice.lastPlayedTime != null)
                      NextPickTimer(
                          onDone: onTimeOut, timeInMs: dice.lastPlayedTime),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/play', arguments: {'id': dice.id});
        },
      ),
    );
  }
}
