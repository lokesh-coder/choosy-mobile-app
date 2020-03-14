import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/widgets/button.dart';
import 'package:flutter/material.dart';

class BlankDice extends StatelessWidget {
  final Function onClick;
  const BlankDice({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            softWrap: true,
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Add choices to the list. You have to ',
              style: TextStyle(color: choosyColors['text']),
              children: <TextSpan>[
                TextSpan(
                    text: 'add atleast 2 choices ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' to play this item!'),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Button(
            'create a item',
            onTap: onClick,
          )
        ],
      ),
    );
  }
}
