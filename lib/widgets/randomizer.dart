import 'dart:math';

import 'package:coolflutterapp/config/colors.dart';
import 'package:coolflutterapp/source/models/choice.model.dart';
import 'package:flutter/material.dart';

class Randomzer extends StatefulWidget {
  final List items;
  final TextStyle style;
  final Function onRandomPick;
  Randomzer({this.items, this.style = const TextStyle(), this.onRandomPick});

  @override
  _RandomzerState createState() => _RandomzerState();
}

class _RandomzerState extends State<Randomzer> {
  var clr = choosyColors['heading'].withOpacity(0.2);
  var chosenItem;

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
        Choice randomPick = _getRandomItem(widget.items);
        return Text(
          chosenItem == null ? randomPick.name : chosenItem,
          maxLines: 1,
          style: widget.style.copyWith(
            letterSpacing: val * 0.001,
            color: clr,
          ),
        );
      },
      onEnd: () {
        setState(() {
          clr = choosyColors['primary'];
          var chosen = _getRandomItem(widget.items);
          chosenItem = chosen.name;
          widget.onRandomPick(chosen);
        });
      },
    );
  }
}
