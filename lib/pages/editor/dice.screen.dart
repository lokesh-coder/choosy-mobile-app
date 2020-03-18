import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:coolflutterapp/utils/notify.dart';
import 'package:coolflutterapp/widgets/app-shell.dart';
import 'package:coolflutterapp/widgets/blank-dice.dart';
import 'package:coolflutterapp/widgets/choices-list.dart';
import 'package:coolflutterapp/widgets/editable-heading.dart';
import 'package:coolflutterapp/widgets/header.dart';
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
    return AppShell(
      header: Header(
        title: EditableHeading(
          dice.title,
          onEnter: onAdd,
        ),
        leading: IconButton(
          icon: Icon(
            ChoosyIcon.arrow_left_line,
            color: Colors.white.withOpacity(0.5),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        action: Visibility(
          visible: hasChoices,
          maintainState: true,
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white.withOpacity(0.5),
            ),
            onPressed: onFormOpen,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
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
                  ),
          ),
        ],
      ),
      footer: (hasChoices)
          ? Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Tap on the title to edit it. Click plus icon in the top to add new choice.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            )
          : null,
    );
  }
}
