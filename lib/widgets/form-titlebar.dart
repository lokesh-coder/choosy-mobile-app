import 'package:coolflutterapp/config/app-config.dart';
import 'package:coolflutterapp/config/colors.dart';
import 'package:flutter/material.dart';

class FormTitleBar extends StatefulWidget {
  final String title;

  FormTitleBar({this.title});

  @override
  _FormTitleBarState createState() => _FormTitleBarState();
}

class _FormTitleBarState extends State<FormTitleBar> {
  bool isHelpOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Icon(
                Icons.add,
                color: Color(0xFFAD548E),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    color: choosyColors['heading'],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: choosyColors['heading'].withOpacity(0.2),
                    ),
                    onPressed: () {
                      setState(() {
                        isHelpOpen = !isHelpOpen;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          _showHelp()
        ],
      ),
    );
  }

  _showHelp() {
    if (!isHelpOpen) return Container();
    if (widget.title == 'Card name') {
      return Text(
        appConfig['label.cardCreateInfo'],
        style: TextStyle(
            color: choosyColors['heading'].withOpacity(0.5), fontSize: 12),
      );
    } else {
      return Text(
        appConfig['label.choiceCreateInfo'],
        style: TextStyle(
            color: choosyColors['heading'].withOpacity(0.5), fontSize: 12),
      );
    }
  }
}
