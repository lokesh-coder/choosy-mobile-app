import 'package:choosy/config/app-config.dart';
import 'package:choosy/utils/sheet.dart';
import 'package:flutter/material.dart';

class EditableHeading extends StatelessWidget {
  final String heading;
  final Function onEnter;
  const EditableHeading(this.heading, {this.onEnter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          heading ?? appConfig['label.noTitle'],
          softWrap: true,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ),
      onTap: () async {
        await formSheet(
          context: context,
          defaultValue: heading ?? '',
          placeholderText: appConfig['label.cardInputPlaceholder'],
          titleName: appConfig['label.cardInputHeading'],
          onEnter: onEnter,
        );
      },
    );
  }
}
