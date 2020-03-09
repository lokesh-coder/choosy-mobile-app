import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Add new action'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
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
                                title != null ? "Action name" : "Title",
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
                                          items.insert(0, inpText);
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
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              leading: FlutterLogo(),
              title: Text(items[index]),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  var itm;
                  setState(() {
                    itm = items[index];
                    items.removeAt(index);
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
      ),
    );
  }
}
