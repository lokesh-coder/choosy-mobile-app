import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/utils/sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class EditableHeading extends StatelessWidget {
  final String heading;
  final Function onEnter;
  const EditableHeading(this.heading, {this.onEnter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: choosyColors['tile'],
        padding: EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.center,
          child: DottedBorder(
            dashPattern: [6, 3],
            color: choosyColors['text'],
            padding: EdgeInsets.all(10),
            child: Text(heading ?? 'Whats the best fit for office today?',
                softWrap: true,
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: choosyColors['heading'])),
          ),
        ),
      ),
      onTap: () async {
        await formSheet(
            context: context,
            defaultValue: heading ?? '',
            placeholderText: 'type new dice name...',
            titleName: "Dice name",
            shouldCloseAfterAdd: true,
            onEnter: onEnter);
      },
    );
  }
}
