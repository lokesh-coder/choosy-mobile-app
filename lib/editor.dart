import 'dart:math';
import 'package:coolflutterapp/db/choosy.db.dart';
import 'package:coolflutterapp/sheet.dart';
import 'package:coolflutterapp/widgets/choiceslist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  List<String> items = [];
  String title;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ChoosyDatabase db = Provider.of<ChoosyDatabase>(context);
    final dynamic args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<dynamic>(
            stream: db.watchPickWithChoices(args['id']),
            builder: (context, snapshot) {
              return GestureDetector(
                child: Text(snapshot.data.length > 0
                    ? snapshot.data[0]['title']
                    : 'Add new action'),
                onTap: () async {
                  await formSheet(
                      context: context,
                      defaultValue: title ?? '',
                      titleName: "Add new card",
                      shouldCloseAfterAdd: true,
                      onEnter: (text) async {
                        print('you have entered $text');
                        await db.addPick(Pick(title: '$text'));
                        setState(() {});
                      });
                },
              );
            }),
        actions: <Widget>[
          IconButton(
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
                    await db.addChoiceEntry(
                        Choice(choice: '$text', pid: args['id']));
                    setState(() {});
                  });
            },
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
          child: StreamBuilder(
              stream: db.watchPickWithChoices(args['id']),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ChoicesList(
                    data: snapshot.data,
                  );
                } else
                  return Text('loading...');
              })),
    );
  }
}
