import 'dart:math';
import 'package:choosy/config/colors.dart';
import 'package:choosy/source/models/choice.model.dart';
import 'package:flutter/material.dart';

class Randomzer extends StatelessWidget {
  final List items;
  final TextStyle style;
  final Function onRandomPick;
  Randomzer({this.items, this.style = const TextStyle(), this.onRandomPick});

  _getRandomItem(list) {
    final _random = new Random();
    return list[_random.nextInt(list.length)];
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: -3000, end: 1000),
      duration: Duration(seconds: 2),
      builder: (BuildContext context, double val, Widget child) {
        Choice randomPick = _getRandomItem(items);
        return Text(
          randomPick.name,
          maxLines: 1,
          style: style.copyWith(
            letterSpacing: val * 0.001,
            color: choosyColors['heading'].withOpacity(0.2),
          ),
        );
      },
      onEnd: () {
        var chosen = _getRandomItem(items);
        onRandomPick(chosen);
      },
    );
  }
}
