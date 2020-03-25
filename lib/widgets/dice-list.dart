import 'package:choosy/config/colors.dart';
import 'package:choosy/source/models/dices.model.dart';
import 'package:choosy/utils/notify.dart';
import 'package:choosy/widgets/dice-item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    notify(context, '$name deleted!');
                  });
            },
          ),
        );
      }),
    );
  }
}
