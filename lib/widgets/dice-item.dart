import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/pages/editor.page.dart';
import 'package:coolflutterapp/pages/play.page.dart';
import 'package:coolflutterapp/source/models/choice.model.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:coolflutterapp/utils/actionmenu.dart';
import 'package:coolflutterapp/utils/fade-transition.dart';
import 'package:coolflutterapp/widgets/tag.dart';
import 'package:coolflutterapp/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiceItem extends StatelessWidget {
  final Dice dice;
  final Function onDelete;
  final Function onTimeOut;

  const DiceItem({Key key, this.dice, this.onDelete, this.onTimeOut});

  @override
  Widget build(BuildContext context) {
    var dicesModel = Provider.of<DicesModel>(context, listen: false);

    Choice chosenItem =
        dice.choices.firstWhere((d) => d.isPicked == true, orElse: () => null);
    return TweenAnimationBuilder(
        duration: Duration(milliseconds: 400),
        tween: Tween<double>(begin: 0, end: 10),
        builder: (context, double val, child) {
          return Opacity(
            opacity: val * 0.1,
            child: Container(
              margin: EdgeInsets.only(
                bottom: val,
                left: 20,
                right: 20,
              ),
              child: GestureDetector(
                child: Card(
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (chosenItem != null) Tag('${chosenItem.name}'),
                              Text(
                                dice.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    color: choosyColors['title']),
                              ),
                              Text(
                                '${dice.choices.length} choices',
                                style:
                                    TextStyle(color: choosyColors['subtitle']),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(0),
                              child: IconButton(
                                  // padding: EdgeInsets.all(0),
                                  alignment: Alignment.topRight,
                                  icon: Icon(
                                    Icons.more_horiz,
                                    color: choosyColors['heading']
                                        .withOpacity(0.5),
                                  ),
                                  onPressed: () {
                                    actionMenu(
                                        context: context,
                                        onDelete: () async {
                                          await dicesModel.deleteDice(dice.id);
                                          onDelete(dice.title);
                                          Navigator.pop(context);
                                        },
                                        onEdit: () {
                                          dicesModel.activeDiceID = dice.id;
                                          Navigator.pop(context);
                                          Navigator.push(context,
                                              FadeRoute(page: EditorPage()));
                                        });
                                  }),
                            ),
                            if (dice.lastPlayedTime != null)
                              NextPickTimer(
                                  onDone: onTimeOut,
                                  timeInMs: dice.lastPlayedTime),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  // Navigator.pushNamed(context, '/play', arguments: {'id': dice.id});
                  dicesModel.activeDiceID = dice.id;
                  Navigator.push(
                    context,
                    FadeRoute(page: PlayPage(activeDiceID: dice.id)),
                  );
                },
              ),
            ),
          );
        });
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
