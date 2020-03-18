import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/source/models/dices.model.dart';
import 'package:coolflutterapp/utils/notify.dart';
import 'package:coolflutterapp/widgets/dice-item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiceList extends StatelessWidget {
  const DiceList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('widget: dicelist');
    return Container(
      color: choosyColors['bg'],
      child: Consumer<DicesModel>(
          builder: (context, DicesModel dicesModel, child) {
        return Container(
          child: ListView.builder(
            itemCount: dicesModel.dices.length,
            addAutomaticKeepAlives: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext ctxt, int index) {
              return DiceItem(
                  key: Key('$index'),
                  dice: dicesModel.dices[index],
                  onTimeOut: () {
                    dicesModel.clearLastPlayedTime(dicesModel.dices[index].id);
                  },
                  onDelete: (name) {
                    notify(context, '$name deleted!!');
                  });
            },
          ),
        );
      }),
    );
  }
}
