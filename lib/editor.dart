import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/config/icons.dart';
import 'package:coolflutterapp/dao/dice.dao.dart';
import 'package:coolflutterapp/models/choice.model.dart';
import 'package:coolflutterapp/models/dice.model.dart';
import 'package:coolflutterapp/utils/notify.dart';
import 'package:coolflutterapp/utils/sheet.dart';
import 'package:coolflutterapp/widgets/blank-dice.dart';
import 'package:coolflutterapp/widgets/choiceslist.dart';
import 'package:coolflutterapp/widgets/editable-heading.dart';
import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  Map updatedDice;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic args =
        updatedDice ?? ModalRoute.of(context).settings.arguments;

    return FutureBuilder(
      future: DiceDao().getADice(args['id']),
      builder: (ctx, snapshot) {
        var dice = snapshot.hasData ? snapshot.data.value : {};
        bool hasChoices = dice['choices'] != null && dice['choices'].length > 0;
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
                  onPressed: () async {
                    await _openForm(context, args);
                  },
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
                dice['title'],
                onEnter: (text) async {
                  if (dice['title'] != null) {
                    await DiceDao()
                        .updateDice(Dice(title: '$text', id: dice['id']));
                    setState(() {});
                  } else {
                    String newId =
                        await DiceDao().insertDice(Dice(title: '$text'));
                    setState(() {
                      updatedDice = {'id': newId};
                    });
                  }
                },
              ),
              Container(
                  child: !hasChoices
                      ? Expanded(
                          child: BlankDice(
                            onClick: () async {
                              _openForm(context, args);
                            },
                          ),
                        )
                      : Expanded(
                          child: Builder(
                            builder: (context) {
                              return ChoicesList(
                                  id: dice['id'],
                                  data: dice['choices'],
                                  onRemove: (id, item) async {
                                    await DiceDao()
                                        .deleteChoice(id, item['id']);
                                    notify(
                                        context, '${item['name']} deleted!!');
                                    setState(() {});
                                  });
                            },
                          ),
                        )),
            ],
          ),
        );
      },
    );
  }

  Future _openForm(BuildContext context, args) async {
    await formSheet(
        context: context,
        defaultValue: null,
        titleName: "Add Choice",
        shouldCloseAfterAdd: false,
        onEnter: (text) async {
          await DiceDao().insertChoice(args['id'], Choice(name: '$text'));
          setState(() {});
        });
  }
}
