import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/pages/editor.page.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:coolflutterapp/utils/sheet.dart';
import 'package:coolflutterapp/widgets/button.dart';
import 'package:coolflutterapp/widgets/headlines.dart';
import 'package:coolflutterapp/widgets/illustration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeEmptyStateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dicesModel = Provider.of<DicesModel>(context, listen: false);
    return Scaffold(
      body: Container(
        color: choosyColors['bg'],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // margin: MediaQuery.of(context).padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Illustration('intro'),
            Headlines(
              'Don’t think too much!',
              'Create a list and pick a random item',
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              'create a list',
              onTap: () async {
                await formSheet(
                    context: context,
                    defaultValue: '',
                    placeholderText: 'type new dice name...',
                    titleName: "Dice name",
                    shouldCloseAfterAdd: true,
                    onEnter: (text) async {
                      dicesModel.activeDiceID = null;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditorPage()),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
