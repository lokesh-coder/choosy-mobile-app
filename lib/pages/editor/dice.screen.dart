import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/source/dao/dice.dao.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:coolflutterapp/utils/notify.dart';
import 'package:coolflutterapp/widgets/blank-dice.dart';
import 'package:coolflutterapp/widgets/choices-list.dart';
import 'package:coolflutterapp/widgets/editable-heading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiceScreen extends StatelessWidget {
  final Dice dice;
  final Function onAdd;
  final Function onFormOpen;
  DiceScreen({this.dice, this.onAdd, this.onFormOpen});

  @override
  Widget build(BuildContext context) {
    bool hasChoices = dice.choices != null && dice.choices.length > 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: choosyColors['tile'],
        leading: IconButton(
          icon: Icon(
            ChoosyIcon.arrow_left_line,
            color: choosyColors['text'],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          Visibility(
            visible: hasChoices,
            maintainState: true,
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: choosyColors['text'],
              ),
              onPressed: onFormOpen,
            ),
          ),
          IconButton(
            icon: Icon(
              ChoosyIcon.settings_3_line,
              color: choosyColors['text'],
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          EditableHeading(
            dice.title,
            onEnter: onAdd,
          ),
          Container(
              child: !hasChoices
                  ? Expanded(
                      child: BlankDice(
                        onClick: onFormOpen,
                      ),
                    )
                  : Expanded(
                      child: Builder(
                        builder: (context) {
                          return Consumer<DicesModel>(
                              builder: (context, DicesModel dicesModel, child) {
                            return ChoicesList(
                                id: dice.id,
                                data: dice.choices,
                                onRemove: (id, item) async {
                                  await dicesModel.deleteChoice(id, item.id);
                                  notify(context, '${item.name} deleted!!');
                                });
                          });
                        },
                      ),
                    )),
        ],
      ),
    );
  }
}
