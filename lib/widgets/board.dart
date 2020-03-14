import 'package:coolflutterapp/models/choice.model.dart';
import 'package:coolflutterapp/widgets/timer.dart';
import 'package:flutter/material.dart';

class PickBoard extends StatelessWidget {
  final List<Choice> choices;
  final List<dynamic> selection;
  final Function onDone;

  PickBoard({Key key, this.choices, this.selection, this.onDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var displayWidget;

    print('ccccc $selection');

    if (choices.length < 2) {
      displayWidget = Text('Need at least two items to play ');
    } else if (selection == null) {
      displayWidget = Text('shake to choose a item from this list');
    } else if (selection[0] != null && selection[1] != null) {
      displayWidget = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${selection[0]} was already choosen'),
          NextPickTimer(
            time: DateTime.parse(
                    DateTime.fromMillisecondsSinceEpoch(selection[1])
                        .toString())
                .add(Duration(minutes: 1)),
            onDone: onDone,
          )
        ],
      );
    }

    return displayWidget;
  }
}
