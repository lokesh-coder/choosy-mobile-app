import 'dart:math';
import 'package:coolflutterapp/db/choosy.db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  List<String> items = [];
  String title;

  final inpController = TextEditingController();
  var inpText = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ChoosyDatabase choosyDatabase = Provider.of<ChoosyDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Text(title ?? 'Add new action'),
          onTap: () async {
            print("onTap called.");
            await buildShowModalBottomSheet(
                context, choosyDatabase, "Add Title", title);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () async {
              await buildShowModalBottomSheet(
                  context, choosyDatabase, "Add choice", null);
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
              stream: choosyDatabase.watchChoices(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print('==> ${snapshot.data}');
                  return buildContainer(snapshot.data);
                } else
                  return Text('loading...');
              })),
    );
  }

  buildShowModalBottomSheet(BuildContext context, ChoosyDatabase choosyDatabase,
      String titleName, String defaultValue) async {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          inpController.text = defaultValue ?? '';
          inpController.selection = TextSelection.fromPosition(
            TextPosition(offset: inpController.text.length),
          );
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      titleName,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 24.0,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                          controller: inpController,
                          autofocus: true,
                          decoration: InputDecoration(),
                          onChanged: (text) {
                            inpText = text;
                          },
                        )),
                        IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () async {
                              inpController.clear();
                              if (title != null) {
                                // items.insert(0, inpText);
                                await choosyDatabase
                                    .addChoiceEntry(Choice(choice: '$inpText'));
                              } else {
                                title = inpText;
                              }

                              inpText = '';
                              setState(() {});
                            })
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Container buildContainer(data) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return ListTile(
            leading: FlutterLogo(),
            title: Text(data[index].choice),
            trailing: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                var itm;
                setState(() {
                  itm = data[index].choice;
                  data.removeAt(index);
                });
                Scaffold.of(ctxt).showSnackBar(SnackBar(
                  content: Text("$itm dismissed"),
                  duration: Duration(milliseconds: 500),
                ));
              },
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
