import 'package:coolflutterapp/widgets/timer.dart';
import 'package:flutter/material.dart';

class PickBoard extends StatelessWidget {
  List choices;
  List<String> selection;
  Function onDone;

  PickBoard({Key key, this.choices, this.selection, this.onDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var displayWidget;

    if (choices.length < 2) {
      displayWidget = Text('Need at least two items to play ');
    } else if (selection == null) {
      displayWidget = Text('shake to choose a item from this list');
    } else if (selection != null) {
      displayWidget = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${selection[0]} was already choosen'),
          NextPickTimer(
            time: DateTime.parse(selection[1]),
            onDone: onDone,
          )
        ],
      );
    }

    return displayWidget;
  }
}
