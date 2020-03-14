import 'package:coolflutterapp/dao/dice.dao.dart';
import 'package:coolflutterapp/models/choice.model.dart';
import 'package:coolflutterapp/models/dice.model.dart';
import 'package:coolflutterapp/utils/notify.dart';
import 'package:coolflutterapp/utils/sheet.dart';
import 'package:coolflutterapp/widgets/blank-dice.dart';
import 'package:coolflutterapp/widgets/choiceslist.dart';
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

        print('got error $dice $args');
        return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              child: Text(dice['title'] ?? 'Add new Dice'),
              onTap: () async {
                await formSheet(
                    context: context,
                    defaultValue: dice['title'] ?? '',
                    placeholderText: 'type new dice name...',
                    titleName: "Dice name",
                    shouldCloseAfterAdd: true,
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
                    });
              },
            ),
            actions: <Widget>[
              Visibility(
                visible: dice['title'] != null,
                maintainState: true,
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await formSheet(
                        context: context,
                        defaultValue: null,
                        titleName: "Add Choice",
                        shouldCloseAfterAdd: false,
                        onEnter: (text) async {
                          await DiceDao()
                              .insertChoice(args['id'], Choice(name: '$text'));
                          setState(() {});
                        });
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: Container(
              child: dice['choices'] == null
                  ? BlankDice(
                      onClick: () {},
                    )
                  : Builder(
                      builder: (context) {
                        return ChoicesList(
                            id: dice['id'],
                            data: dice['choices'],
                            onRemove: (id, item) async {
                              await DiceDao().deleteChoice(id, item['id']);
                              notify(context, '${item['name']} deleted!!');
                              setState(() {});
                            });
                      },
                    )),
        );
      },
    );
  }
}
