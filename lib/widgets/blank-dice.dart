import 'package:coolflutterapp/config/app-config.dart';
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
              text: appConfig['label.noChoice'][0],
              style: TextStyle(color: choosyColors['text']),
              children: <TextSpan>[
                TextSpan(
                    text: appConfig['label.noChoice'][1],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                  text: appConfig['label.noChoice'][2],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Button(
            appConfig['label.addChoice'],
            onTap: onClick,
          )
        ],
      ),
    );
  }
}
