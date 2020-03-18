import 'package:coolflutterapp/utils/sheet.dart';
import 'package:flutter/material.dart';

class EditableHeading extends StatelessWidget {
  final String heading;
  final Function onEnter;
  const EditableHeading(this.heading, {this.onEnter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        // color: choosyColors['tile'],
        child: Text(
          heading ?? 'Whats for lunch?',
          softWrap: true,
          style: TextStyle(
            // fontFamily: 'Gilroy',
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
      onTap: () async {
        await formSheet(
            context: context,
            defaultValue: heading ?? '',
            placeholderText: 'type new dice name...',
            titleName: "Dice name",
            onEnter: onEnter);
      },
    );
  }
}
