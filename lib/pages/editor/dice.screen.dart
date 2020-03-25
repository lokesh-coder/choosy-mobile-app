import 'package:choosy/config/app-config.dart';
import 'package:choosy/config/icons.dart';
import 'package:choosy/source/models/dice.model.dart';
import 'package:choosy/source/models/dices.model.dart';
import 'package:choosy/utils/notify.dart';
import 'package:choosy/utils/toast.dart';
import 'package:choosy/widgets/app-shell.dart';
import 'package:choosy/widgets/blank-dice.dart';
import 'package:choosy/widgets/choices-list.dart';
import 'package:choosy/widgets/editable-heading.dart';
import 'package:choosy/widgets/header.dart';
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
            color: Colors.white.withOpacity(0.7),
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
              ChoosyIcon.add_fill,
              color: Colors.white.withOpacity(0.7),
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
                                notify(context, '${item.name} deleted!');
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
                appConfig['label.choicesInfo'],
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
