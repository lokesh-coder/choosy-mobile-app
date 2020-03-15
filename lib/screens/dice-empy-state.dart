import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/dao/dice.dao.dart';
import 'package:coolflutterapp/models/dice.model.dart';
import 'package:coolflutterapp/utils/sheet.dart';
import 'package:coolflutterapp/widgets/button.dart';
import 'package:coolflutterapp/widgets/headlines.dart';
import 'package:coolflutterapp/widgets/illustration.dart';
import 'package:flutter/material.dart';

class DiceEmptyStateScreen extends StatelessWidget {
  const DiceEmptyStateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      String id =
                          await DiceDao().insertDice(Dice(title: '$text'));

                      Navigator.pushNamed(context, '/editor',
                          arguments: {'id': id});
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
