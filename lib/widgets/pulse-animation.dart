import 'dart:math';

import 'package:choosy/config/colors.dart';
import 'package:flutter/material.dart';

class PulseAnimation extends StatefulWidget {
  final String text;
  final TextStyle style;

  PulseAnimation({this.text, this.style});

  @override
  _PulseAnimationState createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with TickerProviderStateMixin {
  Color color = choosyColors['heading'].withOpacity(0.2);
  AnimationController animationController;
  Animation<Color> colorAnimation;
  Animation<double> pulseAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    colorAnimation = ColorTween(
      begin: choosyColors['heading'].withOpacity(0.2),
      end: choosyColors['primary'],
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));

    pulseAnimation = Tween(begin: 1.0, end: 1.2).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));

    animationController.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Transform.scale(
          scale: sin(pi * 0.97 * animationController.value) + 1,
          origin: Offset(0, 0),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: widget.style.copyWith(color: colorAnimation.value),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }
}
